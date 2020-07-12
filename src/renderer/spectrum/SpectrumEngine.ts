import { ZxSpectrumBase } from "../../native/ZxSpectrumBase";
import {
  ExecutionState,
  ExecutionStateChangedArgs,
} from "../../shared/spectrum/execution-state";
import { ILiteEvent, LiteEvent } from "../../shared/utils/LiteEvent";
import {
  ExecuteCycleOptions,
  ExecutionCompletionReason,
  SpectrumMachineState,
  EmulationMode,
  DebugStepMode,
} from "../../native/machine-state";

/**
 * This class represents the engine of the ZX Spectrum,
 * which runs within the main process.
 */
export class SpectrumEngine {
  private _vmState: ExecutionState = ExecutionState.None;
  private _isFirstStart: boolean = false;
  private _isFirstPause: boolean = false;
  private _executionCycleError: Error | undefined;
  private _cancelled: boolean = false;
  private _justRestoredState: boolean = false;

  private _executionStateChanged = new LiteEvent<ExecutionStateChangedArgs>();
  private _screenRefreshed = new LiteEvent<void>();
  private _vmStoppedWithError = new LiteEvent<void>();
  private _beeperSamplesEmitted = new LiteEvent<number[]>();

  private _completionTask: Promise<void> | undefined;

  // --- The last loaded machine state
  private _loadedState: SpectrumMachineState;

  /**
   * Initializes the engine with the specified ZX Spectrum instance
   * @param spectrum Spectrum VM to use
   */
  constructor(public spectrum: ZxSpectrumBase) {
    this._loadedState = spectrum.getMachineState();
  }

  /**
   * Number of frame tacts
   */
  get tactsInFrame(): number {
    return this._loadedState.tactsInFrame;
  }

  /**
   * Width of the screen
   */
  get screenWidth(): number {
    return this._loadedState.screenWidth;
  }

  /**
   * Height of the screen
   */
  get screenHeight(): number {
    return this._loadedState.screenLines;
  }

  /**
   * The current state of the virtual machine
   */
  get executionState(): ExecutionState {
    return this._vmState;
  }
  set executionState(newState: ExecutionState) {
    const oldState = this._vmState;
    this._vmState = newState;
    this._executionStateChanged.fire(
      new ExecutionStateChangedArgs(oldState, newState)
    );
  }

  /**
   * Signs that this is the very first start of the
   * virtual machine
   */
  get isFirstStart(): boolean {
    return this._isFirstStart;
  }

  /**
   * Signs that this is the very first paused state
   * of the virtual machine
   */
  get isFirstPause(): boolean {
    return this._isFirstPause;
  }

  /**
   * Exception that has been raised during the execution
   */
  get executionCycleError(): Error | undefined {
    return this._executionCycleError;
  }

  /**
   * Has the execution been cancelled?
   */
  get cancelled(): boolean {
    return this._cancelled;
  }

  /**
   * Indicates if machine state has just been restored.
   */
  get justRestoredState(): boolean {
    return this._justRestoredState;
  }

  /**
   * This event is raised whenever the state of the virtual machine changes
   */
  get executionStateChanged(): ILiteEvent<ExecutionStateChangedArgs> {
    return this._executionStateChanged.expose();
  }

  /**
   * This event is raised when the screen of the virtual machine has
   * been refreshed
   */
  get screenRefreshed(): ILiteEvent<void> {
    return this._screenRefreshed.expose();
  }

  /**
   * This event is raised when a new beeper sample frame is emitted
   */
  get beeperSamplesEmitted(): ILiteEvent<number[]> {
    return this._beeperSamplesEmitted.expose();
  }

  /**
   * This event is raised when the engine stops because of an exception
   */
  get stoppedWithError(): ILiteEvent<void> {
    return this._vmStoppedWithError.expose();
  }

  /**
   * Gets the promise that represents completion
   */
  get completionTask(): Promise<void> | undefined {
    return this._completionTask;
  }

  /**
   * Starts the virtual machine and keeps it running
   */
  start(): void {
    this.run(new ExecuteCycleOptions())
  }

