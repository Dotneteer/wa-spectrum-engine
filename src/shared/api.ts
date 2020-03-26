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
  // Test machine pool handling
  getTestMachinePoolMaxSize(): number;
  resetTestMachinePool(): void;
  createTestMachine(): number;
  releaseTestMachine(handle: number): boolean;
  getTestMachine(handle: number): WaTestZ80Machine | 0;

  // ==========================================================================
  // Test machine operations
  getTestMachineState(handle: number): TestZ80MachineState | 0;
  updateTestMachineState(handle: number, state: TestZ80MachineState): boolean;
  getTestMachineMemory(handle: number): number;
  updateTestMachineMemory(handle: number, mem: number[]): boolean;
  initTestMachineCode(handle: number, runMode: RunMode, ptr: number): boolean;
  runTestMachine(handle: number): boolean;
}
