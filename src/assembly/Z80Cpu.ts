import { MemoryStatusArray } from "./MemoryStatusArray";

export class Z80Cpu {
  // ==========================================================================
  // Registers
  private _a: u8 = 0xff;
  private _f: u8 = 0xff;
  private _af: u16 = 0xffff;

  private _b: u8 = 0xff;
  private _c: u8 = 0xff;
  private _bc: u16 = 0xffff;

  private _d: u8 = 0xff;
  private _e: u8 = 0xff;
  private _de: u16 = 0xffff;

  private _h: u8 = 0xff;
  private _l: u8 = 0xff;
  private _hl: u16 = 0xffff;

  private _af_sec: u16 = 0xffff;
  private _bc_sec: u16 = 0xffff;
  private _de_sec: u16 = 0xffff;
  private _hl_sec: u16 = 0xffff;

  private _i: u8 = 0xff;
  private _r: u8 = 0xff;

  private _pc: u16 = 0xffff;
  private _sp: u16 = 0xffff;

  private _xh: u8 = 0xff;
  private _xl: u8 = 0xff;
  private _ix: u16 = 0xff;

  private _yh: u8 = 0xff;
  private _yl: u8 = 0xff;
  private _iy: u16 = 0xff;

  private _wh: u8 = 0xff;
  private _wl: u8 = 0xff;
  private _wz: u16 = 0xff;

  // ==========================================================================
  // CPU state variables
  // Gets the current tact of the device -- the clock cycles since
  // the device was reset
  tacts: u64 = 0;

  // CPU signals and HW flags
  stateFlags: Z80StateFlags = Z80StateFlags.None;

  // Specifies the contention mode that affects the CPU.
  // False: ULA contention mode;
  // True: Gate array contention mode;
  useGateArrayContention: bool = false;

  // Interrupt Enable Flip-Flop #1
  iff1: bool = false;

  // Interrupt Enable Flip-Flop #2
  iff2: bool = false;

  // The current Interrupt mode
  interruptMode: u8 = 0;

  // The interrupt is blocked
  isInterruptBlocked: bool = false;

  // Is currently in opcode execution?
  isInOpExecution: bool = false;

  // Gets the current execution flow status
  readonly executionFlowStatus: MemoryStatusArray = new MemoryStatusArray();

  // Gets the current memory read status
  readonly memoryReadStatus: MemoryStatusArray = new MemoryStatusArray();

  // Gets the current memory write status
  readonly memoryWriteStatus: MemoryStatusArray = new MemoryStatusArray();

  // The current Operation Prefix Mode
  prefixMode: OpPrefixMode = OpPrefixMode.None;

  // The current Operation Index Mode
  indexMode: OpIndexMode = OpIndexMode.None;

  // This flag indicates if the CPU entered into a maskable
  // interrupt method as a result of an INT signal
  maskableInterruptModeEntered: bool = false;

  // This flag signs if the Z80 extended instruction set (Spectrum Next)
  // is allowed, or NOP instructions should be executed instead of
  // these extended operations.

  // ==========================================================================
  // Instantiation

  /**
   * Instantiates the Z80 CPU
   * @param allowExtendedInstructionSet This flag signs if the Z80 extended
   * instruction set (Spectrum Next) is allowed, or NOP instructions should be
   * executed instead of these extended operations.
   */
  constructor(public allowExtendedInstructionSet: bool =false) {
  }

  // ==========================================================================
  // Registers access

  get a(): u8 {
    return this._a;
  }
  set a(v: u8) {
    this._a = v;
    this._af = (this._a << 8) | this._f;
  }
  get f(): u8 {
    return this._f;
  }
  set f(v: u8) {
    this._f = v;
    this._af = (this._a << 8) | this._f;
  }
  get af(): u16 {
    return this._af;
  }
  set af(v: u16) {
    this._af = v;
    this._a = <u8>(v >> 8);
    this._f = <u8>v;
  }

  get b(): u8 {
    return this._b;
  }
  set b(v: u8) {
    this._b = v;
    this._bc = (this._b << 8) | this._c;
  }
  get c(): u8 {
    return this._c;
  }
  set c(v: u8) {
    this._c = v;
    this._bc = (this._b << 8) | this._b;
  }
  get bc(): u16 {
    return this._bc;
  }
  set bc(v: u16) {
    this._bc = v;
    this._b = <u8>(v >> 8);
    this._c = <u8>v;
  }

  get d(): u8 {
    return this._d;
  }
  set d(v: u8) {
    this._d = v;
    this._de = (this._d << 8) | this._e;
  }
  get e(): u8 {
    return this._e;
  }
  set e(v: u8) {
    this._e = v;
    this._de = (this._d << 8) | this._e;
  }
  get de(): u16 {
    return this._de;
  }
  set de(v: u16) {
    this._de = v;
    this._d = <u8>(v >> 8);
    this._e = <u8>v;
  }

