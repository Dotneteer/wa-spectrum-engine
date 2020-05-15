import { Api } from "./api";
import { ASUtil } from "@assemblyscript/loader";
import { ZxSpectrumType } from "./ZxSpectrumType";
import {
  SpectrumState,
  Spectrum48State,
  readZ80CpuState,
  readScreenConfig,
  readExecutionCycleState,
  readSp48PortState,
  readInterruptState,
  readScreenState,
} from "../ui/SpectrumMachineState";
import { UiBinaryReader } from "../ui/UiBinaryReader";
import { ExecuteCycleOptions } from "../assembly/spectrum/machine/ExecuteCycleOptions";

export class TestSpectrum {
  /**
   * Initializes a test ZX Spectrum machine
   * @param moduleApi Module API obtained by the loader
   */
  constructor(
    public moduleApi: ASUtil & Api,
    public type: ZxSpectrumType = ZxSpectrumType.Spectrum48
  ) {
    this.init();
  }

  /**
   * Resets the test machine
   */
  init(): void {
    this.moduleApi.initSpectrumMachine(this.type);
  }

  /**
   * Resets the test machine
   */
  turnOn(): void {
    this.moduleApi.turnOnSpectrumMachine();
  }

  /**
   * Gets the current machine type
   */
  getMachineType(): ZxSpectrumType {
    return this.moduleApi.getCurrentMachineType();
  }

  /**
   * Gets the current state of the machine
   */
  getMachineState(): SpectrumState {
    const type = this.moduleApi.getCurrentMachineType();
    const statePtr = this.moduleApi.getSpectrumMachineState();
    const state = this.moduleApi.__getArray(statePtr);
    const r = new UiBinaryReader(new Uint8Array(state));
    switch (type) {
      default:
        return <Spectrum48State>{
          type: "48",
          cpu: readZ80CpuState(r),
          ulaIssue: r.readByte(),
          baseClockFrequency: r.readUint32(),
          clockMultiplier: r.readByte(),
          screenConfig: readScreenConfig(r),
          execCycleState: readExecutionCycleState(r),
          interruptState: readInterruptState(r),
          keyboardLineStatus: r.readBytes(),
          screenState: readScreenState(r),
          portState: readSp48PortState(r),
          memoryState: new Uint8Array(r.readBytes())
        };
    }
  }

  /**
   * Executes a ZX Spectrum cycle
   * @param options Cycle execution option
   */
  executeCycle(options: ExecuteCycleOptions): void {
    const module = this.moduleApi as any;
    const n = new module.ExecuteCycleOptions() as ExecuteCycleOptions;
    n.emulationMode = options.emulationMode;
    n.debugStepMode = options.debugStepMode;
    n.fastTapeMode = options.fastTapeMode;
    n.terminationRom = options.terminationRom;
    n.terminationPoint = options.terminationPoint;
    n.fastVmMode = options.fastVmMode;
    n.disableScreenRendering = options.disableScreenRendering;
    n.timeoutTacts = options.timeoutTacts;
    this.moduleApi.executeCycle(n);
    module.__release(n);
  }
}
