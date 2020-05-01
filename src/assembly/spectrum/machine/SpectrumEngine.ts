import { Z80Cpu } from "../../Z80Cpu";
import { ExecuteCycleOptions } from "../../../shared/ExecuteCycleOptions";
import { ExecutionCompletionReason } from "../../../shared/ExecutionCompletionReason";
import { CpuConfiguration, MemoryConfiguration, ScreenConfiguration } from "./configuration";

/**
 * This class represents a ZX Spectrum engine
 */
export class SpectrumEngine {
  private _cpu: Z80Cpu;
  private _ulaIssue: u8;
  private _baseClockFrequency: u32;
  private _clockMultiplier: u8;
  private _currentFrameTact: u32;
  private _frameTacts: u32;
  private _contentionAccummulated: u32;
  private _lastExecutionStartTact: number;
  private _lastExecutionContentionValue: u32;
  private _interruptTact: u32;
  private _executeCycleOptions: ExecuteCycleOptions;
  private _executionCompletionReason: ExecutionCompletionReason;

  constructor() {
    this._cpu = new Z80Cpu();
    this._ulaIssue = 3;
    this._baseClockFrequency = 3_500_000;
  }

  // ==========================================================================
  // Engine properties

  /**
   * Gets the Z80 CPU of the engine
   */
  get cpu(): Z80Cpu {
    return this._cpu;
  }

  /**
   * Gets or sets the ULA issue of the engine
   */
  get ulaIssue(): u8 {
    return this._ulaIssue;
  }
  set ulaIssue(value: u8) {
    this._ulaIssue = value === 2 || value === 3 ? value : 3;
  }

  /**
   * The base clock frequency of the engine
   */
  get baseClockFrequency(): u32 {
    return this._baseClockFrequency;
  }

  /**
   * Allows to set a clock frequency multiplier value (1, 2, 4, or 8).
   */
  get clockMultiplier(): u8 {
    return this._clockMultiplier;
  }

  /**
   * The current tact within the current screen frame
   */
  get currentFrameTact(): u32 {
    return this._currentFrameTact;
  }

  /**
   * Total number of tacts within a ULA screen frame
   */
  get frameTacts(): u32 {
    return this._frameTacts;
  }

  /**
   * Gets or sets the value of the contention accummulated since the start of
   * the machine
   */
  get contentionAccummulated(): u32 {
    return this._contentionAccummulated;
  }

  /**
   * The CPU tact at which the last execution cycle started
   */
  get lastExecutionStartTact(): u64 {
    return this._lastExecutionStartTact;
  }

  /**
   * Gets the value of the contention accummulated when the
   * execution cycle started
   */
  get lastExecutionContentionValue(): u32 {
    return this._lastExecutionContentionValue;
  }

  /**
   * The number of frame tact at which the interrupt signal is generated
   */
  get interruptTact(): u32 {
    return this._interruptTact;
  }

  /**
   * The current execution cycle options
   */
  get executeCycleOptions(): ExecuteCycleOptions {
    return this._executeCycleOptions;
  }

  /**
   * Gets the reason why the execution cycle of the SpectrumEngine completed.
   */
  get executionCompletionReason(): ExecutionCompletionReason {
    return this._executionCompletionReason;
  }

  // ==========================================================================
  // Configurator function

  /**
   * Configuration of the Z80 CPU
   */
  getCpuConfiguration: () => CpuConfiguration;

  /**
   * Configuration of the memory
   */
  getMemoryConfiguration: () => MemoryConfiguration;

  /**
   * Configuration of the screen
   */
  getScreenConfiguration: () => ScreenConfiguration;
}
