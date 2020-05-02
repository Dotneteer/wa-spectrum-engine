/**
 * This class allows you to read binary information from a file or a buffer
 */
export class BinaryReader {
  private _buffer: u8[];
  private _position: i32;

  /**
   * Initializes a binary reader that reads information from a buffer
   * @param buffer Buffer or file name to read form
   */
  constructor(buffer: u8[]) {
    this._buffer = buffer;
    this._position = 0;
  }

  /**
   * Gets the current stream position
   */
  get position(): number {
    return this._position;
  }

  /**
   * Seeks the specified position
   * @param position Position to seek foor
   */
  seek(position: number): void {
    if (position < 0) {
      throw new Error("Stream position cannot be negative");
    }
    if (position > this._buffer.length) {
      throw new Error("Stream position is over the end of the stream");
    } else {
      this._position = position;
    }
  }

  /**
   * Get the length of the stream
   */
  get length(): u32 {
    return this._buffer.length;
  }

  /**
   * Tests if the reader has contents at all
   */
  get hasContent(): bool {
    return this._buffer.length > 0;
  }

  /**
   * Test is the current position is at the end of the file
   */
  get eof(): boolean {
    return this._position >= this._buffer.length;
  }

  /**
   * Reads the specified number of bytes from the stream
   * @param count Number of bytes to read
   */
  readBytes(count: u16): u8[] {
    if (this._position + count >= this._buffer.length) {
      count = this._buffer.length - this._position;
    }
    if (count < 0) {
      count = 0;
    }
    const result = new Array<u8>(count);
    for (let i = 0; i < count; i++) {
      result[i] = this._buffer[this._position++];
    }
    return result;
  }

  /**
   * Reads a single byte from the stream
   */
  readByte(): u8 {
    this._testEof();
    return this._buffer[this._position++];
  }

  /**
   * Reads a 16-bit unsigned integer from the stream
   */
  readUInt16(): u16 {
    return <u16>this.readByte() + ((<u16>this.readByte()) << 8);
  }

  /**
   * Reads a 32-bit signed integer from the stream
   */
  readInt32(): i32 {
    const val =
      <u32>this.readByte() +
      ((<u32>this.readByte()) << 8) +
      ((<u32>this.readByte()) << 16) +
      ((<u32>this.readByte()) << 24);
    return <i32>val;
  }

  /**
   * Reads a 32-bit unsigned integer from the stream
   */
  readUInt32(): u32 {
    return (
      <u32>this.readByte() +
      ((<u32>this.readByte()) << 8) +
      ((<u32>this.readByte()) << 16) +
      ((<u32>this.readByte()) << 24)
    );
  }

  /**
   * Reads a 16-bit signed integer from the stream
   */
  readInt16(): number {
    const val = <u16>this.readByte() + ((<u16>this.readByte()) << 8);
    return <i16>val;
  }

  /**
   * Tests if end of file is reached
   */
  private _testEof(): void {
    if (this.eof) {
      throw new Error("End of file reached");
    }
  }
}
