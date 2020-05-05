const CHUNK_INCREMENT = 4096;

/**
 * This class implements a writer to a binary stream
 */
export class BinaryWriter {
  private _position: u32 = 0;
  private _buffer: u8[] = [];

  /**
   * Writes a byte value to the stream
   * @param value Value to write
   */
  writeByte(value: u8): void {
    this._extend(1);
    this._buffer[this._position++] = value;
  }

  /**
   * Writes an array of bytes to the stream
   * @param value Value to write
   */
  writeBytes(value: u8[]): void {
    this._extend(value.length + 4);
    this.writeUint32(<u32>value.length);
    for (let i = 0; i < value.length; i++) {
      this._buffer[this._position++] = value[i];
    }
  }

  /**
   * Writes an u16 value to the stream
   * @param value Value to write
   */
  writeUint16(value: u16): void {
    this._extend(2);
    this._buffer[this._position++] = <u8>value;
    this._buffer[this._position++] = <u8>(value >> 8);
  }

  /**
   * Writes an u32 value to the stream
   * @param value Value to write
   */
  writeUint32(value: u32): void {
    this._extend(4);
    this._buffer[this._position++] = <u8>value;
    this._buffer[this._position++] = <u8>(value >> 8);
    this._buffer[this._position++] = <u8>(value >> 16);
    this._buffer[this._position++] = <u8>(value >> 24);
  }

  /**
   * Writes an i32 value to the stream
   * @param value Value to write
   */
  writeInt32(value: i32): void {
    this._extend(4);
    this._buffer[this._position++] = <u8>value;
    this._buffer[this._position++] = <u8>(value >> 8);
    this._buffer[this._position++] = <u8>(value >> 16);
    this._buffer[this._position++] = <u8>((<u32>value) >> 24);
  }

  /**
   * Writes an u64 value to the stream
   * @param value Value to write
   */
  writeUint64(value: u64): void {
    this.writeUint32(<u32>value);
    this.writeUint32(<u32>(value >> 32));
  }

  /**
   * Gets the buffer of the writer
   */
  get buffer(): u8[] {
    const clone = new Array<u8>(this._position);
    for (let i = 0; i < clone.length; i++) {
      clone[i] = this._buffer[i];
    }
    return clone;
  }

  /**
   * Extensd the buffer to the specified size
   * @param size Required buffer size
   */
  private _extend(size: u32): void {
    if (<u32>this._buffer.length >= this._position + size) return;
    const newBuff = new Array<u8>(this._position + size + CHUNK_INCREMENT);
    for (let i = 0; i < this._buffer.length; i++) {
      newBuff[i] = this._buffer[i];
    }
    this._buffer = newBuff;
  }
}
