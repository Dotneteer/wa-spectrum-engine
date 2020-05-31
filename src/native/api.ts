import { RunMode } from "../shared/RunMode";

/**
 * Represents the CPU API
 */
export interface CpuApi {
  // --- Test Z80 machine methods
  memory: any;
  turnOnCpu(): void;
  resetCpu(): void;
  getCpuState(): void;
  updateCpuState(): void;
  enableExtendedInstructions(f: boolean): void;
  prepareTest(mode: RunMode, codeEnds: number): void;
  setTestInputLength(length: number): void;
  getMemLogLength(): number;
  getIoLogLength(): number;
  getTbBlueLogLength(): number;
  runTestCode(): void;
  restMachineType(): void;
}

/**
 * Represents the Machine API
 */
export interface MachineApi extends CpuApi {
  // --- ZX Spectrum machine methods
  initZxSpectrum(type: number): void;
  turnOnMachine(): void;
  resetMachine(): void;
  getMachineState(): void;
  executeMachineCycle(): void;
}
