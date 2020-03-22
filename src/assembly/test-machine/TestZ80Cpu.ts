import { Z80Cpu } from "../Z80Cpu";

/**
 * Represenst a Z80 CPU used for test purposes
 */
export class TestZ80Cpu extends Z80Cpu {
  readonly memoryDevice: TestMemoryDevice;
  readonly portDevice: TestPortDevice;

  constructor() {
    super();
    this.memoryDevice = new TestMemoryDevice();
    this.portDevice = new TestPortDevice(this);
  }

  readMemory(address: u16): u8 {
    return this.memoryDevice.read(address);
  }

  writeMemory(address: u16, value: u8): void {
    this.memoryDevice.write(address, value);
  }

  readPort(address: u16): u8 {
    return this.portDevice.read(address);
  }

  writePort(address: u16, value: u8): void {
    this.portDevice.write(address, value);
  }
}

/**
 * This class represents simple 64K flat read-write memory without
 * contention, for test purposes
 */
export class TestMemoryDevice {
  readonly memory: Uint8Array = new Uint8Array(0x10000);
  private _memoryOp: MemoryOp[] = [];

  constructor() {
    this.reset();
  }

  reset(): void {
    for (let i = 0; i < 0x1000; i++) {
      this.memory[i] = 0xff;
    }
    this._memoryOp = [];
  }

  read(address: u16): u8 {
    const value = this.memory[address];
    this._memoryOp.push({
      address,
      value,
      isWrite: false
    });
    return value;
  }

  write(address: u16, value: u8): void {
    this.memory[address] = value;
    this._memoryOp.push({
      address,
      value,
      isWrite: true
    });
  }

  get log(): MemoryOp[] {
    return this._memoryOp;
  }
}

/**
 * Represents data an a particular memory operation
 */
export class MemoryOp {
  address: u16;
  value: u8;
  isWrite: bool;
}

/**
 * Represents a simple port device with cpu-specified contention,
 * for test purposes
 */
export class TestPortDevice {
  private _index: i32;
  private _portOp: IoOp[] = [];

  /**
   * Creates a port that reads the provided input sequence
   * @param input Input data sequence to read
   */
  constructor(readonly cpu: TestZ80Cpu, public readonly input: u8[] = []) {
    this._index = 0;
  }

  read(address: u16): u8 {
    this.cpu.delay(4);
    const value =
      this._index >= this.input.length ? 0xff : this.input[this._index++];
    this._portOp.push({
      address,
      value,
      isOutput: false
    });
    return value;
  }

  write(address: u16, value: u8): void {
    this.cpu.delay(4);
    this._portOp.push({
      address,
      value,
      isOutput: true
    });
  }

  get log(): IoOp[] {
      return this._portOp;
  }
}

/**
 * Represents data an a particular I/O operation
 */
export class IoOp {
  address: u16;
  value: u8;
  isOutput: bool;
}
