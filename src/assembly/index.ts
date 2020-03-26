import { ObjectPool } from "./ObjectPool";
import { Z80Cpu } from "./Z80Cpu";
import { WaTestZ80Machine } from "./test-machine/WaTestZ80Machine";
import { TestZ80MachineState } from "./test-machine/TestZ80MachineState";
import { RunMode } from "../shared/RunMode";

export { Z80Cpu } from "./Z80Cpu";
export { WaTestZ80Machine } from "./test-machine/WaTestZ80Machine";
export { TestZ80MachineState } from "./test-machine/TestZ80MachineState";

// ============================================================================
// Module initialization

/**
 * Maximum CPU pool size
 */
const CPU_POOL = 100;
const TEST_MACHINE_POOL_SIZE = 10;

const cpuPool = new ObjectPool<Z80Cpu>(CPU_POOL, () => new Z80Cpu());
const testMachinePool = new ObjectPool<WaTestZ80Machine>(
  TEST_MACHINE_POOL_SIZE,
  () => new WaTestZ80Machine()
);

export const UINT8ARRAY_ID = idof<Uint8Array>()

// ============================================================================
// CPU API

/**
 * Gets the maximum size of the CPU pool
 */
export function getCpuPoolMaxSize(): i32 {
  return cpuPool.capacity;
}

/**
 * Resets the CPU pool by releasing all CPUs
 */
export function resetCpuPool(): void {
  cpuPool.reset();
}

/**
 * Creates a CPU
 * @returns Handle to the CPU, if can allocated; otherwise, -1.
 */
export function createCpu(): i32 {
  return cpuPool.create();
}

/**
 * Releases the specified CPU.
 * @param handle CPU handle
 * @returns True, if the CPU has been successfully released; otherwise, false.
 */
export function releaseCpu(handle: i32): bool {
  return cpuPool.release(handle);
}

/**
 * Gets the specified CPU.
 * @param handle CPU handle
 * @returns The CPU, if it can be found in the pool; otherwise, null.
 */
export function getCpu(handle: i32): Z80Cpu | null {
  return cpuPool.get(handle);
}

export function longOp(handle: i32): i32 {
  const cpu = getCpu(handle);
  if (!cpu) return -1;
  cpu.longOp();
  return cpu.af;
}

// ============================================================================
// Z80TestMachine API

/**
 * Gets the maximum size of the test machine pool
 */
export function getTestMachinePoolMaxSize(): i32 {
  return testMachinePool.capacity;
}

/**
 * Resets the test machine pool
 */
export function resetTestMachinePool(): void {
  testMachinePool.reset();
}

/**
 * Creates a new test machine
 * @returns Handle to the test machine, if can allocated; otherwise, -1.
 */
export function createTestMachine(): i32 {
  return testMachinePool.create();
}

/**
 * Releases the specified test machine.
 * @param handle Test machine handle
 * @returns True, if the test machine has been successfully released; otherwise, false.
 */
export function releaseTestMachine(handle: i32): bool {
  return testMachinePool.release(handle);
}

/**
 * Gets the specified test machine.
 * @param handle Test machine handle
 * @returns The test machine, if it can be found in the pool; otherwise, null.
 */
export function getTestMachine(handle: i32): WaTestZ80Machine | null {
  return testMachinePool.get(handle);
}

/**
 * Gets the state of the specified test machine
 * @param handle Test machine handle
 * @returns Test machine state, if machine found; otherwise, null
 */
export function getTestMachineState(handle: i32): TestZ80MachineState | null {
  const machine = testMachinePool.get(handle);
  return machine === null ? null : machine.machineState;
}

/**
 * Updates the state of the test machine
 * @param handle Test machine handle
 * @param state New machine state
 * @returns True, if state update is successful; otherwise, false
 */
export function updateTestMachineState(handle: i32, state: TestZ80MachineState): bool {
  const machine = testMachinePool.get(handle);
  if (machine === null) return false;
  machine.machineState = state;
  return true;
}

/**
 * Gets the memory contents of the test machine
 * @param handle Test machine handle
 * @returns Test machine memory, if machine found; otherwise, null
 */
export function getTestMachineMemory(handle: i32): u8[] | null {
  const machine = testMachinePool.get(handle);
  return machine === null ? null : machine.memory;
}

/**
 * Updates the state of the test machine
 * @param handle Test machine handle
 * @param mem Memory contents
 * @returns True, if state update is successful; otherwise, false
 */
export function updateTestMachineMemory(handle: i32, mem: u8[]): bool {
  const machine = testMachinePool.get(handle);
  if (machine === null) return false;
  machine.memory = mem;
  return true;
}

/**
 * Initializes the machine with the code to run
 * @param handle Test machine handle
 * @param code Initial code
 * @param runMode Run mode of the machine
 */
export function initTestMachineCode(handle: i32, runMode: RunMode, code: Uint8Array): bool {
  const machine = testMachinePool.get(handle);
  if (machine === null) return false;
  machine.runMode = runMode;
  machine.initCode(code);
  return true;
}

/**
 * Reuns the test machine with the specified code
 * @param handle Test machine handle
 */
export function runTestMachine(handle: i32): bool {
  const machine = testMachinePool.get(handle);
  if (machine === null) return false;
  machine.run();
  return true;
}
