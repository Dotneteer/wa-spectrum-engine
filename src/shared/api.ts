import { Z80Cpu } from "../assembly/Z80Cpu";
import { WaTestZ80Machine } from "../assembly/test-machine/WaTestZ80Machine";
import { TestZ80MachineState } from "../assembly";
import { RunMode } from "./RunMode";

export interface Api {
  // ==========================================================================
  // CPU pool handling
  UINT8ARRAY_ID: number;

  getCpuPoolMaxSize(): number;
  resetCpuPool(): void;
  createCpu(): number;
  releaseCpu(handle: number): boolean;
  getCpu(handle: number): Z80Cpu | 0;
  longOp(handle: number): number;

  // ==========================================================================
  // Test machine operations
  initTestMachine(): void;
  getTestMachineState(): TestZ80MachineState;
  updateTestMachineState(state: TestZ80MachineState): void;
  getTestMachineMemory(): number; // PTR
  updateTestMachineMemory(mem: Uint8Array): void;
  initTestMachineCode(runMode: RunMode, code: Uint8Array): void;
  initTestMachineInput(input: Uint8Array): void;
  runTestMachine(): TestZ80MachineState;
  getTestMachineIoAccessLog(): number; // PTR
  getTestMachineMemoryAccessLog(): number; // PTR
}
