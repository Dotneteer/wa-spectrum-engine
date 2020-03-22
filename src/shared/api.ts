import { Z80Cpu } from "../assembly/Z80Cpu";
import { TestZ80Machine } from "../assembly/test-machine/TestZ80Machine";

export interface Api {
  // ==========================================================================
  // CPU pool handling
  
  getCpuPoolMaxSize(): number;
  resetCpuPool(): void;
  createCpu(): number;
  releaseCpu(handle: number): boolean;
  getCpu(handle: number): Z80Cpu | null;
  longOp(handle: number): number;

  getTestMachinePoolMaxSize(): number;
  resetTestMachinePool(): void;
  createTestMachine(): number;
  releaseTestMachine(handle: number): boolean;
  getTestMachine(handle: number): TestZ80Machine | null;
  getMemory(handle: number): u8[] | null;
}
