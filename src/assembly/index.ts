import { ObjectPool } from "./ObjectPool";
import { Z80Cpu } from "./Z80Cpu";
import { TestZ80MachineState } from "./test-machine/TestZ80MachineState";
import { RunMode } from "../shared/RunMode";

export { Z80Cpu } from "./Z80Cpu";
export { TestZ80MachineState } from "./test-machine/TestZ80MachineState";

// ============================================================================
// Module initialization

/**
 * Maximum CPU pool size
 */
const CPU_POOL = 100;

const cpuPool = new ObjectPool<Z80Cpu>(CPU_POOL, () => new Z80Cpu());

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

export function initTestMachine(): void {
  // TODO: Implement this method
}
/**
 * Gets the state of the test machine
 * @returns Test machine state
 */
export function getTestMachineState(): TestZ80MachineState {
  // TODO: Implement this method
  throw new Error();
}

/**
 * Updates the state of the test machine
 * @param state New machine state
 */
export function updateTestMachineState(state: TestZ80MachineState): void {
  // TODO: Implement this method
}

/**
 * Gets the memory contents of the test machine
 * @returns Test machine memory contents
 */
export function getTestMachineMemory(): u8[] {
  // TODO: Implement this method
  throw new Error();
}

/**
 * Updates the state of the test machine
 * @param handle Test machine handle
 * @param mem Memory contents
 */
export function updateTestMachineMemory(mem: Uint8Array): void {
  // TODO: Implement this method
}

/**
 * Initializes the machine with the code to run
 * @param runMode Run mode of the machine
 * @param code Initial code
 */
export function initTestMachineCode(runMode: RunMode, code: Uint8Array): void {
  // TODO: Implement this method
}

/**
 * Initializes the I/O input for the test machine run
 * @param input Input bytes to read
 */
export function initTestMachineInput(input: Uint8Array): void {
  // TODO: Implement this method
}

/**
 * Runs the test machine with the specified code
 * @param handle Test machine state after run
 */
export function runTestMachine(): TestZ80MachineState {
  // TODO: Implement this method
  throw new Error();
}

/**
 * Gets the I/O access log of the test machine
 */
export function getTestMachineIoAccessLog(): u32[] {
  // TODO: Implement this method
  throw new Error();
}

/**
 * Gets the memory access log of the test machine
 */
export function getTestMachineMemoryAccessLog(): u32[] {
  // TODO: Implement this method
  throw new Error();
}

