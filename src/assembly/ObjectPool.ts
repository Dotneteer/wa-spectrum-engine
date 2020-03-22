/**
 * This class implements a pool of objects that can be accesses with handles
 */
export class ObjectPool<T extends object> {
  private _poolMap: bool[] = [];
  private _pool: (T | null)[] = [];

  /**
   * Creates a pool with the specified capacity
   * @param capacity Pool capacity
   */
  constructor(
    public readonly capacity: i32,
    private readonly factory: () => T
  ) {
    this.reset();
  }

  /**
   * Releases all objects from the pool
   */
  reset(): void {
    for (let i = 0; i < this.capacity; i++) {
      this._poolMap[i] = false;
      this._pool[i] = null;
    }
  }

  /**
   * Creates a CPU
   * @returns Handle to the CPU, if can allocated; otherwise, -1.
   */
  create(factory: (() => T) | null = null): i32 {
    const next = this._poolMap.findIndex(item => !item);
    if (next < 0) return -1;
    this._pool[next] = factory ? factory() : this.factory();
    this._poolMap[next] = true;
    return next;
  }

  /**
   * Releases the specified CPU.
   * @param handle CPU handle
   * @returns True, if the CPU has been successfully released; otherwise, false.
   */
  release(handle: i32): bool {
    if (!this._poolMap[handle]) return false;
    this._poolMap[handle] = false;
    this._pool[handle] = null;
    return true;
  }

  /**
   * Gets the specified CPU.
   * @param handle CPU handle
   * @returns The CPU, if it can be found in the pool; otherwise, null.
   */
  get(handle: i32): T | null {
    return this._pool[handle];
  }
}
