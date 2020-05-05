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
  get position(): i32 {
    return this._position;
  }

  /**
   * Seeks the specified position
   * @param position Position to seek foor
   */
  seek(position: i32): void {
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
  get length(): i32 {
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
  get eof(): bool {
    return this._position >= this._buffer.length;
  }

  /**
   * Reads a single byte from the stream
   */
  readByte(): u8 {
    this._testEof();
    return this._buffer[this._position++];
  }

  /**
   * Reads a byte array from the stream. The subsequent 4 bytes defines
   * the length of the array
   */
  readBytes(): u8[] {
    const length = this.readUint32();
    const result = new Array<u8>(length);
    for (let i = 0; i < length; i++) {
      result[i] = this.readByte();
    }
    return result;
  }


  /**
   * Reads a 16-bit unsigned integer from the stream
   */
  readUint16(): u16 {
    return <u16>this.readByte() + ((<u16>this.readByte()) << 8);
  }

  /**
   * Reads a 16-bit signed integer from the stream
   */
  readInt16(): i16 {
    const val = <u16>this.readByte() + ((<u16>this.readByte()) << 8);
    return <i16>val;
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
  readUint32(): u32 {
    return (
      <u32>this.readByte() +
      ((<u32>this.readByte()) << 8) +
      ((<u32>this.readByte()) << 16) +
      ((<u32>this.readByte()) << 24)
    );
  }

  /**
   * Reads a 32-bit unsigned integer from the stream
   */
  readUint64(): u64 {
    return <u64>(((<u64>this.readUint32()) << 32) | (<u64>this.readUint32()));
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