  get h(): u8 {
    return this._h;
  }
  set h(v: u8) {
    this._h = v;
    this._hl = (this._h << 8) | this._l;
  }
  get l(): u8 {
    return this._l;
  }
  set l(v: u8) {
    this._l = v;
    this._hl = (this._h << 8) | this._l;
  }
  get hl(): u16 {
    return this._hl;
  }
  set hl(v: u16) {
    this._hl = v;
    this._h = <u8>(v >> 8);
    this._l = <u8>v;
  }

  get _af_(): u16 {
    return this._af_sec;
  }
  get _bc_(): u16 {
    return this._bc_sec;
  }
  get _de_(): u16 {
    return this._de_sec;
  }
  get _hl_(): u16 {
    return this._hl_sec;
  }

  get i(): u8 {
    return this._i;
  }
  set i(v: u8) {
    this._i = v;
  }
  get r(): u8 {
    return this._r;
  }
  set r(v: u8) {
    this._r = v;
  }

  get pc(): u16 {
    return this._pc;
  }
  set pc(v: u16) {
    this._pc = v;
  }
  get sp(): u16 {
    return this._sp;
  }
  set sp(v: u16) {
    this._sp = v;
  }

  get xh(): u8 {
    return this._xh;
  }
  set xh(v: u8) {
    this._xh = v;
    this._ix = (this._xh << 8) | this._xl;
  }
  get xl(): u8 {
    return this._xl;
  }
  set xl(v: u8) {
    this._xl = v;
    this._ix = (this._xh << 8) | this._xl;
  }
  get ix(): u16 {
    return this._ix;
  }
  set ix(v: u16) {
    this._ix = v;
    this._xh = <u8>(v >> 8);
    this._xl = <u8>v;
  }

  get yh(): u8 {
    return this._yh;
  }
  set yh(v: u8) {
    this._yh = v;
    this._iy = (this._yh << 8) | this._yl;
  }
  get yl(): u8 {
    return this._yl;
  }
  set yl(v: u8) {
    this._yl = v;
    this._iy = (this._yh << 8) | this._yl;
  }
  get iy(): u16 {
    return this._iy;
  }
  set iy(v: u16) {
    this._iy = v;
    this._yh = <u8>(v >> 8);
    this._yl = <u8>v;
  }

  get wh(): u8 {
    return this._wh;
  }
  set wh(v: u8) {
    this._wh = v;
    this._wz = (this._wh << 8) | this._wl;
  }
  get wl(): u8 {
    return this._wl;
  }
  set wl(v: u8) {
    this._wl = v;
    this._wh = (this._wh << 8) | this._wl;
  }
  get wz(): u16 {
    return this._wz;
  }
  set wz(v: u16) {
    this._wz = v;
    this._wh = <u8>(v >> 8);
    this._wl = <u8>v;
  }

  // ==========================================================================
  // Memory and port accessors

  /**
   * Reads the memory from the specified address
   * @param address Memory address
   */
  readMemory(address: u16): u8 {
    return 0xff;
  }

  /**
   * Writes the memory
   * @param address Memory address
   * @param value Datat to write
   */
  writeMemory(address: u16, value: u8): void {}

  /**
   * Reads the specified I/O port
   * @param address Memory address
   */
  readPort(address: u16): u8 {
    return 0xff;
  }

  /**
   * Writes the specified I/O port
   * @param address Memory address
   * @param value Datat to write
   */
  writePort(address: u16, value: u8): void {}

  // ==========================================================================
  // Operations
  delay(ticks: i32): void {
    this.tacts += ticks;
  }

  // ==========================================================================
  // Temporary test API

  longOp(): void {
    for (let i = 0; i < 100000000; i++) {
      this._af = <u16>i;
    }
  }
}

// ==========================================================================
// Helper types

export enum Z80StateFlags {
  // No signal is set
  None = 0,

  // Indicates if an interrupt signal arrived
  Int = 0x01,

  // Indicates if a Non-Maskable Interrupt signal arrived
  Nmi = 0x02,

  // Indicates if a RESET signal arrived
  Reset = 0x04,

  // Is the CPU in HALTED state?
  Halted = 0x08,

  // Reset mask of INT
  InvInt = 0xff - Int,

  // Reset mask for NMI
  InvNmi = 0xff - Nmi,

  // Reset mask for RESET
  InvReset = 0xff - Reset,

  // Reset mask for HALT
  InvHalted = 0xff - Halted
}

export enum OpPrefixMode {
  // No operation prefix
  None = 0,

  // Extended mode (0xED prefix)
  Extended,

  // Bit operations mode (0xCB prefix)
  Bit
}

export enum OpIndexMode {
  // Indexed address mode is not used</summary>
  None = 0,

  // <summary>Indexed address with IX register</summary>
  IX,

  // <summary>Indexed address with IY register</summary>
  IY
}