  /**
   * Starts the virtual machine in debugging mode
   */
  startDebugging(): void {
    this.run(new ExecuteCycleOptions(EmulationMode.Debugger, DebugStepMode.StopAtBreakpoint));
  }

  /**
   * Starts the virtual machine with the specified exeution options
   * @param options Execution options
   */
  run(options: ExecuteCycleOptions): void {
    if (this.executionState === ExecutionState.Running) {
      return;
    }

    // --- Prepare the machine to run
    this._isFirstStart =
      this.executionState === ExecutionState.None ||
      this.executionState === ExecutionState.Stopped;
    if (this._isFirstStart) {
      this.spectrum.reset();
    }

    // --- Execute a single cycle
    this.executionState = ExecutionState.Running;
    this._cancelled = false;
    this._completionTask = this.executeCycle(this, options);
  }

  /**
   * Pauses the running machine.
   */
  async pause(): Promise<void> {
    if (
      this.executionState === ExecutionState.None ||
      this.executionState === ExecutionState.Stopped ||
      this.executionState === ExecutionState.Paused
    ) {
      // --- Nothing to pause
      return;
    }

    if (!this._completionTask) {
      // --- No completion to wait for
      return;
    }

    // --- Prepare the machine to pause
    this.executionState = ExecutionState.Pausing;
    this._isFirstPause = this._isFirstStart;

    // --- Cancel the current execution cycle
    this._cancelled = true;
    await this._completionTask;
    this.executionState = ExecutionState.Paused;
  }

  async stop(): Promise<void> {
    // --- Stop only running machine
    switch (this._vmState) {
      case ExecutionState.None:
      case ExecutionState.Stopped:
        return;

      case ExecutionState.Paused:
        // --- The machine is paused, it can be quicky stopped
        this.executionState = ExecutionState.Stopping;
        this.executionState = ExecutionState.Stopped;
        break;

      default:
        // --- Initiate stop
        this.executionState = ExecutionState.Stopping;
        this._cancelled = true;
        await this._completionTask;
        this.executionState = ExecutionState.Stopped;
        break;
    }
  }

  /**
   * Executes the cycle of the Spectrum virtual machine
   * @param machine The virtual machine
   * @param options Execution options
   */
  async executeCycle(
    machine: SpectrumEngine,
    options: ExecuteCycleOptions
  ): Promise<void> {
    const state = machine.spectrum.getMachineState();
    // --- Store the start time of the frame
    const clockFreq = state.baseClockFrequency * state.clockMultiplier;
    const nextFrameGap = (state.tactsInFrame / clockFreq) * 1000;
    let nextFrameTime = performance.now() + nextFrameGap;

    // --- Execute the cycle until completed
    while (true) {
      machine.spectrum.executeCycle(options);

      // --- Check for user cancellation
      if (this._cancelled) return;

      const resultState = machine.spectrum.getMachineState();
      const reason = resultState.executionCompletionReason;
      if (reason !== ExecutionCompletionReason.UlaFrameCompleted) {
        // --- No more frame to execute
        if (
          reason === ExecutionCompletionReason.BreakpointReached ||
          reason === ExecutionCompletionReason.TerminationPointReached
        ) {
          machine.executionState = ExecutionState.Paused;
        }
        return;
      }

      // --- At this point we have not completed the execution yet
      // --- Initiate the refresh of the screen
      machine._screenRefreshed.fire();
      // TODO: Manage audio
      //   machine._vmBeeperSamplesEmitted.fire(
      //     machine.spectrum.api
      //   );
      //   if (machine.spectrumVm.soundDevice) {
      //     machine._vmSoundSamplesEmitted.fire(
      //       machine.spectrumVm.soundDevice.audioSamples
      //     );
      //   }
      const curTime = performance.now();
      const toWait = Math.floor(nextFrameTime - curTime);
      await delay(toWait - 2);
      nextFrameTime += nextFrameGap;

      /**
       * Delay for the specified amount of milliseconds
       * @param milliseconds Amount of milliseconds to delay
       */
      function delay(milliseconds: number): Promise<void> {
        return new Promise<void>((resolve) => {
          if (milliseconds < 0) {
            milliseconds = 0;
          }
          setTimeout(() => {
            resolve();
          }, milliseconds);
        });
      }
    }
  }
}
