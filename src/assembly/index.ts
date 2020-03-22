import { ObjectPool } from "./ObjectPool";
import { Z80Cpu } from "./Z80Cpu";
import { TestZ80Machine } from "./test-machine/TestZ80Machine";

export { Z80Cpu } from "./Z80Cpu";
export { TestZ80Machine } from "./test-machine/TestZ80Machine";

// ============================================================================
// Module initialization

/**
 * Maximum CPU pool size
 */
const CPU_POOL = 100;
const TEST_MACHINE_POOL_SIZE = 10;

const cpuPool = new ObjectPool<Z80Cpu>(CPU_POOL, () => new Z80Cpu());
const testMachinePool = new ObjectPool<TestZ80Machine>(
  TEST_MACHINE_POOL_SIZE,
  () => new TestZ80Machine()
);

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
 * Gets the specified CPU.
 * @param handle CPU handle
 * @returns The CPU, if it can be found in the pool; otherwise, null.
 */
export function getTestMachine(handle: i32): TestZ80Machine | null {
  return testMachinePool.get(handle);
}

export function getMemory(handle: i32): Uint8Array | null {
  const machine = getTestMachine(handle);
  if (machine) return machine.memory;
  return new Uint8Array(5);
}
