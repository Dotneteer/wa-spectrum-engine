import { Z80CpuEngine } from "../shared/Z80CpuEngine";
export { Z80CpuEngine } from "../shared/Z80CpuEngine";

// ============================================================================
// Module initialization

/**
 * Maximum CPU pool size
 */
const CPU_POOL = 100;

/**
 * Flags that indicate allocated CPUs in the pool
 */
const cpuPoolMap: bool[] = [];

/**
 * CPU instances already created
 */
const cpuPool: (Z80CpuEngine | null)[] = [];

resetCpuPool();

// ============================================================================
// Module API

/**
 * Gets the maximum size of the CPU pool
 */
export function getCpuPoolMaxSize(): i32 {
  return CPU_POOL;
}

/**
 * Resets the CPU pool by releasing all CPUs
 */
export function resetCpuPool(): void {
  for (let i = 0; i < CPU_POOL; i++) {
    cpuPoolMap[i] = false;
    cpuPool[i] = null;
  }
}

/**
 * Creates a CPU
 * @returns Handle to the CPU, if can allocated; otherwise, -1.
 */
export function createCpu(): i32 {
  const next = cpuPoolMap.findIndex(item => !item);
  if (next < 0) return -1;
  cpuPool[next] = new Z80CpuEngine();
  cpuPoolMap[next] = true;
  return next;
}

/**
 * Releases the specified CPU.
 * @param handle CPU handle
 * @returns True, if the CPU has been successfully released; otherwise, false.
 */
export function releaseCpu(handle: i32): bool {
  if (!cpuPoolMap[handle]) return false;
  cpuPoolMap[handle] = false;
  cpuPool[handle] = null;
  return true;
}

/**
 * Gets the specified CPU.
 * @param handle CPU handle
 * @returns The CPU, if it can be found in the pool; otherwise, null.
 */
export function getCpu(handle: i32): Z80CpuEngine | null {
  return cpuPool[handle];
}

export function longOp(handle: i32): i32 {
  const cpu = getCpu(handle);
  if (!cpu) return -1;
  cpu.longOp();
  return cpu.af;
}
