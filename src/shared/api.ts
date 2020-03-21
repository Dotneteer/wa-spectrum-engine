import { Z80CpuEngine } from "./Z80CpuEngine";

export interface Api {
  // ==========================================================================
  // CPU pool handling
  
  getCpuPoolMaxSize(): number;
  resetCpuPool(): void;
  createCpu(): number;
  releaseCpu(handle: number): boolean;
  getCpu(handle: number): Z80CpuEngine | null;
  longOp(handle: number): number;
}
