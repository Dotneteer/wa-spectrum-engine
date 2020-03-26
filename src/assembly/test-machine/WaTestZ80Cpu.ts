import { Z80Cpu } from "../Z80Cpu";
import { TestZ80MachineState } from "./TestZ80MachineState";

/**
 * Represenst a Z80 CPU used for test purposes
 */
export class WaTestZ80Cpu extends Z80Cpu {
  readonly memoryDevice: TestMemoryDevice;
  readonly portDevice: TestPortDevice;

  constructor() {
    super();
    this.memoryDevice = new TestMemoryDevice();
    this.portDevice = new TestPortDevice(this);
  }

    /**
   * Gets a clone of the current CPU state
   */
  getCpuState(): TestZ80MachineState {
    const s = new TestZ80MachineState();
    s.a = this.a;
    s.f = this.f;
    s.af = this.af;
    s.af_sec = this._af_;
    s.b = this.b;
    s.c = this.c;
    s.bc = this.bc;
    s.bc_sec = this._bc_;
    s.d = this.d;
    s.e = this.e;
    s.de = this.de;
    s.de_sec = this._de_;
    s.h = this.h;
    s.l = this.l;
    s.hl = this.hl;
    s.hl_sec = this._hl_;
    s.i = this.i;
    s.iff1 = this.iff1;
    s.iff2 = this.iff2;
    s.indexMode = this.indexMode;
    s.interruptMode = this.interruptMode;
    s.isInOpExecution = this.isInOpExecution;
    s.isInterruptBlocked = this.isInterruptBlocked;
    s.xh = this.xh;
    s.xl = this.xl;
    s.ix = this.ix;
    s.yh = this.yh;
    s.yl = this.yl;
    s.iy = this.iy;
    s.maskableInterruptModeEntered = this.maskableInterruptModeEntered;
    s.opCode = this.opCode;
    s.pc = this.pc;
    s.prefixMode = this.prefixMode;
    s.r = this.r;
    s.sp = this.sp;
    s.stateFlags = this.stateFlags;
    s.tactsH = <u32>(this.tacts >> 32);
    s.tactsL = <u32>this.tacts;
    s.useGateArrayContention = this.useGateArrayContention;
    s.wh = this.wh;
    s.wl = this.wl;
    s.wz = this.wz;
    return s;
  }

  /**
   * 
   * @param s Updates the CPU state (use it for tesing only)
   */
  updateCpuState(s: TestZ80MachineState): void {
    this.a = s.a;
    this.f = s.f;
    this.af = s.af;
    this._af_ = s.af_sec;
    this.b = s.b;
    this.c = s.c;
    this.bc = s.bc;
    this._bc_ = s.bc_sec;
    this.d = this.d;
    this.e = s.e;
    this.de = s.de;
    this._de_ = s.de_sec;
    this.h = s.h;
    this.l = s.l;
    this.hl = s.hl;
    this._hl_ = s.hl_sec;
    this.i = s.i;
    this.iff1 = s.iff1;
    this.iff2 = s.iff2;
    this.indexMode = s.indexMode;
    this.interruptMode = s.interruptMode;
    this.isInOpExecution = s.isInterruptBlocked;
    this.isInterruptBlocked = s.isInterruptBlocked;
    this.xh = s.xh;
    this.xl = s.xl;
    this.ix = s.ix;
    this.yh = s.yh;
    this.yl = s.yl;
    this.iy = s.iy;
    this.maskableInterruptModeEntered = s.maskableInterruptModeEntered;
    this.opCode = s.opCode; 
    this.pc = s.pc;
    this.prefixMode = s.prefixMode;
    this.r = s.r;
    this.sp = s.sp;
    this.stateFlags = s.stateFlags;
    this.tacts = <u64>(s.tactsH << 32) | s.tactsL;
    this.useGateArrayContention = s.useGateArrayContention;
    this.wh = s.wh;
    this.wl = s.wl;
    this.wz = s.wz;
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
  memory: u8[] = [];
  private _memoryOp: MemoryOp[] = [];

  constructor() {
    this.reset();
  }

  reset(): void {
    for (let i = 0; i < 0x10000; i++) {
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
  constructor(readonly cpu: WaTestZ80Cpu, public readonly input: u8[] = []) {
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
