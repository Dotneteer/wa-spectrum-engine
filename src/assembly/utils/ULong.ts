/**
 * This class implements real 64-bit numbers and their operations.
 */
export class ULong {
  private _l0: u16;
  private _l1: u16;
  private _h0: u16;
  private _h1: u16;

  /**
   * Creates a 64-bit unsigned number from two 32-bit unsigned.
   * @param h High u32 value
   * @param l Low u32 value
   */
  constructor(h: u32, l: u32) {
    this._l0 = <u16>l;
    this._l1 = <u16>(l >> 16);
    this._h0 = <u16>h;
    this._h1 = <u16>(h >> 16);
  }

  /**
   * Gets the lowest 32-bit
   */
  get low(): u32 {
    return ((<u32>this._l1) << 16) | (<u32>this._l0);
  }

  /**
   * Gets the highest 32-bit
   */
  get high(): u32 {
    return ((<u32>this._h1) << 16) | (<u32>this._h0);
  }

  /**
   * Creates an ULong from an 8-bit value
   * @param value 8-bit unsigned value
   */
  static fromUint8(value: u8): ULong {
    return new ULong(0, <u32>value);
  }

  /**
   * Creates an ULong from a 16-bit value
   * @param value 16-bit unsigned value
   */
  static fromUint16(value: u16): ULong {
    return new ULong(0, <u32>value);
  }

  /**
   * Creates an ULong from a 32-bit value
   * @param value 32-bit unsigned value
   */
  static fromUint32(value: u32): ULong {
    return new ULong(0, <u32>value);
  }

  /**
   * Adds two ULong numbers
   * @param a Left operand
   * @param b Right operand
   */
  static add(a: ULong, b: ULong): ULong {
    const sumL0 = <u32>a._l0 + <u32>b._l0;
    const newL0 = <u16>(sumL0)
    const sumL1 = <u32>a._l1 + <u32>b._l1;
    // TODO: Complete this
    return new ULong(0,0);
  }

  /**
   * Subtracts two ULong numbers
   * @param a Left operand
   * @param b Right operand
   */
  static subtract(a: ULong, b: ULong): ULong {
    // TODO: Complete this
    return new ULong(0,0);
  }

  /**
   * Compares two ULong numbers
   * @param a Left operand
   * @param b Right operand
   * @returns <0, if a < b; 0, if a equals b; >0, if a > b.
   */
  static compare(a: ULong, b: ULong): i32 {
    // TODO: Complete this
    return 0;
  }

  /**
   * Increments this ULong with the specified value
   * @param value Value to increment
   */
  inc(value: u16): void {
    const newL0 = <u32>this._l0 + <u32>value;
    this._l0 = <u16>newL0;
    const newL1 = <u32>this._l1 + (newL0 >> 16);
    this._l1 = <u16>newL1;
    const newH0 = <u32>this._h0 + (newL1 >> 16);
    this._h0 = <u16>newH0;
    this._h1 = <u16>(<u32>this._h1 + (newH0 >> 16));
  }
}
