// --- This class represents a status array where every bit
// --- indicates the status of a particular memory address
// --- within the 64K memory space
export class MemoryStatusArray {
  // --- Stores the array of bits, each number 32 bits
  private readonly _memoryBits: Uint32Array = new Uint32Array(2048);

  // --- Create an array of zero bits
  constructor() {
    this.clearAll();
  }

  // --- Clear all bits
  clearAll(): void {
    for (var i = 0; i < 2048; i++) {
      this._memoryBits[i] = 0;
    }
  }

  // --- Clear a set of bits
  clearSet(start: u16, end: u16): void {
    let startPos: u16 = start >> 5;
    let endPos: u16 = end >> 5;
    // --- Reset the start bits
    let firstBit: u16 = start % 32;
    let lastBit: u16 = startPos === endPos ? end % 32 : 31;
    let mask = 0x0;
    for (let i = firstBit; i <= lastBit; i++) {
      mask |= 0x01 << i;
    }
    mask = ~mask & 0xffff_ffff;
    this._memoryBits[startPos] &= mask;
    if (startPos === endPos) {
      return;
    }

    // --- Reset the middle bits
    for (let i = startPos + 1; i <= endPos - 1; i++) {
      this._memoryBits[i] = 0;
    }

    // --- Reset the tail bits
    mask = 0;
    for (let i = 0; i <= end % 32; i++) {
      mask |= 0x01 << i;
    }
    mask = ~mask & 0xffff_ffff;
    this._memoryBits[endPos] &= mask;
  }

  // --- Gets the state of the specified bit
  getBit(index: u16): bool {
    index &= 0xffff;
    var position = index >> 5;
    var mask = 1 << index % 32;
    return (this._memoryBits[position] & mask) !== 0;
  }

  // --- Sets the specified bit to true
  touch(index: u16): void {
    index &= 0xffff;
    var position = index >> 5;
    var mask = 1 << index % 32;
    this._memoryBits[position] |= mask;
  }

  // --- Checks if all addresses are touched between the start and end
  touchedAll(start: u16, end: u16): boolean {
    start &= 0xffff;
    end &= 0xffff;
    for (var i = start; i <= end; i++) {
      if (!this.getBit(i)) {
        return false;
      }
    }
    return true;
  }

  // --- Checks if all addresses are touched between the start and end
  touchedAny(start: u16, end: u16): boolean {
    start &= 0xffff;
    if (end > 0xffff) {
      end = 0xffff;
    }
    for (var i = start; i <= end; i++) {
      if (this.getBit(i)) {
        return true;
      }
    }
    return false;
  }
}
