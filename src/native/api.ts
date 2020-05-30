import { RunMode } from "../shared/RunMode";

/**
 * Represents the CPU API
 */
export interface CpuApi {
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
