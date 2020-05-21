import { MemoryStatusArray } from "./MemoryStatusArray";
import { TestZ80MachineState } from "./test-machine/TestZ80MachineState";
import {
  Z80StateFlags,
  OpPrefixMode,
  OpIndexMode,
  FlagsSetMask,
} from "../shared/cpu-enums";
import { BinaryWriter } from "./utils/BinaryWriter";
import { BinaryReader } from "./utils/BinaryReader";

export class Z80Cpu {
  // ==========================================================================
  // Registers
  private _af: u16;
  private _bc: u16;
  private _de: u16;
  private _hl: u16;

  private _af_sec: u16;
  private _bc_sec: u16;
  private _de_sec: u16;
  private _hl_sec: u16;

  private _i: u8;
  private _r: u8;

  private _ix: u16;
  private _iy: u16;
  private _wz: u16;

  // ==========================================================================
  // CPU state variables
  // Gets the current tact of the device -- the clock cycles since
  // the device was reset

  /**
   * The number of tacts in a frame
   */
  tactsInFrame: u32;

  // Number of frames since the CPU started
  frameCount: u32;

  // Number of tacts within the current frame
  frameTacts: u32;

  // CPU signals and HW flags
  stateFlags: Z80StateFlags;

  // Specifies the contention mode that affects the CPU.
  // False: ULA contention mode;
  // True: Gate array contention mode;
  useGateArrayContention: bool;

  // Interrupt Enable Flip-Flop #1
  iff1: bool;

  // Interrupt Enable Flip-Flop #2
  iff2: bool;

  // The current Interrupt mode
  interruptMode: u8;

  // The interrupt is blocked
  isInterruptBlocked: bool;

  // Is currently in opcode execution?
  isInOpExecution: bool;

  // Gets the current execution flow status
  executionFlowStatus: MemoryStatusArray = new MemoryStatusArray();

  // Gets the current memory read status
  memoryReadStatus: MemoryStatusArray = new MemoryStatusArray();

  // Gets the current memory write status
  memoryWriteStatus: MemoryStatusArray = new MemoryStatusArray();

  // The current Operation Prefix Mode
  prefixMode: OpPrefixMode;

  // The current Operation Index Mode
  indexMode: OpIndexMode;

  // This flag indicates if the CPU entered into a maskable
  // interrupt method as a result of an INT signal
  maskableInterruptModeEntered: bool;

  // The last read operation code
  opCode: u8;

  // ==========================================================================
  // Instantiation

  /**
   * Instantiates the Z80 CPU
   * @param allowExtendedInstructionSet This flag signs if the Z80 extended
   * instruction set (Spectrum Next) is allowed, or NOP instructions should be
   * executed instead of these extended operations.
   */
  constructor(public allowExtendedInstructionSet: bool = false) {
    this.turnOn();
    this.memoryReader = (_addr: u16) => 0xff;
    this.memoryWriter = (_addr: u16, _value: u8) => {};
    this.portReader = (_addr: u16) => 0xff;
    this.portWriter = (_addr: u16, _value: u8) => {};
    this.tbBlueIndexWriter = (_index: u8) => {};
    this.tbBlueValueWriter = (_value: u8) => {};
    this.tactsInFrame = 100_000;
  }

  /**
   * Sets the memory handler functions
   * @param reader Reader function
   * @param writer Writer function
   */
  setMemoryHandlers(
    reader: (addr: u16, suppress: bool) => u8,
    writer: (addr: u16, val: u8, suppress: bool) => void
  ): void {
    this.memoryReader = reader;
    this.memoryWriter = writer;
  }

  /**
   * Sets the port handler functions
   * @param reader Reader function
   * @param writer Writer function
   */
  setPortHandlers(
    reader: (addr: u16) => u8,
    writer: (addr: u16, val: u8) => void
  ): void {
    this.portReader = reader;
    this.portWriter = writer;
  }

  // ==========================================================================
  // CPU clock methods

  /**
   * Sets the number of tacts in a frame
   * @param value Number of tacts in a frame
   */
  setTactsInFrame(value: u32): void {
    this.tactsInFrame = value;
  }

  /**
   * Increments tacts with the specifind amount
   * @param value Value to increment tacts with
   */
  incTact(value: u8): void {
    this.frameTacts += <u32>value;
    if (this.frameTacts >= this.tactsInFrame) {
      this.frameCount++;
      this.frameTacts -= this.tactsInFrame;
    }
  }

  /**
   * Sets the state after turning on the power
   */
  turnOn(): void {
    this._af = 0xffff;
    this._bc = 0xffff;
    this._de = 0xffff;
    this._hl = 0xffff;
    this._af_sec = 0xffff;
    this._bc_sec = 0xffff;
    this._de_sec = 0xffff;
    this._hl_sec = 0xffff;
    this._i = 0xff;
    this._r = 0xff;
    this.pc = 0xffff;
    this.sp = 0xffff;
    this._ix = 0xffff;
    this._iy = 0xffff;
    this._wz = 0xffff;

    this.frameCount = 0;
    this.frameTacts = 0;
    this.stateFlags = Z80StateFlags.None;
    this.useGateArrayContention = false;
    this.iff1 = false;
    this.iff2 = false;
    this.interruptMode = 0;
    this.isInterruptBlocked = false;
    this.isInOpExecution = false;
    this.executionFlowStatus.clearAll();
    this.memoryReadStatus.clearAll();
    this.memoryWriteStatus.clearAll();
    this.prefixMode = OpPrefixMode.None;
    this.indexMode = OpIndexMode.None;
    this.maskableInterruptModeEntered = false;
    this.opCode = 0xff;
  }

  // ==========================================================================
  // Memory and port handling

  memoryReader: (addr: u16, suppress: bool) => u8;
  memoryWriter: (addr: u16, value: u8, suppress: bool) => void;
  portReader: (addr: u16) => u8;
  portWriter: (addr: u16, value: u8) => void;
  tbBlueIndexWriter: (index: u8) => void;
  tbBlueValueWriter: (value: u8) => void;

  // ==========================================================================
  // CPU State information

  /**
   * Gets a clone of the current CPU state
   */
  getCpuState(): TestZ80MachineState {
    const s = new TestZ80MachineState();
    s.a = this.a;
    s.f = this.f;
    s.af = this.af;
    s._af_ = this._af_;
    s.b = this.b;
    s.c = this.c;
    s.bc = this.bc;
    s._bc_ = this._bc_;
    s.d = this.d;
    s.e = this.e;
    s.de = this.de;
    s._de_ = this._de_;
    s.h = this.h;
    s.l = this.l;
    s.hl = this.hl;
    s._hl_ = this._hl_;
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
    s.tactsH = this.frameCount;
    s.tactsL = this.frameTacts;
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
    this._af_ = s._af_;
    this.b = s.b;
    this.c = s.c;
    this.bc = s.bc;
    this._bc_ = s._bc_;
    this.d = this.d;
    this.e = s.e;
    this.de = s.de;
    this._de_ = s._de_;
    this.h = s.h;
    this.l = s.l;
    this.hl = s.hl;
    this._hl_ = s._hl_;
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
    this.frameCount = s.tactsH;
    this.frameTacts = s.tactsL;
    this.useGateArrayContention = s.useGateArrayContention;
    this.wh = s.wh;
    this.wl = s.wl;
    this.wz = s.wz;
  }

  /**
   * Serializes the CPU state into a binary stream
   */
  serializeCpuState(w: BinaryWriter): void {
    w.writeUint16(this.af);
    w.writeUint16(this.bc);
    w.writeUint16(this.de);
    w.writeUint16(this.hl);
    w.writeUint16(this._af_);
    w.writeUint16(this._bc_);
    w.writeUint16(this._de_);
    w.writeUint16(this._hl_);
    w.writeByte(this.i);
    w.writeByte(this.r);
    w.writeUint16(this.pc);
    w.writeUint16(this.sp);
    w.writeUint16(this.ix);
    w.writeUint16(this.iy);
    w.writeUint16(this.wz);
    w.writeByte(this.iff1 ? 1 : 0);
    w.writeByte(this.iff2 ? 1 : 0);
    w.writeByte(<u8>this.indexMode);
    w.writeByte(this.interruptMode);
    w.writeByte(this.isInOpExecution ? 1 : 0);
    w.writeByte(this.isInterruptBlocked ? 1 : 0);
    w.writeByte(this.maskableInterruptModeEntered ? 1 : 0);
    w.writeByte(this.opCode);
    w.writeByte(<u8>this.prefixMode);
    w.writeByte(<u8>this.stateFlags);
    w.writeUint32(this.frameCount);
    w.writeUint32(this.frameTacts);
    w.writeByte(this.useGateArrayContention ? 1 : 0);
  }

  /**
   * Restores the CPU state from a binary stream
   * @param state Binary stream
   */
  restoreCpuState(s: BinaryReader): void {
    this.af = s.readUint16();
    this.bc = s.readUint16();
    this.de = s.readUint16();
    this.hl = s.readUint16();
    this._af_ = s.readUint16();
    this._bc_ = s.readUint16();
    this._de_ = s.readUint16();
    this._hl_ = s.readUint16();
    this.i = s.readByte();
    this.r = s.readByte();
    this.pc = s.readUint16();
    this.sp = s.readUint16();
    this.ix = s.readUint16();
    this.iy = s.readUint16();
    this.wz = s.readUint16();
    this.iff1 = s.readByte() !== 0;
    this.iff2 = s.readByte() !== 0;
    this.indexMode = <OpIndexMode>s.readByte();
    this.interruptMode = s.readByte();
    this.isInOpExecution = s.readByte() !== 0;
    this.isInterruptBlocked = s.readByte() !== 0;
    this.maskableInterruptModeEntered = s.readByte() !== 0;
    this.opCode = s.readByte();
    this.prefixMode = <OpPrefixMode>s.readByte();
    this.stateFlags = <Z80StateFlags>s.readByte();
    this.frameCount = s.readUint32();
    this.frameTacts = s.readUint32();
    this.useGateArrayContention = s.readByte() !== 0;
  }

  // ==========================================================================
  // Registers access

  @inline
  get a(): u8 {
    return <u8>(this._af >> 8);
  }
  set a(v: u8) {
    this._af = ((<u16>v) << 8) | (<u8>this._af);
  }

  @inline
  get f(): u8 {
    return <u8>this.af;
  }
  set f(v: u8) {
    this._af = <u16>((this._af & 0xff00) | v);
  }

  @inline
  get af(): u16 {
    return this._af;
  }
  set af(v: u16) {
    this._af = v;
  }

  @inline
  get b(): u8 {
    return <u8>(this._bc >> 8);
  }
  set b(v: u8) {
    this._bc = ((<u16>v) << 8) | (<u8>this._bc);
  }

  @inline
  get c(): u8 {
    return <u8>this._bc;
  }
  set c(v: u8) {
    this._bc = <u16>((this._bc & 0xff00) | v);
  }

  @inline
  get bc(): u16 {
    return this._bc;
  }
  set bc(v: u16) {
    this._bc = v;
  }

  @inline
  get d(): u8 {
    return <u8>(this._de >> 8);
  }
  set d(v: u8) {
    this._de = ((<u16>v) << 8) | (<u8>this._de);
  }

  @inline
  get e(): u8 {
    return <u8>this._de;
  }
  set e(v: u8) {
    this._de = <u16>((this._de & 0xff00) | v);
  }

  @inline
  get de(): u16 {
    return this._de;
  }
  set de(v: u16) {
    this._de = v;
  }

  @inline
  get h(): u8 {
    return <u8>(this._hl >> 8);
  }
  set h(v: u8) {
    this._hl = ((<u16>v) << 8) | (<u8>this._hl);
  }

  @inline
  get l(): u8 {
    return <u8>this._hl;
  }
  set l(v: u8) {
    this._hl = <u16>((this._hl & 0xff00) | v);
  }

  @inline
  get hl(): u16 {
    return this._hl;
  }
  set hl(v: u16) {
    this._hl = v;
  }

  get _af_(): u16 {
    return this._af_sec;
  }
  set _af_(v: u16) {
    this._af_sec = v;
  }
  get _bc_(): u16 {
    return this._bc_sec;
  }
  set _bc_(v: u16) {
    this._bc_sec = v;
  }
  get _de_(): u16 {
    return this._de_sec;
  }
  set _de_(v: u16) {
    this._de_sec = v;
  }
  get _hl_(): u16 {
    return this._hl_sec;
  }
  set _hl_(v: u16) {
    this._hl_sec = v;
  }

  @inline
  get i(): u8 {
    return this._i;
  }
  set i(v: u8) {
    this._i = v;
  }

  @inline
  get r(): u8 {
    return this._r;
  }
  set r(v: u8) {
    this._r = v;
  }

  pc: u16;
  sp: u16;

  @inline
  get xh(): u8 {
    return <u8>(this._ix >> 8);
  }
  set xh(v: u8) {
    this._ix = ((<u16>v) << 8) | (<u8>this._ix);
  }

  @inline
  get xl(): u8 {
    return <u8>this._ix;
  }
  set xl(v: u8) {
    this._ix = <u16>((this._ix & 0xff00) | v);
  }

  @inline
  get ix(): u16 {
    return this._ix;
  }
  set ix(v: u16) {
    this._ix = v;
  }

  @inline
  get yh(): u8 {
    return <u8>(this._iy >> 8);
  }
  set yh(v: u8) {
    this._iy = ((<u16>v) << 8) | (<u8>this._iy);
  }

  @inline
  get yl(): u8 {
    return <u8>this._iy;
  }
  set yl(v: u8) {
    this._iy = <u16>((this._iy & 0xff00) | v);
  }

  @inline
  get iy(): u16 {
    return this._iy;
  }
  set iy(v: u16) {
    this._iy = v;
  }

  @inline
  get wh(): u8 {
    return <u8>(this._wz >> 8);
  }
  set wh(v: u8) {
    this._wz = ((<u16>v) << 8) | (<u8>this._wz);
  }

  @inline
  get wl(): u8 {
    return <u8>this._wz;
  }
  set wl(v: u8) {
    this._wz = <u16>((this._wz & 0xff00) | v);
  }

  @inline
  get wz(): u16 {
    return this._wz;
  }
  set wz(v: u16) {
    this._wz = v;
  }

  /**
   * Get 8-bit register value by its index
   * @param index Register index
   */
  getReg8(index: u8): u8 {
    switch (index) {
      case 0:
        return <u8>(this._bc >> 8);
      case 1:
        return <u8>this._bc;
      case 2:
        return <u8>(this._de >> 8);
      case 3:
        return <u8>this._de;
      case 4:
        return <u8>(this._hl >> 8);
      case 5:
        return <u8>this._hl;
      case 7:
        return <u8>(this._af >> 8);
      default:
        return 0xff;
    }
  }

  /**
   * Set 8-bit register value by its index
   * @param index Register index
   * @param value Register value
   */
  setReg8(index: u8, value: u8): void {
    switch (index) {
      case 0:
        this.b = value;
        break;
      case 1:
        this.c = value;
        break;
      case 2:
        this.d = value;
        break;
      case 3:
        this.e = value;
        break;
      case 4:
        this.h = value;
        break;
      case 5:
        this.l = value;
        break;
      case 7:
        this.a = value;
        break;
    }
  }

  /**
   * Get 16-bit register value by its index
   * @param index Register index
   */
  getReg16(index: u8): u16 {
    switch (index) {
      case 0:
        return this._bc;
      case 1:
        return this._de;
      case 2:
        return this._hl;
      case 3:
        return this.sp;
      default:
        return 0xffff;
    }
  }

  /**
   * Set 16-bit register value by its index
   * @param index Register index
   * @param value Register value
   */
  setReg16(index: u8, value: u16): void {
    switch (index) {
      case 0:
        this.bc = value;
        break;
      case 1:
        this.de = value;
        break;
      case 2:
        this.hl = value;
        break;
      case 3:
        this.sp = value;
        break;
    }
  }

  /**
   * Gets the value of the current index register
   */
  @inline
  getIndexReg(): u16 {
    return this.indexMode === OpIndexMode.IY ? this.iy : this.ix;
  }

  /**
   * Sets the value of the current index register
   * @param value Value to set
   */
  @inline
  setIndexReg(value: u16): void {
    if (this.indexMode === OpIndexMode.IY) {
      this.iy = value;
    } else {
      this.ix = value;
    }
  }

  // ==========================================================================
  // Flags access

  get sFlag(): bool {
    return ((<u8>this._af) & FlagsSetMask.S) !== 0;
  }
  get zFlag(): bool {
    return ((<u8>this._af) & FlagsSetMask.Z) !== 0;
  }
  get r5Flag(): bool {
    return ((<u8>this._af) & FlagsSetMask.R5) !== 0;
  }
  get hFlag(): bool {
    return ((<u8>this._af) & FlagsSetMask.H) !== 0;
  }
  get r3Flag(): bool {
    return ((<u8>this._af) & FlagsSetMask.R3) !== 0;
  }
  get pvFlag(): bool {
    return ((<u8>this._af) & FlagsSetMask.PV) !== 0;
  }
  get nFlag(): bool {
    return ((<u8>this._af) & FlagsSetMask.N) !== 0;
  }
  get cFlag(): bool {
    return ((<u8>this._af) & FlagsSetMask.C) !== 0;
  }

  // ==========================================================================
  // Memory and port accessors

  /**
   * Reads the memory from the specified address
   * @param address Memory address
   */
  readMemory(address: u16): u8 {
    return this.memoryReader(address, false);
  }

  /**
   * Writes the memory
   * @param address Memory address
   * @param value Datat to write
   */
  writeMemory(address: u16, value: u8): void {
    this.memoryWriter(address, value, false);
  }

  /**
   * Reads the specified I/O port
   * @param address Memory address
   */
  readPort(address: u16): u8 {
    return this.portReader(address);
  }

  /**
   * Writes the specified I/O port
   * @param address Memory address
   * @param value Data to write
   */
  writePort(address: u16, value: u8): void {
    this.portWriter(address, value);
  }

  /**
   * Writes the TBBLUE index
   * @param value Index to write
   */
  writeTbBlueIndex(index: u8): void {
    this.tbBlueIndexWriter(index);
  }

  /**
   * Writes the TBBLUE value
   * @param value Index to write
   */
  writeTbBlueValue(value: u8): void {
    this.tbBlueValueWriter(value);
  }

  // ==========================================================================
  // Public operations

  /**
   * Applies the RESET signal
   */
  reset(): void {
    this.executeReset();
  }

  /**
   * Increases the clock with the specified amount of ticks.
   * @param ticks Clock ticks
   */
  delay(ticks: i32): void {
    this.incTact(<u8>ticks);
  }

  /**
   * Executes a CPU cycle
   */
  executeCpuCycle(): void {
    // --- If any of the RST, INT or NMI signals has been processed,
    // --- Execution flow in now on the corresponding way
    // --- Nothing more to do in this execution cycle
    if (this.stateFlags !== Z80StateFlags.None && this.processCpuSignals()) {
      return;
    }

    // --- Get operation code and refresh the memory
    let opCode = this.readCodeMemory();
    this.incTact(3);
    this.pc++;
    this.refreshMemory();

    if (this.prefixMode === OpPrefixMode.None) {
      // -- The CPU is about to execute a standard operation
      switch (opCode) {
        case 0xdd:
          // --- An IX index prefix received
          // --- Disable the interrupt unless the full operation code is received
          this.indexMode = OpIndexMode.IX;
          this.isInOpExecution = this.isInterruptBlocked = true;
          return;

        case 0xfd:
          // --- An IY index prefix received
          // --- Disable the interrupt unless the full operation code is received
          this.indexMode = OpIndexMode.IY;
          this.isInOpExecution = this.isInterruptBlocked = true;
          return;

        case 0xcb:
          // --- A bit operation prefix received
          // --- Disable the interrupt unless the full operation code is received
          this.prefixMode = OpPrefixMode.Bit;
          this.isInOpExecution = this.isInterruptBlocked = true;
          return;

        case 0xed:
          // --- An extended operation prefix received
          // --- Disable the interrupt unless the full operation code is received
          this.prefixMode = OpPrefixMode.Extended;
          this.isInOpExecution = this.isInterruptBlocked = true;
          return;

        default:
          // --- Normal (8-bit) operation code received
          this.isInterruptBlocked = false;
          this.opCode = opCode;
          this.processStandardOrIndexedOperations();
          this.prefixMode = OpPrefixMode.None;
          this.indexMode = OpIndexMode.None;
          this.isInOpExecution = false;
          return;
      }
    }

    if (this.prefixMode === OpPrefixMode.Bit) {
      // --- The CPU is already in BIT operations (0xCB) prefix mode
      this.isInterruptBlocked = false;
      this.opCode = opCode;
      this.processCBPrefixedOperations();
      this.indexMode = OpIndexMode.None;
      this.prefixMode = OpPrefixMode.None;
      this.isInOpExecution = false;
      return;
    }

    if (this.prefixMode === OpPrefixMode.Extended) {
      // --- The CPU is already in Extended operations (0xED) prefix mode
      this.isInterruptBlocked = false;
      this.opCode = opCode;
      this.processEDOperations();
      this.indexMode = OpIndexMode.None;
      this.prefixMode = OpPrefixMode.None;
      this.isInOpExecution = false;
    }
  }

  // Checks if the next instruction to be executed is a call instruction or not
  getCallInstructionLength(): i32 {
    // --- We intentionally avoid using ReadMemory() directly
    // --- So that we can prevent false memory touching.
    let opCode = this.readMemory(this.pc);

    // --- CALL instruction
    if (opCode === 0xcd) {
      return 3;
    }

    // --- Call instruction with condition
    if ((opCode & 0xc7) === 0xc4) {
      return 3;
    }

    // --- Check for RST instructions
    if ((opCode & 0xc7) === 0xc7) {
      return 1;
    }

    // --- Check for HALT instruction
    if (opCode === 0x76) {
      return 1;
    }

    // --- Check for extended instruction prefix
    if (opCode !== 0xed) {
      return 0;
    }

    // --- Check for I/O and block transfer instructions
    opCode = this.readMemory((this.pc + 1) & 0xffff);
    return (opCode & 0xb4) === 0xb0 ? 2 : 0;
  }

  // ==========================================================================
  // Private operations

  // Processes the CPU signals coming from peripheral devices
  // of the computer
  // Returns true, if a signal has been processed; otherwise, false
  private processCpuSignals(): bool {
    if (
      (this.stateFlags & Z80StateFlags.Int) !== 0 &&
      !this.isInterruptBlocked &&
      this.iff1
    ) {
      this.executeInterrupt();
      return true;
    }

    if ((this.stateFlags & Z80StateFlags.Halted) !== 0) {
      // --- The HALT instruction suspends CPU operation until a
      // --- subsequent interrupt or reset is received. While in the
      // --- HALT state, the processor executes NOPs to maintain
      // --- memory refresh logic.
      this.incTact(3);
      this.refreshMemory();
      return true;
    }

    if ((this.stateFlags & Z80StateFlags.Reset) !== 0) {
      this.executeReset();
      return true;
    }

    if ((this.stateFlags & Z80StateFlags.Nmi) !== 0) {
      this.executeNmi();
      return true;
    }

    return false;
  }

  // Read the memory at the PC address
  readCodeMemory(): u8 {
    this.executionFlowStatus.touch(this.pc);
    return this.readMemory(this.pc);
  }

  /**
   * Executes a hard reset
   */
  private executeReset(): void {
    this.iff1 = false;
    this.iff2 = false;
    this.interruptMode = 0;
    this.isInterruptBlocked = false;
    this.stateFlags = Z80StateFlags.None;
    this.prefixMode = OpPrefixMode.None;
    this.indexMode = OpIndexMode.None;
    this.pc = 0x0000;
    this.i = 0x00;
    this.r = 0x00;
    this.isInOpExecution = false;
    this.frameCount = 0;
    this.frameTacts = 0;
  }

  /**
   * Executes an INT request
   */
  private executeInterrupt(): void {
    if ((this.stateFlags & Z80StateFlags.Halted) !== 0) {
      // --- We emulate stepping over the HALT instruction
      this.pc++;
      this.stateFlags &= Z80StateFlags.InvHalted;
    }
    this.iff1 = false;
    this.iff2 = false;
    this.sp--;
    this.incTact(1);
    this.writeMemory(this.sp, <u8>(this.pc >> 8));
    this.incTact(3);
    this.sp--;
    this.writeMemory(this.sp, <u8>(this.pc & 0xff));
    this.incTact(3);

    switch (this.interruptMode) {
      // --- Interrupt Mode 0:
      // --- The interrupting device can place any instruction on
      // --- the data bus and the CPU executes it. Consequently, the
      // --- interrupting device provides the next instruction to be
      // --- executed.
      case 0:

      // --- Interrupt Mode 1:
      // --- The CPU responds to an interrupt by executing a restart
      // --- at address 0038h.As a result, the response is identical to
      // --- that of a nonmaskable interrupt except that the call
      // --- location is 0038h instead of 0066h.
      case 1:
        // --- In this implementation, we do cannot emulate a device
        // --- that places instruction on the data bus, so we'll handle
        // --- IM 0 and IM 1 the same way
        this.wz = 0x0038;
        this.incTact(5);
        break;

      // --- Interrupt Mode 2:
      // --- The programmer maintains a table of 16-bit starting addresses
      // --- for every interrupt service routine. This table can be
      // --- located anywhere in memory. When an interrupt is accepted,
      // --- a 16-bit pointer must be formed to obtain the required interrupt
      // --- service routine starting address from the table. The upper
      // --- eight bits of this pointer is formed from the contents of the I
      // --- register.The I register must be loaded with the applicable value
      // --- by the programmer. A CPU reset clears the I register so that it
      // --- is initialized to 0. The lower eight bits of the pointer must be
      // --- supplied by the interrupting device. Only seven bits are required
      // --- from the interrupting device, because the least-significant bit
      // --- must be a 0.
      // --- This process is required, because the pointer must receive two
      // --- adjacent bytes to form a complete 16-bit service routine starting
      // --- address; addresses must always start in even locations.
      default:
        // --- Getting the lower byte from device (assume 0)
        this.incTact(2);
        let addr = <u16>((((this._i << 8) | this._r) & 0xff00) | 0xff);
        this.incTact(5);
        let l = this.readMemory(addr);
        this.incTact(3);
        let h = this.readMemory(++addr);
        this.incTact(3);
        this.wz = <u16>((h << 8) | l);
        this.incTact(6);
        break;
    }
    this.pc = this.wz;
  }

  /**
   * Takes care of refreching the dynamic memory
   * The Z80 CPU contains a memory refresh counter, enabling dynamic
   * memories to be used with the same ease as static memories. Seven
   * bits of this 8-bit register are automatically incremented after
   * each instruction fetch. The eighth bit remains as programmed,
   * resulting from an "LD R, A" instruction. The data in the refresh
   * counter is sent out on the lower portion of the address bus along
   * with a refresh control signal while the CPU is decoding and
   * executing the fetched instruction. This mode of refresh is
   * transparent to the programmer and does not slow the CPU operation.
   */
  private refreshMemory(): void {
    this.r = ((this.r + 1) & 0x7f) | (this.r & 0x80);
    this.incTact(1);
  }

  // Executes an NMI
  private executeNmi(): void {
    if ((this.stateFlags & Z80StateFlags.Halted) !== 0) {
      // --- We emulate stepping over the HALT instruction
      this.pc++;
      this.stateFlags &= Z80StateFlags.InvHalted;
    }
    this.iff2 = this.iff1;
    this.iff1 = false;
    this.sp--;
    this.incTact(1);
    this.writeMemory(this.sp, <u8>(this.pc >> 8));
    this.incTact(3);
    this.sp--;
    this.writeMemory(this.sp, <u8>(this.pc & 0xff));
    this.incTact(3);

    // --- NMI address
    this.pc = 0x0066;
  }

  // Process Z80 opcodes without a prefix, or with DD and FD prefix
  processStandardOrIndexedOperations(): void {
    const opMethod =
      this.indexMode === OpIndexMode.None
        ? standardOperations[this.opCode]
        : indexedOperations[this.opCode];
    if (opMethod) {
      opMethod(this);
    }
  }

  // Process Z80 opcodes with ED prefix
  processEDOperations(): void {
    const opMethod = extendedOperations[this.opCode];
    if (opMethod !== null) {
      opMethod(this);
    }
  }

  // Process Z80 opcodes with CB prefix
  processCBPrefixedOperations(): void {
    if (this.indexMode === OpIndexMode.None) {
      const opMethod = bitOperations[this.opCode];
      if (opMethod !== null) {
        opMethod(this);
      }
      return;
    }

    this.wz =
      (this.indexMode === OpIndexMode.IX ? this.ix : this.iy) + <i8>this.opCode;
    if (!this.useGateArrayContention) {
      this.readMemory(this.pc - 1);
    }
    this.incTact(1);
    this.opCode = this.readCodeMemory();
    this.incTact(3);
    this.pc++;
    const opMethod = indexedBitOperations[this.opCode];
    if (opMethod !== null) {
      opMethod(this, this.wz);
    }
  }

  // ========================================================================
  // ALU Helper functions

  //
  /**
   * Adds the `regHL` value and `regOther` value/ according to the rule of
   * ADD HL,QQ operation
   * @param regHL
   * @param regOther
   */
  aluAddHL(regHL: u16, regOther: u16): u16 {
    // --- Keep unaffected flags
    this.f = <u8>(
      (this.f &
        ~(
          FlagsSetMask.N |
          FlagsSetMask.C |
          FlagsSetMask.R5 |
          FlagsSetMask.R3 |
          FlagsSetMask.H
        ))
    );

    // --- Calculate Carry from bit 11
    this.f |= <u8>(
      ((((regHL & 0x0fff) + (regOther & 0x0fff)) >> 8) & FlagsSetMask.H)
    );
    let res = <u32>regHL + <u32>regOther;

    // --- Calculate Carry
    if ((res & 0x10000) !== 0) {
      this.f |= <u8>FlagsSetMask.C;
    }

    // --- Set R5 and R3 according to the low 8-bit of result
    this.f |= <u8>((res >> 8) & 0xff & (FlagsSetMask.R5 | FlagsSetMask.R3));
    return <u16>res;
  }

  /**
   * Increments the specified value and sets F according to INC ALU logic
   */
  aluIncByte(value: u8): u8 {
    this.f = incOpFlags[value] | (<u8>(this.f & FlagsSetMask.C));
    value++;
    return value;
  }

  /**
   * Increments the specified value and sets F according to INC ALU logic
   */
  aluDecByte(val: u8): u8 {
    this.f = decOpFlags[val] | (<u8>(this.f & FlagsSetMask.C));
    val--;
    return val;
  }
}

// ==========================================================================
// Helper types

// ==========================================================================
// ALU Helpers

/**
 * 8 bit INC operation flags
 */
const incOpFlags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  const oldVal: u8 = <u8>b;
  const newVal: u8 = <u8>(oldVal + 1);
  incOpFlags[b] = <u8>(
    ((newVal & FlagsSetMask.R3) |
      (newVal & FlagsSetMask.R5) |
      ((newVal & 0x80) !== 0 ? FlagsSetMask.S : 0) |
      (newVal === 0 ? FlagsSetMask.Z : 0) |
      ((oldVal & 0x0f) === 0x0f ? FlagsSetMask.H : 0) |
      (oldVal === 0x7f ? FlagsSetMask.PV : 0))
  );
}

/**
 * 8 bit DEC operation flags
 */
const decOpFlags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  const oldVal: u8 = <u8>b;
  const newVal: u8 = <u8>(oldVal - 1);
  decOpFlags[b] = <u8>(
    ((newVal & FlagsSetMask.R3) |
      (newVal & FlagsSetMask.R5) |
      ((newVal & 0x80) !== 0 ? FlagsSetMask.S : 0) |
      (newVal === 0 ? FlagsSetMask.Z : 0) |
      ((oldVal & 0x0f) === 0x00 ? FlagsSetMask.H : 0) |
      (oldVal === 0x80 ? FlagsSetMask.PV : 0) |
      FlagsSetMask.N)
  );
}

/**
 * DAA flags table
 */
const daaResults: u16[] = [];
for (let b = 0; b < 0x100; b++) {
  const hNibble = b >> 4;
  const lNibble = b & 0x0f;

  for (let H = 0; H <= 1; H++) {
    for (let N = 0; N <= 1; N++) {
      for (let C = 0; C <= 1; C++) {
        // --- Calculate DIFF and the new value of C Flag
        let diff = 0x00;
        let cAfter = 0;
        if (C === 0) {
          if (hNibble >= 0 && hNibble <= 9 && lNibble >= 0 && lNibble <= 9) {
            diff = H === 0 ? 0x00 : 0x06;
          } else if (
            hNibble >= 0 &&
            hNibble <= 8 &&
            lNibble >= 0x0a &&
            lNibble <= 0xf
          ) {
            diff = 0x06;
          } else if (
            hNibble >= 0x0a &&
            hNibble <= 0x0f &&
            lNibble >= 0 &&
            lNibble <= 9 &&
            H === 0
          ) {
            diff = 0x60;
            cAfter = 1;
          } else if (
            hNibble >= 9 &&
            hNibble <= 0x0f &&
            lNibble >= 0x0a &&
            lNibble <= 0xf
          ) {
            diff = 0x66;
            cAfter = 1;
          } else if (
            hNibble >= 0x0a &&
            hNibble <= 0x0f &&
            lNibble >= 0 &&
            lNibble <= 9
          ) {
            if (H === 1) {
              diff = 0x66;
            }
            cAfter = 1;
          }
        } else {
          // C == 1
          cAfter = 1;
          if (lNibble >= 0 && lNibble <= 9) {
            diff = H === 0 ? 0x60 : 0x66;
          } else if (lNibble >= 0x0a && lNibble <= 0x0f) {
            diff = 0x66;
          }
        }

        // --- Calculate new value of H Flag
        let hAfter = 0;
        if (
          (lNibble >= 0x0a && lNibble <= 0x0f && N === 0) ||
          (lNibble >= 0 && lNibble <= 5 && N === 1 && H === 1)
        ) {
          hAfter = 1;
        }

        // --- Calculate new value of register A
        let A = (N === 0 ? b + diff : b - diff) & 0xff;

        // --- Calculate other flags
        let aPar = 0;
        let val = A;
        for (let i = 0; i < 8; i++) {
          aPar += val & 0x01;
          val >>= 1;
        }

        // --- Calculate result
        let fAfter =
          (A & FlagsSetMask.R3) |
          (A & FlagsSetMask.R5) |
          ((A & 0x80) !== 0 ? FlagsSetMask.S : 0) |
          (A === 0 ? FlagsSetMask.Z : 0) |
          (aPar % 2 === 0 ? FlagsSetMask.PV : 0) |
          (N === 1 ? FlagsSetMask.N : 0) |
          (hAfter === 1 ? FlagsSetMask.H : 0) |
          (cAfter === 1 ? FlagsSetMask.C : 0);

        let result = ((A << 8) | (fAfter & 0xff)) & 0xffff;
        let fBefore = (H * 4 + N * 2 + C) & 0xff;
        let idx = (fBefore << 8) + b;
        daaResults[idx] = <u16>result;
      }
    }
  }
}

/**
 * ADD and ADC flags
 */
const adcFlags: u8[] = [];
for (let C = 0; C < 2; C++) {
  for (let X = 0; X < 0x100; X++) {
    for (let Y = 0; Y < 0x100; Y++) {
      const res = (X + Y + C) & 0xffff;
      let flags = 0;
      if ((res & 0xff) === 0) {
        flags |= FlagsSetMask.Z;
      }
      flags |= res & (FlagsSetMask.R3 | FlagsSetMask.R5 | FlagsSetMask.S);
      if (res >= 0x100) {
        flags |= FlagsSetMask.C;
      }
      if ((((X & 0x0f) + (Y & 0x0f) + C) & 0x10) !== 0) {
        flags |= FlagsSetMask.H;
      }
      let ri = <i16>(<i16>(<i8>X) + <i16>(<i8>Y) + C);
      if (ri >= 0x80 || ri <= -0x81) {
        flags |= FlagsSetMask.PV;
      }
      adcFlags[C * 0x10000 + X * 0x100 + Y] = <u8>flags;
    }
  }
}

/**
 * SUB and SBC flags
 */
const sbcFlags: u8[] = [];
for (let C = 0; C < 2; C++) {
  for (let X = 0; X < 0x100; X++) {
    for (let Y = 0; Y < 0x100; Y++) {
      const res = X - Y - C;
      let flags = res & (FlagsSetMask.R3 | FlagsSetMask.R5 | FlagsSetMask.S);
      if ((res & 0xff) === 0) {
        flags |= FlagsSetMask.Z;
      }
      if ((res & 0x10000) !== 0) {
        flags |= FlagsSetMask.C;
      }
      let ri = <i16>(<i16>(<i8>X) - <i16>(<i8>Y) - C);
      if (ri >= 0x80 || ri < -0x80) {
        flags |= FlagsSetMask.PV;
      }
      if ((((X & 0x0f) - (res & 0x0f) - C) & 0x10) !== 0) {
        flags |= FlagsSetMask.H;
      }
      flags |= FlagsSetMask.N;
      sbcFlags[C * 0x10000 + X * 0x100 + Y] = <u8>flags;
    }
  }
}

/**
 * ALU log operation (AND, XOR, OR) flags
 */
const aluLogOpFlags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  const fl = b & (FlagsSetMask.R3 | FlagsSetMask.R5 | FlagsSetMask.S);
  let p = FlagsSetMask.PV;
  for (let i = 0x80; i !== 0; i /= 2) {
    if ((b & i) !== 0) {
      p ^= FlagsSetMask.PV;
    }
  }
  aluLogOpFlags[b] = <u8>(fl | p);
}
aluLogOpFlags[0] |= <u8>FlagsSetMask.Z;

/**
 * 8-bit RLC operation flags
 */
const rlcFlags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  let rlcVal = b;
  rlcVal <<= 1;
  let cf = (rlcVal & 0x100) !== 0 ? FlagsSetMask.C : 0;
  if (cf !== 0) {
    rlcVal = (rlcVal | 0x01) & 0xff;
  }
  let p = FlagsSetMask.PV;
  for (let i = 0x80; i !== 0; i /= 2) {
    if ((rlcVal & i) !== 0) {
      p ^= FlagsSetMask.PV;
    }
  }
  let flags =
    ((rlcVal & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3)) | p | cf) &
    0xff;
  if (rlcVal === 0) {
    flags |= FlagsSetMask.Z;
  }
  rlcFlags[b] = <u8>flags;
}

/**
 * 8-bit RRC operation flags
 */
const rrcFlags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  let rrcVal = b;
  let cf = (rrcVal & 0x01) !== 0 ? FlagsSetMask.C : 0;
  rrcVal >>= 1;
  if (cf !== 0) {
    rrcVal = rrcVal | 0x80;
  }
  let p = FlagsSetMask.PV;
  for (let i = 0x80; i !== 0; i /= 2) {
    if ((rrcVal & i) !== 0) {
      p ^= FlagsSetMask.PV;
    }
  }
  let flags =
    ((rrcVal & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3)) | p | cf) &
    0xff;
  if (rrcVal === 0) {
    flags |= FlagsSetMask.Z;
  }
  rrcFlags[b] = <u8>flags;
}

/**
 * 8-bit RL operations with 0 Carry flag
 */
const rlCarry0Flags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  let rlVal = b;
  rlVal <<= 1;
  let cf = (rlVal & 0x100) !== 0 ? FlagsSetMask.C : 0;
  let p = FlagsSetMask.PV;
  for (let i = 0x80; i !== 0; i /= 2) {
    if ((rlVal & i) !== 0) {
      p ^= FlagsSetMask.PV;
    }
  }
  let flags =
    ((rlVal & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3)) | p | cf) &
    0xff;
  if ((rlVal & 0xff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  rlCarry0Flags[b] = <u8>flags;
}

/**
 * 8-bit RL operations with Carry flag set
 */
const rlCarry1Flags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  let rlVal = b;
  rlVal <<= 1;
  rlVal++;
  let cf = (rlVal & 0x100) !== 0 ? FlagsSetMask.C : 0;
  let p = FlagsSetMask.PV;
  for (let i = 0x80; i !== 0; i /= 2) {
    if ((rlVal & i) !== 0) {
      p ^= FlagsSetMask.PV;
    }
  }
  let flags =
    ((rlVal & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3)) | p | cf) &
    0xff;
  if ((rlVal & 0x1ff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  rlCarry1Flags[b] = <u8>flags;
}

/**
 * 8-bit RR operations with 0 Carry flag
 */
const rrCarry0Flags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  let rrVal = b;
  let cf = (rrVal & 0x01) !== 0 ? FlagsSetMask.C : 0;
  rrVal >>= 1;
  let p = FlagsSetMask.PV;
  for (let i = 0x80; i !== 0; i /= 2) {
    if ((rrVal & i) !== 0) {
      p ^= FlagsSetMask.PV;
    }
  }
  let flags =
    ((rrVal & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3)) | p | cf) &
    0xff;
  if (rrVal === 0) {
    flags |= FlagsSetMask.Z;
  }
  rrCarry0Flags[b] = <u8>flags;
}

/**
 * 8-bit RR operations with Carry flag set
 */
const rrCarry1Flags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  let rrVal = b;
  let cf = (rrVal & 0x01) !== 0 ? FlagsSetMask.C : 0;
  rrVal >>= 1;
  rrVal += 0x80;
  let p = FlagsSetMask.PV;
  for (let i = 0x80; i !== 0; i /= 2) {
    if ((rrVal & i) !== 0) {
      p ^= FlagsSetMask.PV;
    }
  }
  let flags =
    ((rrVal & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3)) | p | cf) &
    0xff;
  if (rrVal === 0) {
    flags |= FlagsSetMask.Z;
  }
  rrCarry1Flags[b] = <u8>flags;
}

/**
 * 8-bit SRA operation flags
 */
const sraFlags: u8[] = [];
for (let b = 0; b < 0x100; b++) {
  let sraVal = b;
  let cf = (sraVal & 0x01) !== 0 ? FlagsSetMask.C : 0;
  sraVal = (sraVal >> 1) + (sraVal & 0x80);
  let p = FlagsSetMask.PV;
  for (let i = 0x80; i !== 0; i /= 2) {
    if ((sraVal & i) !== 0) {
      p ^= FlagsSetMask.PV;
    }
  }
  let flags =
    ((sraVal & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3)) | p | cf) &
    0xff;
  if ((sraVal & 0xff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  sraFlags[b] = <u8>flags;
}

// --- Initialize rotate operation tables
const rolOpResults: u8[] = [];
const rorOpResults: u8[] = [];

for (let b = 0; b < 0x100; b++) {
  rolOpResults[b] = <u8>((b << 1) + (b >> 7));
  rorOpResults[b] = <u8>((b >> 1) + (b << 7));
}

// ========================================================================
// Alu operations

type AluAlgorithm = (cpu: Z80Cpu, value: u8, carry: bool) => void;
const aluAlgorithms: AluAlgorithm[] = [
  AluADD,
  AluADC,
  AluSUB,
  AluSBC,
  AluAND,
  AluXOR,
  AluOR,
  AluCP,
];

//
/**
 * Executes the ADD operation.
 */
function AluADD(cpu: Z80Cpu, right: u8, cf: bool): void {
  AluADC(cpu, right, false);
}

/**
 * Executes the ADC operation.
 */
function AluADC(cpu: Z80Cpu, right: u8, cf: bool): void {
  const c = cf ? 1 : 0;
  const result = <u16>cpu.a + <u16>right + <u16>c;
  const signed = <i16>(<i16>(<i8>cpu.a) + <i16>(<i8>right) + c);
  const lNibble = ((cpu.a & 0x0f) + (right & 0x0f) + c) & 0x10;

  var flags = result & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3);
  if (<u8>result === 0) {
    flags |= FlagsSetMask.Z;
  }
  if (result >= 0x100) {
    flags |= FlagsSetMask.C;
  }
  if (lNibble !== 0) {
    flags |= FlagsSetMask.H;
  }
  if (signed >= 0x80 || signed <= -0x81) {
    flags |= FlagsSetMask.PV;
  }
  cpu.af = <u16>((result << 8) | (<u8>flags));
}

/**
 * Executes the SUB operation.
 */
function AluSUB(cpu: Z80Cpu, right: u8, cf: bool): void {
  AluSBC(cpu, right, false);
}

/**
 * Executes the SBC operation.
 */
function AluSBC(cpu: Z80Cpu, right: u8, cf: bool): void {
  const c = cf ? 1 : 0;
  const result = <u16>cpu.a - <u16>right - <u16>c;
  const signed = <i16>(<i16>(<i8>cpu.a) - <i16>(<i8>right) - c);
  const lNibble = ((cpu.a & 0x0f) - (right & 0x0f) - c) & 0x10;

  var flags = result & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3);
  flags |= FlagsSetMask.N;
  if (<u8>result === 0) {
    flags |= FlagsSetMask.Z;
  }
  if (result >= 0x100) {
    flags |= FlagsSetMask.C;
  }
  if (lNibble !== 0) {
    flags |= FlagsSetMask.H;
  }
  if (signed >= 0x80 || signed <= -0x81) {
    flags |= FlagsSetMask.PV;
  }
  cpu.af = <u16>((result << 8) | (<u8>flags));
}

/**
 * Executes the AND operation.
 */
function AluAND(cpu: Z80Cpu, right: u8, cf: bool): void {
  cpu.a &= right;
  cpu.f = <u8>(aluLogOpFlags[cpu.a] | FlagsSetMask.H);
}

/**
 * Executes the XOR operation.
 */
function AluXOR(cpu: Z80Cpu, right: u8, cf: bool): void {
  cpu.a ^= right;
  cpu.f = aluLogOpFlags[cpu.a];
}

/**
 * Executes the OR operation.
 */
function AluOR(cpu: Z80Cpu, right: u8, cf: bool): void {
  cpu.a |= right;
  cpu.f = aluLogOpFlags[cpu.a];
}

/**
 * Executes the CP operation.
 */
function AluCP(cpu: Z80Cpu, right: u8, cf: bool): void {
  const result = <u16>cpu.a - <u16>right;
  const signed = <i16>(<i16>(<i8>cpu.a) - <i16>(<i8>right));
  const lNibble = ((cpu.a & 0x0f) - (right & 0x0f)) & 0x10;
  var flags = result & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3);
  flags |= FlagsSetMask.N;
  if (<u8>result === 0) {
    flags |= FlagsSetMask.Z;
  }
  if (result >= 0x100) {
    flags |= FlagsSetMask.C;
  }
  if (lNibble !== 0) {
    flags |= FlagsSetMask.H;
  }
  if (signed >= 0x80 || signed <= -0x81) {
    flags |= FlagsSetMask.PV;
  }
  cpu.f = <u8>flags;
}

// ==========================================================================
// Operation dispatch tables

/**
 * Operation function type
 */
type CpuOp = (cpu: Z80Cpu) => void;
type IndexedCpuOp = (cpu: Z80Cpu, addr: u16) => void;

/**
 * Standard operations without prefix
 */
const standardOperations: (CpuOp | null)[] = [
  /* 0x00 */ null,
  /* 0x01 */ LdQQNN,
  /* 0x02 */ LdBCiA,
  /* 0x03 */ IncQQ,
  /* 0x04 */ IncQ,
  /* 0x05 */ DecQ,
  /* 0x06 */ LdQN,
  /* 0x07 */ Rlca,
  /* 0x08 */ ExAf,
  /* 0x09 */ AddHlQQ,
  /* 0x0a */ LdABci,
  /* 0x0b */ DecQQ,
  /* 0x0c */ IncQ,
  /* 0x0d */ DecQ,
  /* 0x0e */ LdQN,
  /* 0x0f */ Rrca,
  /* 0x10 */ Djnz,
  /* 0x11 */ LdQQNN,
  /* 0x12 */ LdDEiA,
  /* 0x13 */ IncQQ,
  /* 0x14 */ IncQ,
  /* 0x15 */ DecQ,
  /* 0x16 */ LdQN,
  /* 0x17 */ Rla,
  /* 0x18 */ JrE,
  /* 0x19 */ AddHlQQ,
  /* 0x1a */ LdADei,
  /* 0x1b */ DecQQ,
  /* 0x1c */ IncQ,
  /* 0x1d */ DecQ,
  /* 0x1e */ LdQN,
  /* 0x1f */ Rra,
  /* 0x20 */ JrNz,
  /* 0x21 */ LdQQNN,
  /* 0x22 */ LdNNiHl,
  /* 0x23 */ IncQQ,
  /* 0x24 */ IncQ,
  /* 0x25 */ DecQ,
  /* 0x26 */ LdQN,
  /* 0x27 */ Daa,
  /* 0x28 */ JrZ,
  /* 0x29 */ AddHlQQ,
  /* 0x2a */ LdHlNNi,
  /* 0x2b */ DecQQ,
  /* 0x2c */ IncQ,
  /* 0x2d */ DecQ,
  /* 0x2e */ LdQN,
  /* 0x2f */ Cpl,
  /* 0x30 */ JrNc,
  /* 0x31 */ LdQQNN,
  /* 0x32 */ LdNNiA,
  /* 0x33 */ IncQQ,
  /* 0x34 */ IncHli,
  /* 0x35 */ DecHli,
  /* 0x36 */ LdHliN,
  /* 0x37 */ Scf,
  /* 0x38 */ JrC,
  /* 0x39 */ AddHlQQ,
  /* 0x3a */ LdANNi,
  /* 0x3b */ DecQQ,
  /* 0x3c */ IncQ,
  /* 0x3d */ DecQ,
  /* 0x3e */ LdQN,
  /* 0x3f */ Ccf,
  /* 0x40 */ null,
  /* 0x41 */ LdQW,
  /* 0x42 */ LdQW,
  /* 0x43 */ LdQW,
  /* 0x44 */ LdQW,
  /* 0x45 */ LdQW,
  /* 0x46 */ LdQHli,
  /* 0x47 */ LdQW,
  /* 0x48 */ LdQW,
  /* 0x49 */ null,
  /* 0x4a */ LdQW,
  /* 0x4b */ LdQW,
  /* 0x4c */ LdQW,
  /* 0x4d */ LdQW,
  /* 0x4e */ LdQHli,
  /* 0x4f */ LdQW,
  /* 0x50 */ LdQW,
  /* 0x51 */ LdQW,
  /* 0x52 */ null,
  /* 0x53 */ LdQW,
  /* 0x54 */ LdQW,
  /* 0x55 */ LdQW,
  /* 0x56 */ LdQHli,
  /* 0x57 */ LdQW,
  /* 0x58 */ LdQW,
  /* 0x59 */ LdQW,
  /* 0x5a */ LdQW,
  /* 0x5b */ null,
  /* 0x5c */ LdQW,
  /* 0x5d */ LdQW,
  /* 0x5e */ LdQHli,
  /* 0x5f */ LdQW,
  /* 0x60 */ LdQW,
  /* 0x61 */ LdQW,
  /* 0x62 */ LdQW,
  /* 0x63 */ LdQW,
  /* 0x64 */ null,
  /* 0x65 */ LdQW,
  /* 0x66 */ LdQHli,
  /* 0x67 */ LdQW,
  /* 0x68 */ LdQW,
  /* 0x69 */ LdQW,
  /* 0x6a */ LdQW,
  /* 0x6b */ LdQW,
  /* 0x6c */ LdQW,
  /* 0x6d */ null,
  /* 0x6e */ LdQHli,
  /* 0x6f */ LdQW,
  /* 0x70 */ LdHliQ,
  /* 0x71 */ LdHliQ,
  /* 0x72 */ LdHliQ,
  /* 0x73 */ LdHliQ,
  /* 0x74 */ LdHliQ,
  /* 0x75 */ LdHliQ,
  /* 0x76 */ Halt,
  /* 0x77 */ LdHliQ,
  /* 0x78 */ LdQW,
  /* 0x79 */ LdQW,
  /* 0x7a */ LdQW,
  /* 0x7b */ LdQW,
  /* 0x7c */ LdQW,
  /* 0x7d */ LdQW,
  /* 0x7e */ LdQHli,
  /* 0x7f */ null,
  /* 0x80 */ AddAQ,
  /* 0x81 */ AddAQ,
  /* 0x82 */ AddAQ,
  /* 0x83 */ AddAQ,
  /* 0x84 */ AddAQ,
  /* 0x85 */ AddAQ,
  /* 0x86 */ AddAHli,
  /* 0x87 */ AddAQ,
  /* 0x88 */ AdcAQ,
  /* 0x89 */ AdcAQ,
  /* 0x8a */ AdcAQ,
  /* 0x8b */ AdcAQ,
  /* 0x8c */ AdcAQ,
  /* 0x8d */ AdcAQ,
  /* 0x8e */ AdcAHli,
  /* 0x8f */ AdcAQ,
  /* 0x90 */ SubAQ,
  /* 0x91 */ SubAQ,
  /* 0x92 */ SubAQ,
  /* 0x93 */ SubAQ,
  /* 0x94 */ SubAQ,
  /* 0x95 */ SubAQ,
  /* 0x96 */ SubAHli,
  /* 0x97 */ SubAQ,
  /* 0x98 */ SbcAQ,
  /* 0x99 */ SbcAQ,
  /* 0x9a */ SbcAQ,
  /* 0x9b */ SbcAQ,
  /* 0x9c */ SbcAQ,
  /* 0x9d */ SbcAQ,
  /* 0x9e */ SbcAHli,
  /* 0x9f */ SbcAQ,
  /* 0xa0 */ AndAQ,
  /* 0xa1 */ AndAQ,
  /* 0xa2 */ AndAQ,
  /* 0xa3 */ AndAQ,
  /* 0xa4 */ AndAQ,
  /* 0xa5 */ AndAQ,
  /* 0xa6 */ AndAHli,
  /* 0xa7 */ AndAQ,
  /* 0xa8 */ XorAQ,
  /* 0xa9 */ XorAQ,
  /* 0xaa */ XorAQ,
  /* 0xab */ XorAQ,
  /* 0xac */ XorAQ,
  /* 0xad */ XorAQ,
  /* 0xae */ XorAHli,
  /* 0xaf */ XorAQ,
  /* 0xb0 */ OrAQ,
  /* 0xb1 */ OrAQ,
  /* 0xb2 */ OrAQ,
  /* 0xb3 */ OrAQ,
  /* 0xb4 */ OrAQ,
  /* 0xb5 */ OrAQ,
  /* 0xb6 */ OrAHli,
  /* 0xb7 */ OrAQ,
  /* 0xb8 */ CpAQ,
  /* 0xb9 */ CpAQ,
  /* 0xba */ CpAQ,
  /* 0xbb */ CpAQ,
  /* 0xbc */ CpAQ,
  /* 0xbd */ CpAQ,
  /* 0xbe */ CpAHli,
  /* 0xbf */ CpAQ,
  /* 0xc0 */ RetNz,
  /* 0xc1 */ PopBc,
  /* 0xc2 */ JpNz,
  /* 0xc3 */ Jp,
  /* 0xc4 */ CallNz,
  /* 0xc5 */ PushBc,
  /* 0xc6 */ AluAN,
  /* 0xc7 */ RstN,
  /* 0xc8 */ RetZ,
  /* 0xc9 */ Ret,
  /* 0xca */ JpZ,
  /* 0xcb */ null, // CB prefix
  /* 0xcc */ CallZ,
  /* 0xcd */ Call,
  /* 0xce */ AluAN,
  /* 0xcf */ RstN,
  /* 0xd0 */ RetNc,
  /* 0xd1 */ PopDe,
  /* 0xd2 */ JpNc,
  /* 0xd3 */ OutNA,
  /* 0xd4 */ CallNc,
  /* 0xd5 */ PushDe,
  /* 0xd6 */ AluAN,
  /* 0xd7 */ RstN,
  /* 0xd8 */ RetC,
  /* 0xd9 */ Exx,
  /* 0xda */ JpC,
  /* 0xdb */ InAN,
  /* 0xdc */ CallC,
  /* 0xdd */ null, // DD prefix
  /* 0xde */ AluAN,
  /* 0xdf */ RstN,
  /* 0xe0 */ RetPo,
  /* 0xe1 */ PopHl,
  /* 0xe2 */ JpPo,
  /* 0xe3 */ ExSpiHl,
  /* 0xe4 */ CallPo,
  /* 0xe5 */ PushHl,
  /* 0xe6 */ AluAN,
  /* 0xe7 */ RstN,
  /* 0xe8 */ RetPe,
  /* 0xe9 */ JpHli,
  /* 0xea */ JpPe,
  /* 0xeb */ ExDeHl,
  /* 0xec */ CallPe,
  /* 0xed */ null, // ED prefix
  /* 0xee */ AluAN,
  /* 0xef */ RstN,
  /* 0xf0 */ RetP,
  /* 0xf1 */ PopAf,
  /* 0xf2 */ JpP,
  /* 0xf3 */ Di,
  /* 0xf4 */ CallP,
  /* 0xf5 */ PushAf,
  /* 0xf6 */ AluAN,
  /* 0xf7 */ RstN,
  /* 0xf8 */ RetM,
  /* 0xf9 */ LdSpHl,
  /* 0xfa */ JpM,
  /* 0xfb */ Ei,
  /* 0xfc */ CallM,
  /* 0xfd */ null, // FD prefix
  /* 0xfe */ AluAN,
  /* 0xff */ RstN,
];

/**
 * Extended operations with 0xED prefix
 */
const extendedOperations: (CpuOp | null)[] = [
  /* 0x00 */ null,
  /* 0x01 */ null,
  /* 0x02 */ null,
  /* 0x03 */ null,
  /* 0x04 */ null,
  /* 0x05 */ null,
  /* 0x06 */ null,
  /* 0x07 */ null,
  /* 0x08 */ null,
  /* 0x09 */ null,
  /* 0x0a */ null,
  /* 0x0b */ null,
  /* 0x0c */ null,
  /* 0x0d */ null,
  /* 0x0e */ null,
  /* 0x0f */ null,
  /* 0x10 */ null,
  /* 0x11 */ null,
  /* 0x12 */ null,
  /* 0x13 */ null,
  /* 0x14 */ null,
  /* 0x15 */ null,
  /* 0x16 */ null,
  /* 0x17 */ null,
  /* 0x18 */ null,
  /* 0x19 */ null,
  /* 0x1a */ null,
  /* 0x1b */ null,
  /* 0x1c */ null,
  /* 0x1d */ null,
  /* 0x1e */ null,
  /* 0x1f */ null,
  /* 0x20 */ null,
  /* 0x21 */ null,
  /* 0x22 */ null,
  /* 0x23 */ Swapnib,
  /* 0x24 */ Mirror,
  /* 0x25 */ null,
  /* 0x26 */ null,
  /* 0x27 */ TestN,
  /* 0x28 */ BslaDeB,
  /* 0x29 */ BsraDeB,
  /* 0x2a */ BsrlDeB,
  /* 0x2b */ BsrfDeB,
  /* 0x2c */ BrlcDeB,
  /* 0x2d */ null,
  /* 0x2e */ null,
  /* 0x2f */ null,
  /* 0x30 */ Mul,
  /* 0x31 */ AddHlA,
  /* 0x32 */ AddDeA,
  /* 0x33 */ AddBcA,
  /* 0x34 */ AddHlNN,
  /* 0x35 */ AddDeNN,
  /* 0x36 */ AddBcNN,
  /* 0x37 */ null,
  /* 0x38 */ null,
  /* 0x39 */ null,
  /* 0x3a */ null,
  /* 0x3b */ null,
  /* 0x3c */ null,
  /* 0x3d */ null,
  /* 0x3e */ null,
  /* 0x3f */ null,
  /* 0x40 */ InQCi,
  /* 0x41 */ OutCiQ,
  /* 0x42 */ SbcHlQQ,
  /* 0x43 */ LdNNiQQ,
  /* 0x44 */ Neg,
  /* 0x45 */ Retn,
  /* 0x46 */ ImN,
  /* 0x47 */ LdXrA,
  /* 0x48 */ InQCi,
  /* 0x49 */ OutCiQ,
  /* 0x4a */ AdcHlQQ,
  /* 0x4b */ LdQQNNi,
  /* 0x4c */ Neg,
  /* 0x4d */ Retn,
  /* 0x4e */ ImN,
  /* 0x4f */ LdXrA,
  /* 0x50 */ InQCi,
  /* 0x51 */ OutCiQ,
  /* 0x52 */ SbcHlQQ,
  /* 0x53 */ LdNNiQQ,
  /* 0x54 */ Neg,
  /* 0x55 */ Retn,
  /* 0x56 */ ImN,
  /* 0x57 */ LdAXr,
  /* 0x58 */ InQCi,
  /* 0x59 */ OutCiQ,
  /* 0x5a */ AdcHlQQ,
  /* 0x5b */ LdQQNNi,
  /* 0x5c */ Neg,
  /* 0x5d */ Retn,
  /* 0x5e */ ImN,
  /* 0x5f */ LdAXr,
  /* 0x60 */ InQCi,
  /* 0x61 */ OutCiQ,
  /* 0x62 */ SbcHlQQ,
  /* 0x63 */ LdNNiQQ,
  /* 0x64 */ Neg,
  /* 0x65 */ Retn,
  /* 0x66 */ ImN,
  /* 0x67 */ Rrd,
  /* 0x68 */ InQCi,
  /* 0x69 */ OutCiQ,
  /* 0x6a */ AdcHlQQ,
  /* 0x6b */ LdQQNNi,
  /* 0x6c */ Neg,
  /* 0x6d */ Retn,
  /* 0x6e */ ImN,
  /* 0x6f */ Rld,
  /* 0x70 */ InQCi,
  /* 0x71 */ OutCiQ,
  /* 0x72 */ SbcHlQQ,
  /* 0x73 */ LdNNiQQ,
  /* 0x74 */ Neg,
  /* 0x75 */ Retn,
  /* 0x76 */ ImN,
  /* 0x77 */ null,
  /* 0x78 */ InQCi,
  /* 0x79 */ OutCiQ,
  /* 0x7a */ AdcHlQQ,
  /* 0x7b */ LdQQNNi,
  /* 0x7c */ Neg,
  /* 0x7d */ Retn,
  /* 0x7e */ ImN,
  /* 0x7f */ null,
  /* 0x80 */ null,
  /* 0x81 */ null,
  /* 0x82 */ null,
  /* 0x83 */ null,
  /* 0x84 */ null,
  /* 0x85 */ null,
  /* 0x86 */ null,
  /* 0x87 */ null,
  /* 0x88 */ null,
  /* 0x89 */ null,
  /* 0x8a */ PushNN,
  /* 0x8b */ null,
  /* 0x8c */ null,
  /* 0x8d */ null,
  /* 0x8e */ null,
  /* 0x8f */ null,
  /* 0x90 */ OutInB,
  /* 0x91 */ NextReg,
  /* 0x92 */ NextRegA,
  /* 0x93 */ PixelDn,
  /* 0x94 */ PixelAd,
  /* 0x95 */ SetAE,
  /* 0x96 */ null,
  /* 0x97 */ null,
  /* 0x98 */ JpInC,
  /* 0x99 */ null,
  /* 0x9a */ null,
  /* 0x9b */ null,
  /* 0x9c */ null,
  /* 0x9d */ null,
  /* 0x9e */ null,
  /* 0x9f */ null,
  /* 0xa0 */ Ldi,
  /* 0xa1 */ Cpi,
  /* 0xa2 */ Ini,
  /* 0xa3 */ Outi,
  /* 0xa4 */ Ldix,
  /* 0xa5 */ Ldws,
  /* 0xa6 */ null,
  /* 0xa7 */ null,
  /* 0xa8 */ Ldd,
  /* 0xa9 */ Cpd,
  /* 0xaa */ Ind,
  /* 0xab */ Outd,
  /* 0xac */ Lddx,
  /* 0xad */ null,
  /* 0xae */ null,
  /* 0xaf */ null,
  /* 0xb0 */ Ldir,
  /* 0xb1 */ Cpir,
  /* 0xb2 */ Inir,
  /* 0xb3 */ Otir,
  /* 0xb4 */ Ldirx,
  /* 0xb5 */ null,
  /* 0xb6 */ null,
  /* 0xb7 */ Ldpirx,
  /* 0xb8 */ Lddr,
  /* 0xb9 */ Cpdr,
  /* 0xba */ Indr,
  /* 0xbb */ Otdr,
  /* 0xbc */ Lddrx,
  /* 0xbd */ null,
  /* 0xbe */ null,
  /* 0xbf */ null,
  /* 0xc0 */ null,
  /* 0xc1 */ null,
  /* 0xc2 */ null,
  /* 0xc3 */ null,
  /* 0xc4 */ null,
  /* 0xc5 */ null,
  /* 0xc6 */ null,
  /* 0xc7 */ null,
  /* 0xc8 */ null,
  /* 0xc9 */ null,
  /* 0xca */ null,
  /* 0xcb */ null,
  /* 0xcc */ null,
  /* 0xcd */ null,
  /* 0xce */ null,
  /* 0xcf */ null,
  /* 0xd0 */ null,
  /* 0xd1 */ null,
  /* 0xd2 */ null,
  /* 0xd3 */ null,
  /* 0xd4 */ null,
  /* 0xd5 */ null,
  /* 0xd6 */ null,
  /* 0xd7 */ null,
  /* 0xd8 */ null,
  /* 0xd9 */ null,
  /* 0xda */ null,
  /* 0xdb */ null,
  /* 0xdc */ null,
  /* 0xdd */ null,
  /* 0xde */ null,
  /* 0xdf */ null,
  /* 0xe0 */ null,
  /* 0xe1 */ null,
  /* 0xe2 */ null,
  /* 0xe3 */ null,
  /* 0xe4 */ null,
  /* 0xe5 */ null,
  /* 0xe6 */ null,
  /* 0xe7 */ null,
  /* 0xe8 */ null,
  /* 0xe9 */ null,
  /* 0xea */ null,
  /* 0xeb */ null,
  /* 0xec */ null,
  /* 0xed */ null,
  /* 0xee */ null,
  /* 0xef */ null,
  /* 0xf0 */ null,
  /* 0xf1 */ null,
  /* 0xf2 */ null,
  /* 0xf3 */ null,
  /* 0xf4 */ null,
  /* 0xf5 */ null,
  /* 0xf6 */ null,
  /* 0xf7 */ null,
  /* 0xf8 */ null,
  /* 0xf9 */ null,
  /* 0xfa */ null,
  /* 0xfb */ null,
  /* 0xfc */ null,
  /* 0xfd */ null,
  /* 0xfe */ null,
  /* 0xff */ null,
];

/**
 * Bit operations with 0xCB prefix
 */
const bitOperations: (CpuOp | null)[] = [
  /* 0x00 */ RlcQ,
  /* 0x01 */ RlcQ,
  /* 0x02 */ RlcQ,
  /* 0x03 */ RlcQ,
  /* 0x04 */ RlcQ,
  /* 0x05 */ RlcQ,
  /* 0x06 */ RlcHli,
  /* 0x07 */ RlcQ,
  /* 0x08 */ RrcQ,
  /* 0x09 */ RrcQ,
  /* 0x0a */ RrcQ,
  /* 0x0b */ RrcQ,
  /* 0x0c */ RrcQ,
  /* 0x0d */ RrcQ,
  /* 0x0e */ RrcHli,
  /* 0x0f */ RrcQ,
  /* 0x10 */ RlQ,
  /* 0x11 */ RlQ,
  /* 0x12 */ RlQ,
  /* 0x13 */ RlQ,
  /* 0x14 */ RlQ,
  /* 0x15 */ RlQ,
  /* 0x16 */ RlHli,
  /* 0x17 */ RlQ,
  /* 0x18 */ RrQ,
  /* 0x19 */ RrQ,
  /* 0x1a */ RrQ,
  /* 0x1b */ RrQ,
  /* 0x1c */ RrQ,
  /* 0x1d */ RrQ,
  /* 0x1e */ RrHli,
  /* 0x1f */ RrQ,
  /* 0x20 */ SlaQ,
  /* 0x21 */ SlaQ,
  /* 0x22 */ SlaQ,
  /* 0x23 */ SlaQ,
  /* 0x24 */ SlaQ,
  /* 0x25 */ SlaQ,
  /* 0x26 */ SlaHli,
  /* 0x27 */ SlaQ,
  /* 0x28 */ SraQ,
  /* 0x29 */ SraQ,
  /* 0x2a */ SraQ,
  /* 0x2b */ SraQ,
  /* 0x2c */ SraQ,
  /* 0x2d */ SraQ,
  /* 0x2e */ SraHli,
  /* 0x2f */ SraQ,
  /* 0x30 */ SllQ,
  /* 0x31 */ SllQ,
  /* 0x32 */ SllQ,
  /* 0x33 */ SllQ,
  /* 0x34 */ SllQ,
  /* 0x35 */ SllQ,
  /* 0x36 */ SllHli,
  /* 0x37 */ SllQ,
  /* 0x38 */ SrlQ,
  /* 0x39 */ SrlQ,
  /* 0x3a */ SrlQ,
  /* 0x3b */ SrlQ,
  /* 0x3c */ SrlQ,
  /* 0x3d */ SrlQ,
  /* 0x3e */ SrlHli,
  /* 0x3f */ SrlQ,
  /* 0x40 */ BitNQ,
  /* 0x41 */ BitNQ,
  /* 0x42 */ BitNQ,
  /* 0x43 */ BitNQ,
  /* 0x44 */ BitNQ,
  /* 0x45 */ BitNQ,
  /* 0x46 */ BitNHli,
  /* 0x47 */ BitNQ,
  /* 0x48 */ BitNQ,
  /* 0x49 */ BitNQ,
  /* 0x4a */ BitNQ,
  /* 0x4b */ BitNQ,
  /* 0x4c */ BitNQ,
  /* 0x4d */ BitNQ,
  /* 0x4e */ BitNHli,
  /* 0x4f */ BitNQ,
  /* 0x50 */ BitNQ,
  /* 0x51 */ BitNQ,
  /* 0x52 */ BitNQ,
  /* 0x53 */ BitNQ,
  /* 0x54 */ BitNQ,
  /* 0x55 */ BitNQ,
  /* 0x56 */ BitNHli,
  /* 0x57 */ BitNQ,
  /* 0x58 */ BitNQ,
  /* 0x59 */ BitNQ,
  /* 0x5a */ BitNQ,
  /* 0x5b */ BitNQ,
  /* 0x5c */ BitNQ,
  /* 0x5d */ BitNQ,
  /* 0x5e */ BitNHli,
  /* 0x5f */ BitNQ,
  /* 0x60 */ BitNQ,
  /* 0x61 */ BitNQ,
  /* 0x62 */ BitNQ,
  /* 0x63 */ BitNQ,
  /* 0x64 */ BitNQ,
  /* 0x65 */ BitNQ,
  /* 0x66 */ BitNHli,
  /* 0x67 */ BitNQ,
  /* 0x68 */ BitNQ,
  /* 0x69 */ BitNQ,
  /* 0x6a */ BitNQ,
  /* 0x6b */ BitNQ,
  /* 0x6c */ BitNQ,
  /* 0x6d */ BitNQ,
  /* 0x6e */ BitNHli,
  /* 0x6f */ BitNQ,
  /* 0x70 */ BitNQ,
  /* 0x71 */ BitNQ,
  /* 0x72 */ BitNQ,
  /* 0x73 */ BitNQ,
  /* 0x74 */ BitNQ,
  /* 0x75 */ BitNQ,
  /* 0x76 */ BitNHli,
  /* 0x77 */ BitNQ,
  /* 0x78 */ BitNQ,
  /* 0x79 */ BitNQ,
  /* 0x7a */ BitNQ,
  /* 0x7b */ BitNQ,
  /* 0x7c */ BitNQ,
  /* 0x7d */ BitNQ,
  /* 0x7e */ BitNHli,
  /* 0x7f */ BitNQ,
  /* 0x80 */ ResNQ,
  /* 0x81 */ ResNQ,
  /* 0x82 */ ResNQ,
  /* 0x83 */ ResNQ,
  /* 0x84 */ ResNQ,
  /* 0x85 */ ResNQ,
  /* 0x86 */ ResNHli,
  /* 0x87 */ ResNQ,
  /* 0x88 */ ResNQ,
  /* 0x89 */ ResNQ,
  /* 0x8a */ ResNQ,
  /* 0x8b */ ResNQ,
  /* 0x8c */ ResNQ,
  /* 0x8d */ ResNQ,
  /* 0x8e */ ResNHli,
  /* 0x8f */ ResNQ,
  /* 0x90 */ ResNQ,
  /* 0x91 */ ResNQ,
  /* 0x92 */ ResNQ,
  /* 0x93 */ ResNQ,
  /* 0x94 */ ResNQ,
  /* 0x95 */ ResNQ,
  /* 0x96 */ ResNHli,
  /* 0x97 */ ResNQ,
  /* 0x98 */ ResNQ,
  /* 0x99 */ ResNQ,
  /* 0x9a */ ResNQ,
  /* 0x9b */ ResNQ,
  /* 0x9c */ ResNQ,
  /* 0x9d */ ResNQ,
  /* 0x9e */ ResNHli,
  /* 0x9f */ ResNQ,
  /* 0xa0 */ ResNQ,
  /* 0xa1 */ ResNQ,
  /* 0xa2 */ ResNQ,
  /* 0xa3 */ ResNQ,
  /* 0xa4 */ ResNQ,
  /* 0xa5 */ ResNQ,
  /* 0xa6 */ ResNHli,
  /* 0xa7 */ ResNQ,
  /* 0xa8 */ ResNQ,
  /* 0xa9 */ ResNQ,
  /* 0xaa */ ResNQ,
  /* 0xab */ ResNQ,
  /* 0xac */ ResNQ,
  /* 0xad */ ResNQ,
  /* 0xae */ ResNHli,
  /* 0xaf */ ResNQ,
  /* 0xb0 */ ResNQ,
  /* 0xb1 */ ResNQ,
  /* 0xb2 */ ResNQ,
  /* 0xb3 */ ResNQ,
  /* 0xb4 */ ResNQ,
  /* 0xb5 */ ResNQ,
  /* 0xb6 */ ResNHli,
  /* 0xb7 */ ResNQ,
  /* 0xb8 */ ResNQ,
  /* 0xb9 */ ResNQ,
  /* 0xba */ ResNQ,
  /* 0xbb */ ResNQ,
  /* 0xbc */ ResNQ,
  /* 0xbd */ ResNQ,
  /* 0xbe */ ResNHli,
  /* 0xbf */ ResNQ,
  /* 0xc0 */ SetNQ,
  /* 0xc1 */ SetNQ,
  /* 0xc2 */ SetNQ,
  /* 0xc3 */ SetNQ,
  /* 0xc4 */ SetNQ,
  /* 0xc5 */ SetNQ,
  /* 0xc6 */ SetNHli,
  /* 0xc7 */ SetNQ,
  /* 0xc8 */ SetNQ,
  /* 0xc9 */ SetNQ,
  /* 0xca */ SetNQ,
  /* 0xcb */ SetNQ,
  /* 0xcc */ SetNQ,
  /* 0xcd */ SetNQ,
  /* 0xce */ SetNHli,
  /* 0xcf */ SetNQ,
  /* 0xd0 */ SetNQ,
  /* 0xd1 */ SetNQ,
  /* 0xd2 */ SetNQ,
  /* 0xd3 */ SetNQ,
  /* 0xd4 */ SetNQ,
  /* 0xd5 */ SetNQ,
  /* 0xd6 */ SetNHli,
  /* 0xd7 */ SetNQ,
  /* 0xd8 */ SetNQ,
  /* 0xd9 */ SetNQ,
  /* 0xda */ SetNQ,
  /* 0xdb */ SetNQ,
  /* 0xdc */ SetNQ,
  /* 0xdd */ SetNQ,
  /* 0xde */ SetNHli,
  /* 0xdf */ SetNQ,
  /* 0xe0 */ SetNQ,
  /* 0xe1 */ SetNQ,
  /* 0xe2 */ SetNQ,
  /* 0xe3 */ SetNQ,
  /* 0xe4 */ SetNQ,
  /* 0xe5 */ SetNQ,
  /* 0xe6 */ SetNHli,
  /* 0xe7 */ SetNQ,
  /* 0xe8 */ SetNQ,
  /* 0xe9 */ SetNQ,
  /* 0xea */ SetNQ,
  /* 0xeb */ SetNQ,
  /* 0xec */ SetNQ,
  /* 0xed */ SetNQ,
  /* 0xee */ SetNHli,
  /* 0xef */ SetNQ,
  /* 0xf0 */ SetNQ,
  /* 0xf1 */ SetNQ,
  /* 0xf2 */ SetNQ,
  /* 0xf3 */ SetNQ,
  /* 0xf4 */ SetNQ,
  /* 0xf5 */ SetNQ,
  /* 0xf6 */ SetNHli,
  /* 0xf7 */ SetNQ,
  /* 0xf8 */ SetNQ,
  /* 0xf9 */ SetNQ,
  /* 0xfa */ SetNQ,
  /* 0xfb */ SetNQ,
  /* 0xfc */ SetNQ,
  /* 0xfd */ SetNQ,
  /* 0xfe */ SetNHli,
  /* 0xff */ SetNQ,
];

/**
 * Indexed operations with 0xDD/0xFD prefix
 */
const indexedOperations: (CpuOp | null)[] = [
  /* 0x00 */ null,
  /* 0x01 */ LdQQNN,
  /* 0x02 */ LdBCiA,
  /* 0x03 */ IncQQ,
  /* 0x04 */ IncQ,
  /* 0x05 */ DecQ,
  /* 0x06 */ LdQN,
  /* 0x07 */ Rlca,
  /* 0x08 */ ExAf,
  /* 0x09 */ AddIxQQ,
  /* 0x0a */ LdABci,
  /* 0x0b */ DecQQ,
  /* 0x0c */ IncQ,
  /* 0x0d */ DecQ,
  /* 0x0e */ LdQN,
  /* 0x0f */ Rrca,
  /* 0x10 */ Djnz,
  /* 0x11 */ LdQQNN,
  /* 0x12 */ LdDEiA,
  /* 0x13 */ IncQQ,
  /* 0x14 */ IncQ,
  /* 0x15 */ DecQ,
  /* 0x16 */ LdQN,
  /* 0x17 */ Rla,
  /* 0x18 */ JrE,
  /* 0x19 */ AddIxQQ,
  /* 0x1a */ LdADei,
  /* 0x1b */ DecQQ,
  /* 0x1c */ IncQ,
  /* 0x1d */ DecQ,
  /* 0x1e */ LdQN,
  /* 0x1f */ Rra,
  /* 0x20 */ JrNz,
  /* 0x21 */ LdIxNN,
  /* 0x22 */ LdNNiIx,
  /* 0x23 */ IncIx,
  /* 0x24 */ IncXh,
  /* 0x25 */ DecXh,
  /* 0x26 */ LdXhN,
  /* 0x27 */ Daa,
  /* 0x28 */ JrZ,
  /* 0x29 */ AddIxQQ,
  /* 0x2a */ LdIxNNi,
  /* 0x2b */ DecIx,
  /* 0x2c */ IncXl,
  /* 0x2d */ DecXl,
  /* 0x2e */ LdXlN,
  /* 0x2f */ Cpl,
  /* 0x30 */ JrNc,
  /* 0x31 */ LdQQNN,
  /* 0x32 */ LdNNiA,
  /* 0x33 */ IncQQ,
  /* 0x34 */ IncIxi,
  /* 0x35 */ DecIxi,
  /* 0x36 */ LdIxiN,
  /* 0x37 */ Scf,
  /* 0x38 */ JrC,
  /* 0x39 */ AddIxQQ,
  /* 0x3a */ LdANNi,
  /* 0x3b */ DecQQ,
  /* 0x3c */ IncQ,
  /* 0x3d */ DecQ,
  /* 0x3e */ LdQN,
  /* 0x3f */ Ccf,
  /* 0x40 */ null,
  /* 0x41 */ LdQW,
  /* 0x42 */ LdQW,
  /* 0x43 */ LdQW,
  /* 0x44 */ LdQXh,
  /* 0x45 */ LdQXl,
  /* 0x46 */ LdQIxi,
  /* 0x47 */ LdQW,
  /* 0x48 */ LdQW,
  /* 0x49 */ null,
  /* 0x4a */ LdQW,
  /* 0x4b */ LdQW,
  /* 0x4c */ LdQXh,
  /* 0x4d */ LdQXl,
  /* 0x4e */ LdQIxi,
  /* 0x4f */ LdQW,
  /* 0x50 */ LdQW,
  /* 0x51 */ LdQW,
  /* 0x52 */ null,
  /* 0x53 */ LdQW,
  /* 0x54 */ LdQXh,
  /* 0x55 */ LdQXl,
  /* 0x56 */ LdQIxi,
  /* 0x57 */ LdQW,
  /* 0x58 */ LdQW,
  /* 0x59 */ LdQW,
  /* 0x5a */ LdQW,
  /* 0x5b */ null,
  /* 0x5c */ LdQXh,
  /* 0x5d */ LdQXl,
  /* 0x5e */ LdQIxi,
  /* 0x5f */ LdQW,
  /* 0x60 */ LdQW,
  /* 0x61 */ LdQW,
  /* 0x62 */ LdQW,
  /* 0x63 */ LdQW,
  /* 0x64 */ null,
  /* 0x65 */ LdQW,
  /* 0x66 */ LdQIxi,
  /* 0x67 */ LdQW,
  /* 0x68 */ LdQW,
  /* 0x69 */ LdQW,
  /* 0x6a */ LdQW,
  /* 0x6b */ LdQW,
  /* 0x6c */ LdQXh,
  /* 0x6d */ null,
  /* 0x6e */ LdQIxi,
  /* 0x6f */ LdQW,
  /* 0x70 */ LdIxiQ,
  /* 0x71 */ LdIxiQ,
  /* 0x72 */ LdIxiQ,
  /* 0x73 */ LdIxiQ,
  /* 0x74 */ LdIxiQ,
  /* 0x75 */ LdIxiQ,
  /* 0x76 */ Halt,
  /* 0x77 */ LdIxiQ,
  /* 0x78 */ LdQW,
  /* 0x79 */ LdQW,
  /* 0x7a */ LdQW,
  /* 0x7b */ LdQW,
  /* 0x7c */ LdQXh,
  /* 0x7d */ LdQXl,
  /* 0x7e */ LdQIxi,
  /* 0x7f */ null,
  /* 0x80 */ AddAQ,
  /* 0x81 */ AddAQ,
  /* 0x82 */ AddAQ,
  /* 0x83 */ AddAQ,
  /* 0x84 */ AluAXh,
  /* 0x85 */ AluAXl,
  /* 0x86 */ AluAIxi,
  /* 0x87 */ AddAQ,
  /* 0x88 */ AdcAQ,
  /* 0x89 */ AdcAQ,
  /* 0x8a */ AdcAQ,
  /* 0x8b */ AdcAQ,
  /* 0x8c */ AluAXh,
  /* 0x8d */ AluAXl,
  /* 0x8e */ AluAIxi,
  /* 0x8f */ AdcAQ,
  /* 0x90 */ SubAQ,
  /* 0x91 */ SubAQ,
  /* 0x92 */ SubAQ,
  /* 0x93 */ SubAQ,
  /* 0x94 */ AluAXh,
  /* 0x95 */ AluAXl,
  /* 0x96 */ AluAIxi,
  /* 0x97 */ SubAQ,
  /* 0x98 */ SbcAQ,
  /* 0x99 */ SbcAQ,
  /* 0x9a */ SbcAQ,
  /* 0x9b */ SbcAQ,
  /* 0x9c */ AluAXh,
  /* 0x9d */ AluAXl,
  /* 0x9e */ AluAIxi,
  /* 0x9f */ SbcAQ,
  /* 0xa0 */ AndAQ,
  /* 0xa1 */ AndAQ,
  /* 0xa2 */ AndAQ,
  /* 0xa3 */ AndAQ,
  /* 0xa4 */ AluAXh,
  /* 0xa5 */ AluAXl,
  /* 0xa6 */ AluAIxi,
  /* 0xa7 */ AndAQ,
  /* 0xa8 */ XorAQ,
  /* 0xa9 */ XorAQ,
  /* 0xaa */ XorAQ,
  /* 0xab */ XorAQ,
  /* 0xac */ AluAXh,
  /* 0xad */ AluAXl,
  /* 0xae */ AluAIxi,
  /* 0xaf */ XorAQ,
  /* 0xb0 */ OrAQ,
  /* 0xb1 */ OrAQ,
  /* 0xb2 */ OrAQ,
  /* 0xb3 */ OrAQ,
  /* 0xb4 */ AluAXh,
  /* 0xb5 */ AluAXl,
  /* 0xb6 */ AluAIxi,
  /* 0xb7 */ OrAQ,
  /* 0xb8 */ CpAQ,
  /* 0xb9 */ CpAQ,
  /* 0xba */ CpAQ,
  /* 0xbb */ CpAQ,
  /* 0xbc */ AluAXh,
  /* 0xbd */ AluAXl,
  /* 0xbe */ AluAIxi,
  /* 0xbf */ CpAQ,
  /* 0xc0 */ RetNz,
  /* 0xc1 */ PopBc,
  /* 0xc2 */ JpNz,
  /* 0xc3 */ Jp,
  /* 0xc4 */ CallNz,
  /* 0xc5 */ PushBc,
  /* 0xc6 */ AluAN,
  /* 0xc7 */ RstN,
  /* 0xc8 */ RetZ,
  /* 0xc9 */ Ret,
  /* 0xca */ JpZ,
  /* 0xcb */ null, // CB prefix
  /* 0xcc */ CallZ,
  /* 0xcd */ Call,
  /* 0xce */ AluAN,
  /* 0xcf */ RstN,
  /* 0xd0 */ RetNc,
  /* 0xd1 */ PopDe,
  /* 0xd2 */ JpNc,
  /* 0xd3 */ OutNA,
  /* 0xd4 */ CallNc,
  /* 0xd5 */ PushDe,
  /* 0xd6 */ AluAN,
  /* 0xd7 */ RstN,
  /* 0xd8 */ RetC,
  /* 0xd9 */ Exx,
  /* 0xda */ JpC,
  /* 0xdb */ InAN,
  /* 0xdc */ CallC,
  /* 0xdd */ null, // DD prefix
  /* 0xde */ AluAN,
  /* 0xdf */ RstN,
  /* 0xe0 */ RetPo,
  /* 0xe1 */ PopIx,
  /* 0xe2 */ JpPo,
  /* 0xe3 */ ExSpiIx,
  /* 0xe4 */ CallPo,
  /* 0xe5 */ PushIx,
  /* 0xe6 */ AluAN,
  /* 0xe7 */ RstN,
  /* 0xe8 */ RetPe,
  /* 0xe9 */ JpIxi,
  /* 0xea */ JpPe,
  /* 0xeb */ ExDeHl,
  /* 0xec */ CallPe,
  /* 0xed */ null, // ED prefix
  /* 0xee */ AluAN,
  /* 0xef */ RstN,
  /* 0xf0 */ RetP,
  /* 0xf1 */ PopAf,
  /* 0xf2 */ JpP,
  /* 0xf3 */ Di,
  /* 0xf4 */ CallP,
  /* 0xf5 */ PushAf,
  /* 0xf6 */ AluAN,
  /* 0xf7 */ RstN,
  /* 0xf8 */ RetM,
  /* 0xf9 */ LdSpIx,
  /* 0xfa */ JpM,
  /* 0xfb */ Ei,
  /* 0xfc */ CallM,
  /* 0xfd */ null, // FD prefix
  /* 0xfe */ AluAN,
  /* 0xff */ RstN,
];

/**
 * Indexed bit operations with 0xCDB, 0xDD/0xFD prefix
 */
const indexedBitOperations: (IndexedCpuOp | null)[] = [
  /* 0x00 */ XrlcQ,
  /* 0x01 */ XrlcQ,
  /* 0x02 */ XrlcQ,
  /* 0x03 */ XrlcQ,
  /* 0x04 */ XrlcQ,
  /* 0x05 */ XrlcQ,
  /* 0x06 */ XrlcQ,
  /* 0x07 */ XrlcQ,
  /* 0x08 */ XrrcQ,
  /* 0x09 */ XrrcQ,
  /* 0x0a */ XrrcQ,
  /* 0x0b */ XrrcQ,
  /* 0x0c */ XrrcQ,
  /* 0x0d */ XrrcQ,
  /* 0x0e */ XrrcQ,
  /* 0x0f */ XrrcQ,
  /* 0x10 */ XrlQ,
  /* 0x11 */ XrlQ,
  /* 0x12 */ XrlQ,
  /* 0x13 */ XrlQ,
  /* 0x14 */ XrlQ,
  /* 0x15 */ XrlQ,
  /* 0x16 */ XrlQ,
  /* 0x17 */ XrlQ,
  /* 0x18 */ XrrQ,
  /* 0x19 */ XrrQ,
  /* 0x1a */ XrrQ,
  /* 0x1b */ XrrQ,
  /* 0x1c */ XrrQ,
  /* 0x1d */ XrrQ,
  /* 0x1e */ XrrQ,
  /* 0x1f */ XrrQ,
  /* 0x20 */ XSlaQ,
  /* 0x21 */ XSlaQ,
  /* 0x22 */ XSlaQ,
  /* 0x23 */ XSlaQ,
  /* 0x24 */ XSlaQ,
  /* 0x25 */ XSlaQ,
  /* 0x26 */ XSlaQ,
  /* 0x27 */ XSlaQ,
  /* 0x28 */ XSraQ,
  /* 0x29 */ XSraQ,
  /* 0x2a */ XSraQ,
  /* 0x2b */ XSraQ,
  /* 0x2c */ XSraQ,
  /* 0x2d */ XSraQ,
  /* 0x2e */ XSraQ,
  /* 0x2f */ XSraQ,
  /* 0x30 */ XSllQ,
  /* 0x31 */ XSllQ,
  /* 0x32 */ XSllQ,
  /* 0x33 */ XSllQ,
  /* 0x34 */ XSllQ,
  /* 0x35 */ XSllQ,
  /* 0x36 */ XSllQ,
  /* 0x37 */ XSllQ,
  /* 0x38 */ XSrlQ,
  /* 0x39 */ XSrlQ,
  /* 0x3a */ XSrlQ,
  /* 0x3b */ XSrlQ,
  /* 0x3c */ XSrlQ,
  /* 0x3d */ XSrlQ,
  /* 0x3e */ XSrlQ,
  /* 0x3f */ XSrlQ,
  /* 0x40 */ XBitN,
  /* 0x41 */ XBitN,
  /* 0x42 */ XBitN,
  /* 0x43 */ XBitN,
  /* 0x44 */ XBitN,
  /* 0x45 */ XBitN,
  /* 0x46 */ XBitN,
  /* 0x47 */ XBitN,
  /* 0x48 */ XBitN,
  /* 0x49 */ XBitN,
  /* 0x4a */ XBitN,
  /* 0x4b */ XBitN,
  /* 0x4c */ XBitN,
  /* 0x4d */ XBitN,
  /* 0x4e */ XBitN,
  /* 0x4f */ XBitN,
  /* 0x50 */ XBitN,
  /* 0x51 */ XBitN,
  /* 0x52 */ XBitN,
  /* 0x53 */ XBitN,
  /* 0x54 */ XBitN,
  /* 0x55 */ XBitN,
  /* 0x56 */ XBitN,
  /* 0x57 */ XBitN,
  /* 0x58 */ XBitN,
  /* 0x59 */ XBitN,
  /* 0x5a */ XBitN,
  /* 0x5b */ XBitN,
  /* 0x5c */ XBitN,
  /* 0x5d */ XBitN,
  /* 0x5e */ XBitN,
  /* 0x5f */ XBitN,
  /* 0x60 */ XBitN,
  /* 0x61 */ XBitN,
  /* 0x62 */ XBitN,
  /* 0x63 */ XBitN,
  /* 0x64 */ XBitN,
  /* 0x65 */ XBitN,
  /* 0x66 */ XBitN,
  /* 0x67 */ XBitN,
  /* 0x68 */ XBitN,
  /* 0x69 */ XBitN,
  /* 0x6a */ XBitN,
  /* 0x6b */ XBitN,
  /* 0x6c */ XBitN,
  /* 0x6d */ XBitN,
  /* 0x6e */ XBitN,
  /* 0x6f */ XBitN,
  /* 0x70 */ XBitN,
  /* 0x71 */ XBitN,
  /* 0x72 */ XBitN,
  /* 0x73 */ XBitN,
  /* 0x74 */ XBitN,
  /* 0x75 */ XBitN,
  /* 0x76 */ XBitN,
  /* 0x77 */ XBitN,
  /* 0x78 */ XBitN,
  /* 0x79 */ XBitN,
  /* 0x7a */ XBitN,
  /* 0x7b */ XBitN,
  /* 0x7c */ XBitN,
  /* 0x7d */ XBitN,
  /* 0x7e */ XBitN,
  /* 0x7f */ XBitN,
  /* 0x80 */ XResNQ,
  /* 0x81 */ XResNQ,
  /* 0x82 */ XResNQ,
  /* 0x83 */ XResNQ,
  /* 0x84 */ XResNQ,
  /* 0x85 */ XResNQ,
  /* 0x86 */ XResNQ,
  /* 0x87 */ XResNQ,
  /* 0x88 */ XResNQ,
  /* 0x89 */ XResNQ,
  /* 0x8a */ XResNQ,
  /* 0x8b */ XResNQ,
  /* 0x8c */ XResNQ,
  /* 0x8d */ XResNQ,
  /* 0x8e */ XResNQ,
  /* 0x8f */ XResNQ,
  /* 0x90 */ XResNQ,
  /* 0x91 */ XResNQ,
  /* 0x92 */ XResNQ,
  /* 0x93 */ XResNQ,
  /* 0x94 */ XResNQ,
  /* 0x95 */ XResNQ,
  /* 0x96 */ XResNQ,
  /* 0x97 */ XResNQ,
  /* 0x98 */ XResNQ,
  /* 0x99 */ XResNQ,
  /* 0x9a */ XResNQ,
  /* 0x9b */ XResNQ,
  /* 0x9c */ XResNQ,
  /* 0x9d */ XResNQ,
  /* 0x9e */ XResNQ,
  /* 0x9f */ XResNQ,
  /* 0xa0 */ XResNQ,
  /* 0xa1 */ XResNQ,
  /* 0xa2 */ XResNQ,
  /* 0xa3 */ XResNQ,
  /* 0xa4 */ XResNQ,
  /* 0xa5 */ XResNQ,
  /* 0xa6 */ XResNQ,
  /* 0xa7 */ XResNQ,
  /* 0xa8 */ XResNQ,
  /* 0xa9 */ XResNQ,
  /* 0xaa */ XResNQ,
  /* 0xab */ XResNQ,
  /* 0xac */ XResNQ,
  /* 0xad */ XResNQ,
  /* 0xae */ XResNQ,
  /* 0xaf */ XResNQ,
  /* 0xb0 */ XResNQ,
  /* 0xb1 */ XResNQ,
  /* 0xb2 */ XResNQ,
  /* 0xb3 */ XResNQ,
  /* 0xb4 */ XResNQ,
  /* 0xb5 */ XResNQ,
  /* 0xb6 */ XResNQ,
  /* 0xb7 */ XResNQ,
  /* 0xb8 */ XResNQ,
  /* 0xb9 */ XResNQ,
  /* 0xba */ XResNQ,
  /* 0xbb */ XResNQ,
  /* 0xbc */ XResNQ,
  /* 0xbd */ XResNQ,
  /* 0xbe */ XResNQ,
  /* 0xbf */ XResNQ,
  /* 0xc0 */ XSetNQ,
  /* 0xc1 */ XSetNQ,
  /* 0xc2 */ XSetNQ,
  /* 0xc3 */ XSetNQ,
  /* 0xc4 */ XSetNQ,
  /* 0xc5 */ XSetNQ,
  /* 0xc6 */ XSetNQ,
  /* 0xc7 */ XSetNQ,
  /* 0xc8 */ XSetNQ,
  /* 0xc9 */ XSetNQ,
  /* 0xca */ XSetNQ,
  /* 0xcb */ XSetNQ,
  /* 0xcc */ XSetNQ,
  /* 0xcd */ XSetNQ,
  /* 0xce */ XSetNQ,
  /* 0xcf */ XSetNQ,
  /* 0xd0 */ XSetNQ,
  /* 0xd1 */ XSetNQ,
  /* 0xd2 */ XSetNQ,
  /* 0xd3 */ XSetNQ,
  /* 0xd4 */ XSetNQ,
  /* 0xd5 */ XSetNQ,
  /* 0xd6 */ XSetNQ,
  /* 0xd7 */ XSetNQ,
  /* 0xd8 */ XSetNQ,
  /* 0xd9 */ XSetNQ,
  /* 0xda */ XSetNQ,
  /* 0xdb */ XSetNQ,
  /* 0xdc */ XSetNQ,
  /* 0xdd */ XSetNQ,
  /* 0xde */ XSetNQ,
  /* 0xdf */ XSetNQ,
  /* 0xe0 */ XSetNQ,
  /* 0xe1 */ XSetNQ,
  /* 0xe2 */ XSetNQ,
  /* 0xe3 */ XSetNQ,
  /* 0xe4 */ XSetNQ,
  /* 0xe5 */ XSetNQ,
  /* 0xe6 */ XSetNQ,
  /* 0xe7 */ XSetNQ,
  /* 0xe8 */ XSetNQ,
  /* 0xe9 */ XSetNQ,
  /* 0xea */ XSetNQ,
  /* 0xeb */ XSetNQ,
  /* 0xec */ XSetNQ,
  /* 0xed */ XSetNQ,
  /* 0xee */ XSetNQ,
  /* 0xef */ XSetNQ,
  /* 0xf0 */ XSetNQ,
  /* 0xf1 */ XSetNQ,
  /* 0xf2 */ XSetNQ,
  /* 0xf3 */ XSetNQ,
  /* 0xf4 */ XSetNQ,
  /* 0xf5 */ XSetNQ,
  /* 0xf6 */ XSetNQ,
  /* 0xf7 */ XSetNQ,
  /* 0xf8 */ XSetNQ,
  /* 0xf9 */ XSetNQ,
  /* 0xfa */ XSetNQ,
  /* 0xfb */ XSetNQ,
  /* 0xfc */ XSetNQ,
  /* 0xfd */ XSetNQ,
  /* 0xfe */ XSetNQ,
  /* 0xff */ XSetNQ,
];

// ==========================================================================
// Standard operations

// ld QQ,NN
//
// The 16-bit integer value is loaded to the QQ register pair.
// QQ: BC, DE, HL, SP
// =================================
// | 0 | 0 | Q | Q | 0 | 0 | 0 | 1 | 0x01, 0x11, 0x21, 0x31
// =================================
// |             N Low             |
// =================================
// |             N High            |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
/// </remarks>
function LdQQNN(cpu: Z80Cpu): void {
  const qq = (cpu.opCode & 0x30) >> 4;

  // pc+1:3
  const low = cpu.readCodeMemory();
  cpu.pc++;
  cpu.incTact(3);

  // pc+2:3
  const high = cpu.readCodeMemory();
  cpu.pc++;
  cpu.setReg16(qq, ((<u16>high) << 8) | low);
  cpu.incTact(3);
}

// ld (bc),a
//
// The contents of the A are loaded to the memory location
// specified by the contents of the BC register pair.
// =================================
// | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0x02
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,bc:3
function LdBCiA(cpu: Z80Cpu): void {
  cpu.writeMemory(cpu.bc, cpu.a);
  cpu.incTact(3);
}

// inc QQ
//
// The contents of register pair QQ are incremented.
// =================================
// | 0 | 0 | Q | Q | 0 | 0 | 1 | 1 | 0x03, 0x13, 0x23, 0x33
// =================================
// T-States: 4, 2 (6)
// Contention breakdown: pc:6
function IncQQ(cpu: Z80Cpu): void {
  const qq = (cpu.opCode & 0x30) >> 4;
  const value = cpu.getReg16(qq);
  cpu.setReg16(qq, value + 1);
  cpu.incTact(2);
}

// inc Q
//
// Register Q is incremented.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 3; otherwise, it is reset.
// P/V is set if r was 7Fh before operation; otherwise, it is reset.
// N is reset.
// C is not affected.
// =================================
// | 0 | 0 | Q | Q | Q | 1 | 0 | 0 | 0x04, 0x0c, 0x14, 0x1c, 0x24, 0x2c, 0x3c
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function IncQ(cpu: Z80Cpu): void {
  const q = (cpu.opCode & 0x38) >> 3;
  const value = cpu.getReg8(q);
  cpu.setReg8(q, value + 1);
  cpu.f = incOpFlags[value] | (<u8>(cpu.f & FlagsSetMask.C));
}

// dec Q
//
// Register Q is decremented.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4, otherwise, it is reset.
// P/V is set if m was 80h before operation; otherwise, it is reset.
// N is set.
// C is not affected.
// =================================
// | 0 | 0 | Q | Q | Q | 1 | 0 | 1 | 0x05, 0x0d, 0x15, 0x1d, 0x25, 0x2d, 0x3d
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function DecQ(cpu: Z80Cpu): void {
  const q = (cpu.opCode & 0x38) >> 3;
  const value = cpu.getReg8(q);
  cpu.setReg8(q, value - 1);
  cpu.f = decOpFlags[value] | (<u8>(cpu.f & FlagsSetMask.C));
}

// ld Q,N
//
// The 8-bit integer N is loaded to Q.
// Q: B, C, D, E, H, L, A
// =================================
// | 0 | 0 | Q | Q | Q | 1 | 1 | 0 | 0x06, 0x0e, 0x16, 0x1e, 0x26, 0x2e, 0x3e
// =================================
// |            8-bit              |
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,pc+1:3
function LdQN(cpu: Z80Cpu): void {
  const q = (cpu.opCode & 0x38) >> 3;
  cpu.setReg8(q, cpu.readCodeMemory());
  cpu.pc++;
  cpu.incTact(3);
}

// rlca
//
// The contents of  A are rotated left 1 bit position. The
// sign bit (bit 7) is copied to the Carry flag and also
// to bit 0.
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of A.
// =================================
// | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0x07
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Rlca(cpu: Z80Cpu): void {
  let rlcaVal = <u16>cpu.a;
  rlcaVal <<= 1;
  let cf = ((rlcaVal & 0x100) !== 0 ? FlagsSetMask.C : 0) & 0xff;
  if (cf !== 0) {
    rlcaVal = rlcaVal | 0x01;
  }
  cpu.a = <u8>rlcaVal;
  cpu.f = <u8>(cf | (cpu.f & FlagsSetMask.SZPV));
}

// ex af,af'
//
// The 2-byte contents of the register pairs AF and AF' are exchanged.
// =================================
// | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0x08
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function ExAf(cpu: Z80Cpu): void {
  const tmp = cpu._af_;
  cpu._af_ = cpu.af;
  cpu.af = tmp;
}

// add hl,QQ
//
// The contents of QQ are added to the contents of HL and
// the result is stored in HL.
// QQ: BC, DE, HL, SP
// S, Z, P/V are not affected.
// H is set if carry from bit 11; otherwise, it is reset.
// N is reset.
// C is set if carry from bit 15; otherwise, it is reset.
// =================================
// | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0x09
// =================================
// T-States: 4, 4, 3 (11)
// Contention breakdown: pc:11
function AddHlQQ(cpu: Z80Cpu): void {
  const qq = (cpu.opCode & 0x30) >> 4;
  cpu.wz = cpu.hl + 1;
  cpu.hl = cpu.aluAddHL(cpu.hl, cpu.getReg16(qq));
  cpu.incTact(7);
}

// ld a,(bc)
//
// The contents of the memory location specified by BC are loaded to A.
// =================================
// | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0x0a
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,bc:3
function LdABci(cpu: Z80Cpu): void {
  cpu.wz = cpu.bc + 1;
  cpu.a = cpu.readMemory(cpu.bc);
  cpu.incTact(3);
}

// dec QQ
//
// The contents of register pair QQ are decremented.
// QQ: BC, DE, HL, SP
// =================================
// | 0 | 0 | Q | Q | 1 | 0 | 1 | 1 | 0x0b, 0x1b, 0x2b, 0x3b
// =================================
// T-States: 4, 2 (6)
// Contention breakdown: pc:6
function DecQQ(cpu: Z80Cpu): void {
  const qq = (cpu.opCode & 0x30) >> 4;
  const value = cpu.getReg16(qq);
  cpu.setReg16(qq, value - 1);
  cpu.incTact(2);
}

// rrca
//
// The contents of A are rotated right 1 bit position. Bit 0 is
// copied to the Carry flag and also to bit 7.
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 0 of A.
// =================================
// | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 0x0F
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Rrca(cpu: Z80Cpu): void {
  let rrcaVal = cpu.a;
  const cf = <u8>((rrcaVal & 0x01) !== 0 ? FlagsSetMask.C : 0);
  if (cf) {
    rrcaVal = (rrcaVal >> 1) | 0x80;
  } else {
    rrcaVal >>= 1;
  }
  cpu.a = rrcaVal;
  cpu.f = <u8>(cf | (cpu.f & FlagsSetMask.SZPV));
}

// djnz E
//
// This instruction is similar to the conditional jump
// instructions except that value of B is used to determine
// branching. B is decremented, and if a nonzero value remains,
// the value of displacement E is added to PC. The next
// instruction is fetched from the location designated by
// the new contents of the PC. The jump is measured from the
// address of the instruction op code and contains a range of
// –126 to +129 bytes. The assembler automatically adjusts for
// the twice incremented PC. If the result of decrementing leaves
// B with a zero value, the next instruction executed is taken
// from the location following this instruction.
// =================================
// | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0x10
// =================================
// |             E-2               |
// =================================
// T-States: B!=0: 5, 3, 5 (13)
// B=0:  5, 3 (8)
// Contention breakdown: pc:5,pc+1:3,[pc+1:1 x 5]
// Gate array contention breakdown: pc:5,pc+1:3,[5]
function Djnz(cpu: Z80Cpu): void {
  cpu.incTact(1);
  const e = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  if (--cpu.b === 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.wz = cpu.pc = cpu.pc + <i8>e;
}

// ld (de),a
//
// The contents of the A are loaded to the memory location
// specified by the contents of the DE register pair.
// =================================
// | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0x12
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,bc:3
function LdDEiA(cpu: Z80Cpu): void {
  cpu.writeMemory(cpu.de, cpu.a);
  cpu.incTact(3);
}

// rla
//
// The contents of A are rotated left 1 bit position through the
// Carry flag. The previous contents of the Carry flag are copied
// to bit 0.
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of A.
// =================================
// | 0 | 0 | 0 | 1 | 0 | 1 | 1 | 1 | 0x17
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Rla(cpu: Z80Cpu): void {
  let rlaVal = cpu.a;
  const newCF = (rlaVal & 0x80) !== 0 ? FlagsSetMask.C : 0;
  rlaVal <<= 1;
  if (cpu.cFlag) {
    rlaVal |= 0x01;
  }
  cpu.a = rlaVal;
  cpu.f = <u8>(newCF | (cpu.f & FlagsSetMask.SZPV));
}

// jr E
//
// This instruction provides for unconditional branching
// to other segments of a program. The value of displacement E is
// added to PC and the next instruction is fetched from the location
// designated by the new contents of the PC. This jump is measured
// from the address of the instruction op code and contains a range
// of –126 to +129 bytes. The assembler automatically adjusts for
// the twice incremented PC.
// =================================
// | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0x18
// =================================
// |             E-2               |
// =================================
// T-States: 4, 3, 5 (12)
// Contention breakdown: pc:4,pc+1:3
function JrE(cpu: Z80Cpu): void {
  const e = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz = cpu.pc = cpu.pc + <i8>e;
  cpu.incTact(5);
}

// ld a,(de)
//
// The contents of the memory location specified by DE are loaded to A.
// =================================
// | 0 | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 0x1a
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,bc:3
function LdADei(cpu: Z80Cpu): void {
  cpu.wz = cpu.de + 1;
  cpu.a = cpu.readMemory(cpu.de);
  cpu.incTact(3);
}

// rra
//
// The contents of A are rotated right 1 bit position through the
// Carry flag. The previous contents of the Carry flag are copied
// to bit 7.
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 0 of A.
// =================================
// | 0 | 0 | 0 | 1 | 0 | 1 | 1 | 1 | 0x1F
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Rra(cpu: Z80Cpu): void {
  let rlcaVal = cpu.a;
  const newCF = (rlcaVal & 0x01) !== 0 ? FlagsSetMask.C : 0;
  rlcaVal >>= 1;
  if (cpu.cFlag) {
    rlcaVal |= 0x80;
  }
  cpu.a = rlcaVal;
  cpu.f = <u8>(newCF | (cpu.f & FlagsSetMask.SZPV));
}

// jr nz,e
//
// This instruction provides for conditional branching to
// other segments of a program depending on the results of a test
// (Z flag is not set). If the test evaluates to *true*, the value of displacement
// E is added to PC and the next instruction is fetched from the
// location designated by the new contents of the PC. The jump is
// measured from the address of the instruction op code and contains
// a range of –126 to +129 bytes. The assembler automatically adjusts
// for the twice incremented PC.
// =================================
// | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0x20
// =================================
// |             E-2               |
// =================================
// T-States: Condition is met: 4, 3, 5 (12)
// Condition is not met: 4, 3 (7)
// Contention breakdown: pc:4,pc+1:3,[pc+1:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:3,[5]
function JrNz(cpu: Z80Cpu): void {
  const e = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) !== 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.wz = cpu.pc = cpu.pc + <i8>e;
}

// ld (NN),hl
//
// The contents of the low-order portion of HL (L) are loaded to memory
// address (NN), and the contents of the high-order portion of HL (H)
// are loaded to the next highest memory address(NN + 1).
// =================================
// | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0x22
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3, 3, 3 (16)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,nn:3,nn+1:3
function LdNNiHl(cpu: Z80Cpu): void {
  // pc+1:3
  const l = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;

  // pc+2:3
  const addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.incTact(3);
  cpu.pc++;

  // nn:3
  cpu.wz = addr + 1;
  cpu.writeMemory(addr, cpu.l);
  cpu.incTact(3);

  // nn+1:3
  cpu.writeMemory(cpu.wz, cpu.h);
  cpu.incTact(3);
}

// daa
//
// This instruction conditionally adjusts A for BCD addition
// and subtraction operations. For addition(ADD, ADC, INC) or
// subtraction(SUB, SBC, DEC, NEG), the following table indicates
// the operation being performed:
// ====================================================
// |Oper.|C before|Upper|H before|Lower|Number|C after|
// |     |DAA     |Digit|Daa     |Digit|Added |Daa    |
// ====================================================
// | ADD |   0    | 9-0 |   0    | 0-9 |  00  |   0   |
// |     |   0    | 0-8 |   0    | A-F |  06  |   0   |
// |     |   0    | 0-9 |   1    | 0-3 |  06  |   0   |
// |     |   0    | A-F |   0    | 0-9 |  60  |   1   |
// ----------------------------------------------------
// | ADC |   0    | 9-F |   0    | A-F |  66  |   1   |
// ----------------------------------------------------
// | INC |   0    | A-F |   1    | 0-3 |  66  |   1   |
// |     |   1    | 0-2 |   0    | 0-9 |  60  |   1   |
// |     |   1    | 0-2 |   0    | A-F |  66  |   1   |
// |     |   1    | 0-3 |   1    | 0-3 |  66  |   1   |
// ----------------------------------------------------
// | SUB |   0    | 0-9 |   0    | 0-9 |  00  |   0   |
// ----------------------------------------------------
// | SBC |   0    | 0-8 |   1    | 6-F |  FA  |   0   |
// ----------------------------------------------------
// | DEC |   1    | 7-F |   0    | 0-9 |  A0  |   1   |
// ----------------------------------------------------
// | NEG |   1    | 6-7 |   1    | 6-F |  9A  |   1   |
// ====================================================
// S is set if most-significant bit of the A is 1 after an
// operation; otherwise, it is reset.
// Z is set if A is 0 after an operation; otherwise, it is reset.
// H: see the DAA instruction table.
// P/V is set if A is at even parity after an operation;
// otherwise, it is reset.
// N is not affected.
// C: see the DAA instruction table.
// =================================
// | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 1 | 0x27
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Daa(cpu: Z80Cpu): void {
  const daaIndex = <u32>(
    (cpu.a + ((<u16>((cpu.f & 3) + ((cpu.f >> 2) & 4))) << 8))
  );
  cpu.af = daaResults[daaIndex];
}

// jr z,e
//
// This instruction provides for conditional branching to
// other segments of a program depending on the results of a test
// (Z flag is set). If the test evaluates to *true*, the value of displacement
// E is added to PC and the next instruction is fetched from the
// location designated by the new contents of the PC. The jump is
// measured from the address of the instruction op code and contains
// a range of –126 to +129 bytes. The assembler automatically adjusts
// for the twice incremented PC.
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0x28
// =================================
// |             E-2               |
// =================================
// T-States: Condition is met: 4, 3, 5 (12)
// Condition is not met: 4, 3 (7)
// Contention breakdown: pc:4,pc+1:3,[pc+1:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:3,[5]
function JrZ(cpu: Z80Cpu): void {
  const e = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) === 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.wz = cpu.pc = cpu.pc + <i8>e;
}

// ld hl,(NN)
//
// The contents of memory address (NN) are loaded to the
// low-order portion of HL (L), and the contents of the next
// highest memory address (NN + 1) are loaded to the high-order
// portion of HL (H).
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 0x2a
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3, 3, 3 (16)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,nn:3,nn+1:3
function LdHlNNi(cpu: Z80Cpu): void {
  // pc+1:3
  let addr = <u16>cpu.readCodeMemory();
  cpu.pc++;
  cpu.incTact(3);

  // pc+2:3
  addr += (<u16>cpu.readCodeMemory()) << 8;
  cpu.pc++;
  cpu.incTact(3);

  // nn:3
  cpu.wz = addr + 1;
  let val = <u16>cpu.readMemory(addr);
  cpu.incTact(3);

  // nn+1:3
  val += (<u16>cpu.readMemory(cpu.wz)) << 8;
  cpu.incTact(3);
  cpu.hl = val;
}

// cpl
//
// The contents of A are inverted (one's complement).
// S, Z, P/V, C are not affected.
// H and N are set.
// =================================
// | 0 | 0 | 1 | 0 | 1 | 1 | 1 | 1 | 0x2F
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Cpl(cpu: Z80Cpu): void {
  cpu.a ^= 0xff;
  cpu.f = <u8>(
    ((cpu.f & ~FlagsSetMask.R3R5) |
      FlagsSetMask.NH |
      FlagsSetMask.H |
      (cpu.a & FlagsSetMask.R3R5))
  );
}

// jr nc,E
//
// This instruction provides for conditional branching to
// other segments of a program depending on the results of a test
// (C flag is not set). If the test evaluates to *true*, the value of displacement
// E is added to PC and the next instruction is fetched from the
// location designated by the new contents of the PC. The jump is
// measured from the address of the instruction op code and contains
// a range of –126 to +129 bytes. The assembler automatically adjusts
// for the twice incremented PC.
// =================================
// | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0x30
// =================================
// |             E-2               |
// =================================
// T-States: Condition is met: 4, 3, 5 (12)
// Condition is not met: 4, 3 (7)
// Contention breakdown: pc:4,pc+1:3,[pc+1:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:3,[5]
function JrNc(cpu: Z80Cpu): void {
  const e = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) !== 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.wz = cpu.pc = cpu.pc + <i8>e;
}

// ld (NN),a
//
// The contents of A are loaded to the memory address specified by
// the operand NN
// =================================
// | 0 | 0 | 1 | 1 | 1 | 0 | 1 | 0 | 0x32
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3, 3 (13)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,nn:3

function LdNNiA(cpu: Z80Cpu): void {
  // pc+1:3
  const l = cpu.readCodeMemory();
  cpu.pc++;
  cpu.incTact(3);

  // pc+2:3
  let addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.pc++;
  cpu.incTact(3);

  // nn:3
  cpu.wz = <u8>(addr + 1) + ((<u16>cpu.a) << 8);
  cpu.writeMemory(addr, cpu.a);
  cpu.wh = cpu.a;
  cpu.incTact(3);
}

// jr c,E
//
// This instruction provides for conditional branching to
// other segments of a program depending on the results of a test
// (C flag is set). If the test evaluates to *true*, the value of displacement
// E is added to PC and the next instruction is fetched from the
// location designated by the new contents of the PC. The jump is
// measured from the address of the instruction op code and contains
// a range of –126 to +129 bytes. The assembler automatically adjusts
// for the twice incremented PC.
// =================================
// | 0 | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 0x38
// =================================
// |             E-2               |
// =================================
// T-States: Condition is met: 4, 3, 5 (12)
// Condition is not met: 4, 3 (7)
// Contention breakdown: pc:4,pc+1:3,[pc+1:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:3,[5]
function JrC(cpu: Z80Cpu): void {
  const e = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) === 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.wz = cpu.pc = cpu.pc + <i8>e;
}

// inc (hl)
//
// The byte contained in the address specified by the contents HL
// is incremented.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 3; otherwise, it is reset.
// P/V is set if (HL) was 0x7F before operation; otherwise, it is reset.
// N is reset.
// C is not affected.
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 0 | 0x34
// =================================
// T-States: 4, 4, 3 (11)
// Contention breakdown: pc:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,hl:4,hl(write):3
function IncHli(cpu: Z80Cpu): void {
  let value = cpu.readMemory(cpu.hl);
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  value = cpu.aluIncByte(value);
  cpu.writeMemory(cpu.hl, value);
  cpu.incTact(3);
}

// dec (hl)
//
// The byte contained in the address specified by the contents HL
// is decremented.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if (HL) was 0x80 before operation; otherwise, it is reset.
// N is set.
// C is not affected.
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 0 | 0x35
// =================================
// T-States: 4, 4, 3 (11)
// Contention breakdown: pc:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,hl:4,hl(write):3
function DecHli(cpu: Z80Cpu): void {
  let value = cpu.readMemory(cpu.hl);
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  value = cpu.aluDecByte(value);
  cpu.writeMemory(cpu.hl, value);
  cpu.incTact(3);
}

// ld (hl),N
//
// The N 8-bit value is loaded to the memory address specified by HL.
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 | 0x36
// =================================
// |            8-bit              |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,hl:3
function LdHliN(cpu: Z80Cpu): void {
  // pc+1: 3
  const val = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.writeMemory(cpu.hl, val);
  cpu.incTact(3);
}

// scf
//
// The Carry flag in F is set.
// Other flags are not affected.
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 1 | 0x37
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Scf(cpu: Z80Cpu): void {
  cpu.f = <u8>(
    ((cpu.f & FlagsSetMask.SZPV) |
      (cpu.a & (FlagsSetMask.R5 | FlagsSetMask.R3)) |
      FlagsSetMask.C)
  );
}

// ld a,(NN)
//
// The contents of the memory location specified by the operands
// NN are loaded to A.
// =================================
// | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0x3A
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3, 3 (13)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,nn:3
function LdANNi(cpu: Z80Cpu): void {
  let addr = <u16>cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  addr += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz = addr + 1;
  cpu.a = cpu.readMemory(addr);
  cpu.incTact(3);
}

// ccf
//
// The Carry flag in F is inverted.
// Other flags are not affected.
// =================================
// | 0 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 0x3f
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Ccf(cpu: Z80Cpu): void {
  cpu.f = <u8>(
    ((cpu.f & FlagsSetMask.SZPV) |
      (cpu.a & (FlagsSetMask.R5 | FlagsSetMask.R3)) |
      ((cpu.f & FlagsSetMask.C) !== 0 ? FlagsSetMask.H : FlagsSetMask.C))
  );
}

/// ld Q,W
//
// The contents of W are loaded to Q.
// Q, W: B, C, D, E, H, L, A
// =================================
// | 0 | 1 | Q | Q | Q | W | W | W | 0x40-0x7f
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function LdQW(cpu: Z80Cpu): void {
  const q = (cpu.opCode & 0x38) >> 3;
  const w = cpu.opCode & 0x07;
  cpu.setReg8(q, cpu.getReg8(w));
}

// ld Q,(hl)
//
// The 8-bit contents of memory location (HL) are loaded to Q.
// Q: B, C, D, E, H, L, A
// =================================
// | 0 | 1 | Q | Q | Q | 1 | 1 | 0 | 0x46, ...
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function LdQHli(cpu: Z80Cpu): void {
  const q = (cpu.opCode & 0x38) >> 3;
  cpu.setReg8(q, cpu.readMemory(cpu.hl));
  cpu.incTact(3);
}

// ld (hl),Q
//
// The contents of B are loaded to the memory location specified
// by the contents of HL.
// Q: B, C, D, E, H, L, A
// =================================
// | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0x70
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function LdHliQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  cpu.writeMemory(cpu.hl, cpu.getReg8(q));
  cpu.incTact(3);
}

// halt
//
// The HALT instruction suspends CPU operation until a subsequent
// interrupt or reset is received.While in the HALT state,
// the processor executes NOPs to maintain memory refresh logic.
// =================================
// | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0x76
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Halt(cpu: Z80Cpu): void {
  cpu.stateFlags |= Z80StateFlags.Halted;
  cpu.pc--;
}

// add a,Q
//
// The contents of Q are added to the contents of A, and the result is
// stored in A.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 3; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is reset.
// C is set if carry from bit 7; otherwise, it is reset.
// =================================
// | 1 | 0 | 0 | 0 | 0 | Q | Q | Q | 0x80
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function AddAQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const src = cpu.getReg8(q);
  cpu.f = adcFlags[((<u16>cpu.a) << 8) + src];
  cpu.a += src;
}

// add a,(hl)
//
// The byte at the memory address specified by the contents of HL
// is added to the contents of A, and the result is stored in A.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 3; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is reset.
// C is set if carry from bit 7; otherwise, it is reset.
// =================================
// | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0x86
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function AddAHli(cpu: Z80Cpu): void {
  const src = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  cpu.f = adcFlags[((<u16>cpu.a) << 8) + src];
  cpu.a += src;
}

// adc a,Q
//
// The contents of L and the C flag are added to the contents of A,
// and the result is stored in A.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 3; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is reset.
// C is set if carry from bit 7; otherwise, it is reset.
// =================================
// | 1 | 0 | 0 | 0 | 1 | Q | Q | Q | 0x88,...
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function AdcAQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const src = cpu.getReg8(q);
  const carry = (cpu.f & FlagsSetMask.C) === 0 ? 0 : 1;
  cpu.f = adcFlags[((<u32>carry) << 16) + ((<u16>cpu.a) << 8) + src];
  cpu.a += <u8>(src + carry);
}

// add a,(hl)
//
// The byte at the memory address specified by the contents of HL
// is added to the contents of A, and the result is stored in A.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 3; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is reset.
// C is set if carry from bit 7; otherwise, it is reset.
// =================================
// | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0x86
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function AdcAHli(cpu: Z80Cpu): void {
  const src = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  const carry = (cpu.f & FlagsSetMask.C) === 0 ? 0 : 1;
  cpu.f = adcFlags[((<u32>carry) << 16) + ((<u16>cpu.a) << 8) + src];
  cpu.a += <u8>(src + carry);
}

//  sub Q
//
// The contents of Q are subtracted from the contents of A, and the result is
// stored in A.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is set.
// C is set if borrow; otherwise, it is reset.
// =================================
// | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0x90
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function SubAQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const src = cpu.getReg8(q);
  cpu.f = sbcFlags[((<u16>cpu.a) << 8) + src];
  cpu.a -= src;
}

// add a,(hl)
//
// The byte at the memory address specified by the contents of HL
// is added to the contents of A, and the result is stored in A.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 3; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is reset.
// C is set if carry from bit 7; otherwise, it is reset.
// =================================
// | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0x86
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function SubAHli(cpu: Z80Cpu): void {
  const src = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  cpu.f = sbcFlags[((<u16>cpu.a) << 8) + src];
  cpu.a -= src;
}

// sbc a,Q
//
// The contents of Q and the C flag are subtracted from the contents of A,
// and the result is stored in A.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is set.
// C is set if borrow; otherwise, it is reset.
// =================================
// | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0x98, ...
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function SbcAQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const src = cpu.getReg8(q);
  const carry = (cpu.f & FlagsSetMask.C) === 0 ? 0 : 1;
  cpu.f = sbcFlags[((<u32>carry) << 16) + ((<u16>cpu.a) << 8) + src];
  cpu.a -= <u8>(src + carry);
}

// sbc a,(hl)
//
// The byte at the memory address specified by the contents of HL
// and the C flag is subtracted from the contents of A, and the
// result is stored in A.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is set.
// C is set if borrow; otherwise, it is reset.
// =================================
// | 1 | 0 | 0 | 1 | 1 | 1 | 1 | 0 | 0x9E
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function SbcAHli(cpu: Z80Cpu): void {
  const src = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  const carry = (cpu.f & FlagsSetMask.C) === 0 ? 0 : 1;
  cpu.f = sbcFlags[((<u32>carry) << 16) + ((<u16>cpu.a) << 8) + src];
  cpu.a -= <u8>(src + carry);
}

//  and Q
//
// A logical AND operation is performed between Q and the byte contained in A;
// the result is stored in the Accumulator.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set.
// P/V is reset if overflow; otherwise, it is reset.
// N is reset.
// C is reset.
// =================================
// | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0xA0, ...
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function AndAQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const src = cpu.getReg8(q);
  cpu.a &= src;
  cpu.f = <u8>(aluLogOpFlags[cpu.a] | FlagsSetMask.H);
}

// and (hl)
//
// A logical AND operation is performed between the byte at the
// memory address specified by the contents of HL and the byte
// contained in A; the result is stored in the Accumulator.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set.
// P/V is reset if overflow; otherwise, it is reset.
// N is reset.
// C is reset.
// =================================
// | 1 | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0xA6
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function AndAHli(cpu: Z80Cpu): void {
  const src = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  cpu.a &= src;
  cpu.f = <u8>(aluLogOpFlags[cpu.a] | FlagsSetMask.H);
}

// xor Q
//
// A logical XOR operation is performed between Q and the byte contained in A;
// the result is stored in the Accumulator.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is reset.
// P/V is reset if overflow; otherwise, it is reset.
// N is reset.
// C is reset.
// =================================
// | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0xA8
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function XorAQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const src = cpu.getReg8(q);
  cpu.a ^= src;
  cpu.f = aluLogOpFlags[cpu.a];
}

// xor (hl)
//
// A logical XOR operation is performed between the byte at the
// memory address specified by the contents of HL and the byte
// contained in A; the result is stored in the Accumulator.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is reset.
// P/V is reset if overflow; otherwise, it is reset.
// N is reset.
// C is reset.
// =================================
// | 1 | 0 | 1 | 0 | 1 | 1 | 1 | 0 | 0xAE
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function XorAHli(cpu: Z80Cpu): void {
  const src = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  cpu.a ^= src;
  cpu.f = aluLogOpFlags[cpu.a];
}

// or Q
//
// A logical OR operation is performed between Q and the byte contained in A;
// the result is stored in the Accumulator.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is reset.
// P/V is reset if overflow; otherwise, it is reset.
// N is reset.
// C is reset.
// =================================
// | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0xB0, ...
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
/// </remarks>
function OrAQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const src = cpu.getReg8(q);
  cpu.a |= src;
  cpu.f = aluLogOpFlags[cpu.a];
}

// or (hl)
//
// A logical OR operation is performed between the byte at the
// memory address specified by the contents of HL and the byte
// contained in A; the result is stored in the Accumulator.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is reset.
// P/V is reset if overflow; otherwise, it is reset.
// N is reset.
// C is reset.
// =================================
// | 1 | 0 | 1 | 1 | 0 | 1 | 1 | 0 | 0xB6
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function OrAHli(cpu: Z80Cpu): void {
  const src = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  cpu.a |= src;
  cpu.f = aluLogOpFlags[cpu.a];
}

// cp Q
//
// The contents of B are compared with the contents of A.
// If there is a true compare, the Z flag is set. The execution of
// this instruction does not affect A.
// Q: B, C, D, E, H, L, A
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is set.
// C is set if borrow; otherwise, it is reset.
// =================================
// | 1 | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 0xB8
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function CpAQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const src = cpu.getReg8(q);
  const res = ((<u16>cpu.a) << 8) + src;
  cpu.f = <u8>(
    ((sbcFlags[res] & ~FlagsSetMask.R3 & ~FlagsSetMask.R5) |
      (res & FlagsSetMask.R3R5))
  );
}

// cp (hl)
//
// The contents of the byte at the memory address specified by
// the contents of HL are compared with the contents of A.
// If there is a true compare, the Z flag is set. The execution of
// this instruction does not affect A.
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is set.
// C is set if borrow; otherwise, it is reset.
// =================================
// | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 0 | 0xBE
// =================================
// T-States: 4, 3 (7)
// Contention breakdown: pc:4,hl:3
function CpAHli(cpu: Z80Cpu): void {
  const src = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  const res = ((<u16>cpu.a) << 8) + src;
  cpu.f = <u8>(
    ((sbcFlags[res] & ~FlagsSetMask.R3 & ~FlagsSetMask.R5) |
      (res & FlagsSetMask.R3R5))
  );
}

// ret nz
//
// If Z flag is not set, the byte at the memory location specified
// by the contents of SP is moved to the low-order 8 bits of PC.
// SP is incremented and the byte at the memory location specified by
// the new contents of the SP are moved to the high-order eight bits of
// PC.The SP is incremented again. The next op code following this
// instruction is fetched from the memory location specified by the PC.
// This instruction is normally used to return to the main line program at
// the completion of a routine entered by a CALL instruction.
// If condition X is false, PC is simply incremented as usual, and the
// program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0xC0
// =================================
// T-States: If X is true: 5, 3, 3 (11)
// If X is false: 5 (5)
// Contention breakdown: pc:5,[sp:3,sp+1:3]
function RetNz(cpu: Z80Cpu): void {
  cpu.incTact(1);
  if ((cpu.f & FlagsSetMask.Z) !== 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

/// pop bc
//
// The top two bytes of the external memory last-in, first-out (LIFO)
// stack are popped to register pair QQ. SP holds the 16-bit address
// of the current top of the stack. This instruction first loads to
// the low-order portion of RR, the byte at the memory location
// corresponding to the contents of SP; then SP is incremented and
// the contents of the corresponding adjacent memory location are
// loaded to the high-order portion of RR and the SP is now incremented
// again.
// =================================
// | 1 | 1 | Q| Q | 0 | 0 | 0 | 1 | 0xc1, 0xd1, 0xe1, 0xf1
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,sp:3,sp+1:3
function PopBc(cpu: Z80Cpu): void {
  const val = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.bc = ((<u16>cpu.readMemory(cpu.sp)) << 8) | val;
  cpu.incTact(3);
  cpu.sp++;
}

// jp nz,NN
//
// If Z flag is not set, the instruction loads operand NN
// to PC, and the program continues with the instruction
// beginning at address NN.
// If condition X is false, PC is incremented as usual, and
// the program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0xC2
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function JpNz(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) !== 0) {
    return;
  }
  cpu.pc = cpu.wz;
}

// jp NN
//
// Operand NN is loaded to PC. The next instruction is fetched
// from the location designated by the new contents of the PC.
// =================================
// | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0xC3
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function Jp(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  cpu.pc = cpu.wz;
}

// call nz,NN
//
// If flag Z is not set, this instruction pushes the current
// contents of PC onto the top of the external memory stack, then
// loads the operands NN to PC to point to the address in memory
// at which the first op code of a subroutine is to be fetched.
// At the end of the subroutine, a RET instruction can be used to
// return to the original program flow by popping the top of the
// stack back to PC. If condition X is false, PC is incremented as
// usual, and the program continues with the next sequential
// instruction. The stack push is accomplished by first decrementing
// the current contents of SP, loading the high-order byte of the PC
// contents to the memory address now pointed to by SP; then
// decrementing SP again, and loading the low-order byte of the PC
// contents to the top of the stack.
// =================================
// | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0xC4
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,[pc+2:1,sp-1:3,sp-2:3]
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,[1,sp-1:3,sp-2:3]
function CallNz(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) !== 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// push bc
//
// The contents of the register pair BC are pushed to the external
// memory last-in, first-out (LIFO) stack. SP holds the 16-bit
// address of the current top of the Stack. This instruction first
// decrements SP and loads the high-order byte of register pair RR
// to the memory address specified by SP. Then SP is decremented again
// and loads the low-order byte of RR to the memory location
// corresponding to this new address in SP.
// =================================
// | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 1 | 0xC5
// =================================
// T-States: 5, 3, 3 (10)
// Contention breakdown: pc:5,sp-1:3,sp-2:3
function PushBc(cpu: Z80Cpu): void {
  const val = cpu.bc;
  cpu.sp--;
  cpu.incTact(1);
  cpu.writeMemory(cpu.sp, <u8>(val >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>val);
  cpu.incTact(3);
}

// Executes one of the ADD, ADC, SUB, SBC, AND, XOR, OR, or CP
// operation for A and the 8-bit value specified in N.
//
// The flags are set according to the ALU operation rules.
// =================================
// | 0 | 1 | A | A | A | 1 | 1 | 0 |
// =================================
// |            8-bit              |
// =================================
// A: 000=ADD, 001=ADC, 010=SUB, 011=SBC,
// 100=AND, 101=XOR, 110=OR, 111=CP
// T-States: 4, 3 (7)
function AluAN(cpu: Z80Cpu): void {
  const val = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  const alg = aluAlgorithms[(cpu.opCode & 0x38) >> 3];
  alg(cpu, val, cpu.cFlag);
}

//  ret z
//
// If Z flag is set, the byte at the memory location specified
// by the contents of SP is moved to the low-order 8 bits of PC.
// SP is incremented and the byte at the memory location specified by
// the new contents of the SP are moved to the high-order eight bits of
// PC.The SP is incremented again. The next op code following this
// instruction is fetched from the memory location specified by the PC.
// This instruction is normally used to return to the main line program at
// the completion of a routine entered by a CALL instruction.
// If condition X is false, PC is simply incremented as usual, and the
// program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0xC8
// =================================
// T-States: If X is true: 5, 3, 3 (11)
// If X is false: 5 (5)
// Contention breakdown: pc:5,[sp:3,sp+1:3]
function RetZ(cpu: Z80Cpu): void {
  cpu.incTact(1);
  if ((cpu.f & FlagsSetMask.Z) === 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

// ret
//
// The byte at the memory location specified by the contents of SP
// is moved to the low-order eight bits of PC. SP is now incremented
// and the byte at the memory location specified by the new contents
// of this instruction is fetched from the memory location specified
// by PC.
// This instruction is normally used to return to the main line
// program at the completion of a routine entered by a CALL
// instruction.
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 0xC9
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,sp:3,sp+1:3
function Ret(cpu: Z80Cpu): void {
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

// jp z,NN
//
// If Z flag is set, the instruction loads operand NN
// to PC, and the program continues with the instruction
// beginning at address NN.
// If condition X is false, PC is incremented as usual, and
// the program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 0 | 0xCA
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function JpZ(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) === 0) {
    return;
  }
  cpu.pc = cpu.wz;
}

// call z,NN
//
// If flag Z is set, this instruction pushes the current
// contents of PC onto the top of the external memory stack, then
// loads the operands NN to PC to point to the address in memory
// at which the first op code of a subroutine is to be fetched.
// At the end of the subroutine, a RET instruction can be used to
// return to the original program flow by popping the top of the
// stack back to PC. If condition X is false, PC is incremented as
// usual, and the program continues with the next sequential
// instruction. The stack push is accomplished by first decrementing
// the current contents of SP, loading the high-order byte of the PC
// contents to the memory address now pointed to by SP; then
// decrementing SP again, and loading the low-order byte of the PC
// contents to the top of the stack.
// =================================
// | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0xCC
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,[pc+2:1,sp-1:3,sp-2:3]
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,[1,sp-1:3,sp-2:3]
function CallZ(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) === 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// call NN
//
// The current contents of PC are pushed onto the top of the
// external memory stack. The operands NN are then loaded to PC to
// point to the address in memory at which the first op code of a
// subroutine is to be fetched. At the end of the subroutine, a RET
// instruction can be used to return to the original program flow by
// popping the top of the stack back to PC. The push is accomplished
// by first decrementing the current contents of SP, loading the
// high-order byte of the PC contents to the memory address now pointed
// to by SP; then decrementing SP again, and loading the low-order
// byte of the PC contents to the top of stack.
// =================================
// | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 1 | 0xCD
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 4, 3, 3 (17)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,pc+2:1,sp-1:3,sp-2:3
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,1,sp-1:3,sp-2:3
function Call(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// ret nc
//
// If C flag is not set, the byte at the memory location specified
// by the contents of SP is moved to the low-order 8 bits of PC.
// SP is incremented and the byte at the memory location specified by
// the new contents of the SP are moved to the high-order eight bits of
// PC.The SP is incremented again. The next op code following this
// instruction is fetched from the memory location specified by the PC.
// This instruction is normally used to return to the main line program at
// the completion of a routine entered by a CALL instruction.
// If condition X is false, PC is simply incremented as usual, and the
// program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0xD0
// =================================
// T-States: If X is true: 5, 3, 3 (11)
// If X is false: 5 (5)
// Contention breakdown: pc:5,[sp:3,sp+1:3]
function RetNc(cpu: Z80Cpu): void {
  cpu.incTact(1);
  if ((cpu.f & FlagsSetMask.C) !== 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

// pop de
//
// The top two bytes of the external memory last-in, first-out (LIFO)
// stack are popped to register pair DE. SP holds the 16-bit address
// of the current top of the stack. This instruction first loads to
// the low-order portion of RR, the byte at the memory location
// corresponding to the contents of SP; then SP is incremented and
// the contents of the corresponding adjacent memory location are
// loaded to the high-order portion of RR and the SP is now incremented
// again.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 1 | 0xD1
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,sp:3,sp+1:3
function PopDe(cpu: Z80Cpu): void {
  const val = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.de = ((<u16>cpu.readMemory(cpu.sp)) << 8) | val;
  cpu.incTact(3);
  cpu.sp++;
}

// jp nc,NN
//
// If C flag is not set, the instruction loads operand NN
// to PC, and the program continues with the instruction
// beginning at address NN.
// If condition X is false, PC is incremented as usual, and
// the program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0xD2
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function JpNc(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) !== 0) {
    return;
  }
  cpu.pc = cpu.wz;
}

// out (N),a
//
// The operand N is placed on the bottom half (A0 through A7) of
// the address bus to select the I/O device at one of 256 possible
// ports. The contents of A also appear on the top half(A8 through
// A15) of the address bus at this time. Then the byte contained
// in A is placed on the data bus and written to the selected
// peripheral device.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | 0xD3
// =================================
// |            8-bit              |
// =================================
// T-States: 4, 3, 4 (11)
// Contention breakdown: pc:4,pc+1:3,I/O
function OutNA(cpu: Z80Cpu): void {
  let port = <u16>cpu.readCodeMemory();
  cpu.pc++;
  cpu.incTact(3);

  // I/O
  cpu.wz = port + 1 + ((<u16>cpu.a) << 8);
  port += (<u16>cpu.a) << 8;
  cpu.writePort(port, cpu.a);
}

// call nc,NN
//
// If flag C is not set, this instruction pushes the current
// contents of PC onto the top of the external memory stack, then
// loads the operands NN to PC to point to the address in memory
// at which the first op code of a subroutine is to be fetched.
// At the end of the subroutine, a RET instruction can be used to
// return to the original program flow by popping the top of the
// stack back to PC. If condition X is false, PC is incremented as
// usual, and the program continues with the next sequential
// instruction. The stack push is accomplished by first decrementing
// the current contents of SP, loading the high-order byte of the PC
// contents to the memory address now pointed to by SP; then
// decrementing SP again, and loading the low-order byte of the PC
// contents to the top of the stack.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 0xD4
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,[pc+2:1,sp-1:3,sp-2:3]
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,[1,sp-1:3,sp-2:3]
function CallNc(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) !== 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// push de
//
// The contents of the register pair DE are pushed to the external
// memory last-in, first-out (LIFO) stack. SP holds the 16-bit
// address of the current top of the Stack. This instruction first
// decrements SP and loads the high-order byte of register pair RR
// to the memory address specified by SP. Then SP is decremented again
// and loads the low-order byte of RR to the memory location
// corresponding to this new address in SP.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0xD5
// =================================
// T-States: 5, 3, 3 (10)
// Contention breakdown: pc:5,sp-1:3,sp-2:3
function PushDe(cpu: Z80Cpu): void {
  const val = cpu.de;
  cpu.sp--;
  cpu.incTact(1);
  cpu.writeMemory(cpu.sp, <u8>(val >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>val);
  cpu.incTact(3);
}

// ret c
//
// If C flag is set, the byte at the memory location specified
// by the contents of SP is moved to the low-order 8 bits of PC.
// SP is incremented and the byte at the memory location specified by
// the new contents of the SP are moved to the high-order eight bits of
// PC.The SP is incremented again. The next op code following this
// instruction is fetched from the memory location specified by the PC.
// This instruction is normally used to return to the main line program at
// the completion of a routine entered by a CALL instruction.
// If condition X is false, PC is simply incremented as usual, and the
// program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0xD8
// =================================
// T-States: If X is true: 5, 3, 3 (11)
// If X is false: 5 (5)
// Contention breakdown: pc:5,[sp:3,sp+1:3]
function RetC(cpu: Z80Cpu): void {
  cpu.incTact(1);
  if ((cpu.f & FlagsSetMask.C) === 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

// exx
//
// Each 2-byte value in register pairs BC, DE, and HL is exchanged
// with the 2-byte value in BC', DE', and HL', respectively.
// =================================
// | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 1 | 0xD9
// =================================
// T-States: 4, (4)
// Contention breakdown: pc:4
function Exx(cpu: Z80Cpu): void {
  let tmp = cpu.bc;
  cpu.bc = cpu._bc_;
  cpu._bc_ = tmp;
  tmp = cpu.de;
  cpu.de = cpu._de_;
  cpu._de_ = tmp;
  tmp = cpu.hl;
  cpu.hl = cpu._hl_;
  cpu._hl_ = tmp;
}

// jp c,NN
//
// If C flag is not set, the instruction loads operand NN
// to PC, and the program continues with the instruction
// beginning at address NN.
// If condition X is false, PC is incremented as usual, and
// the program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0xDA
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function JpC(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) === 0) {
    return;
  }
  cpu.pc = cpu.wz;
}

// in a,(N)
//
// The operand N is placed on the bottom half (A0 through A7) of
// the address bus to select the I/O device at one of 256 possible
// ports. The contents of A also appear on the top half (A8 through
// A15) of the address bus at this time. Then one byte from the
// selected port is placed on the data bus and written to A
// in the CPU.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | 0xDB
// =================================
// |            8-bit              |
// =================================
// T-States: 4, 3, 4 (11)
// Contention breakdown: pc:4,pc+1:3,I/O
function InAN(cpu: Z80Cpu): void {
  // pc+1:3
  let port = <u16>cpu.readCodeMemory();
  cpu.pc++;
  cpu.incTact(3);

  // I/O
  port += (<u16>cpu.a) << 8;
  cpu.wz = ((<u16>cpu.a) << 8) + port + 1;
  cpu.a = cpu.readPort(port);
}

// call c,NN
//
// If flag C is set, this instruction pushes the current
// contents of PC onto the top of the external memory stack, then
// loads the operands NN to PC to point to the address in memory
// at which the first op code of a subroutine is to be fetched.
// At the end of the subroutine, a RET instruction can be used to
// return to the original program flow by popping the top of the
// stack back to PC. If condition X is false, PC is incremented as
// usual, and the program continues with the next sequential
// instruction. The stack push is accomplished by first decrementing
// the current contents of SP, loading the high-order byte of the PC
// contents to the memory address now pointed to by SP; then
// decrementing SP again, and loading the low-order byte of the PC
// contents to the top of the stack.
// =================================
// | 1 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 0xDC
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10) / 4, 3, 4, 3, 3 (17)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,[pc+2:1,sp-1:3,sp-2:3]
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,[1,sp-1:3,sp-2:3]
function CallC(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) === 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// ret po
//
// If PV flag is not set, the byte at the memory location specified
// by the contents of SP is moved to the low-order 8 bits of PC.
// SP is incremented and the byte at the memory location specified by
// the new contents of the SP are moved to the high-order eight bits of
// PC.The SP is incremented again. The next op code following this
// instruction is fetched from the memory location specified by the PC.
// This instruction is normally used to return to the main line program at
// the completion of a routine entered by a CALL instruction.
// If condition X is false, PC is simply incremented as usual, and the
// program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0xE0
// =================================
// T-States: If X is true: 5, 3, 3 (11)
// If X is false: 5 (5)
// Contention breakdown: pc:5,[sp:3,sp+1:3]
function RetPo(cpu: Z80Cpu): void {
  cpu.incTact(1);
  if ((cpu.f & FlagsSetMask.PV) !== 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

// pop hl
//
// The top two bytes of the external memory last-in, first-out (LIFO)
// stack are popped to register pair HL. SP holds the 16-bit address
// of the current top of the stack. This instruction first loads to
// the low-order portion of RR, the byte at the memory location
// corresponding to the contents of SP; then SP is incremented and
// the contents of the corresponding adjacent memory location are
// loaded to the high-order portion of RR and the SP is now incremented
// again.
// =================================
// | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0xE1
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,sp:3,sp+1:3
function PopHl(cpu: Z80Cpu): void {
  const val = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.hl = ((<u16>cpu.readMemory(cpu.sp)) << 8) | val;
  cpu.incTact(3);
  cpu.sp++;
}

// jp po,NN
//
// If PV flag is not set, the instruction loads operand NN
// to PC, and the program continues with the instruction
// beginning at address NN.
// If condition X is false, PC is incremented as usual, and
// the program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0xE2
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function JpPo(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.PV) !== 0) {
    return;
  }
  cpu.pc = cpu.wz;
}

// ex (sp),hl
//
// The low-order byte contained in HL is exchanged with the contents
// of the memory address specified by the contents of SP, and the
// high-order byte of HL is exchanged with the next highest memory
// address (SP+1).
// =================================
// | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 0xE3
// =================================
// T-States: 4, 3, 4, 3, 5 (19)
// Contention breakdown: pc:4,sp:3,sp+1:3,sp+1:1,sp+1(write):3,sp(write):3,sp(write):1 ×2
// Gate array contention breakdown: pc:4,sp:3,sp+1:4,sp+1(write):3,sp(write):5
function ExSpiHl(cpu: Z80Cpu): void {
  let tmpSp = cpu.sp;
  cpu.wz = cpu.readMemory(tmpSp);
  cpu.incTact(3);
  tmpSp++;
  cpu.wz += (<u16>cpu.readMemory(tmpSp)) << 8;
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(tmpSp);
    cpu.incTact(1);
  }
  cpu.writeMemory(tmpSp, cpu.h);
  tmpSp--;
  cpu.incTact(3);
  cpu.writeMemory(tmpSp, cpu.l);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.incTact(3);
    cpu.writeMemory(tmpSp, cpu.l);
    cpu.incTact(1);
    cpu.writeMemory(tmpSp, cpu.l);
    cpu.incTact(1);
  }
  cpu.hl = cpu.wz;
}

// call po,NN
//
// If flag PV is not set, this instruction pushes the current
// contents of PC onto the top of the external memory stack, then
// loads the operands NN to PC to point to the address in memory
// at which the first op code of a subroutine is to be fetched.
// At the end of the subroutine, a RET instruction can be used to
// return to the original program flow by popping the top of the
// stack back to PC. If condition X is false, PC is incremented as
// usual, and the program continues with the next sequential
// instruction. The stack push is accomplished by first decrementing
// the current contents of SP, loading the high-order byte of the PC
// contents to the memory address now pointed to by SP; then
// decrementing SP again, and loading the low-order byte of the PC
// contents to the top of the stack.
// =================================
// | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0xE4
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,[pc+2:1,sp-1:3,sp-2:3]
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,[1,sp-1:3,sp-2:3]
function CallPo(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.PV) !== 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// push hl
//
// The contents of the register pair HL are pushed to the external
// memory last-in, first-out (LIFO) stack. SP holds the 16-bit
// address of the current top of the Stack. This instruction first
// decrements SP and loads the high-order byte of register pair RR
// to the memory address specified by SP. Then SP is decremented again
// and loads the low-order byte of RR to the memory location
// corresponding to this new address in SP.
// =================================
// | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 0xE5
// =================================
// T-States: 5, 3, 3 (10)
// Contention breakdown: pc:5,sp-1:3,sp-2:3
function PushHl(cpu: Z80Cpu): void {
  const val = cpu.hl;
  cpu.sp--;
  cpu.incTact(1);
  cpu.writeMemory(cpu.sp, <u8>(val >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>val);
  cpu.incTact(3);
}

// ret pe
//
// If PV flag is not set, the byte at the memory location specified
// by the contents of SP is moved to the low-order 8 bits of PC.
// SP is incremented and the byte at the memory location specified by
// the new contents of the SP are moved to the high-order eight bits of
// PC.The SP is incremented again. The next op code following this
// instruction is fetched from the memory location specified by the PC.
// This instruction is normally used to return to the main line program at
// the completion of a routine entered by a CALL instruction.
// If condition X is false, PC is simply incremented as usual, and the
// program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 0xE8
// =================================
// T-States: If X is true: 5, 3, 3 (11)
// If X is false: 5 (5)
// Contention breakdown: pc:5,[sp:3,sp+1:3]
function RetPe(cpu: Z80Cpu): void {
  cpu.incTact(1);
  if ((cpu.f & FlagsSetMask.PV) === 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

// jp (hl)
//
// PC is loaded with the contents of HL. The next instruction is
// fetched from the location designated by the new contents of PC.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 0xE9
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function JpHli(cpu: Z80Cpu): void {
  cpu.pc = cpu.hl;
}

// jp pe,NN
//
// If PV flag is set, the instruction loads operand NN
// to PC, and the program continues with the instruction
// beginning at address NN.
// If condition X is false, PC is incremented as usual, and
// the program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0xEA
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function JpPe(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.PV) === 0) {
    return;
  }
  cpu.pc = cpu.wz;
}

// ex de,hl
//
// The 2-byte contents of register pairs DE and HL are exchanged.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 1 | 0xEB
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function ExDeHl(cpu: Z80Cpu): void {
  const tmp = cpu.de;
  cpu.de = cpu.hl;
  cpu.hl = tmp;
}

// call pe,NN
//
// If flag PV is set, this instruction pushes the current
// contents of PC onto the top of the external memory stack, then
// loads the operands NN to PC to point to the address in memory
// at which the first op code of a subroutine is to be fetched.
// At the end of the subroutine, a RET instruction can be used to
// return to the original program flow by popping the top of the
// stack back to PC. If condition X is false, PC is incremented as
// usual, and the program continues with the next sequential
// instruction. The stack push is accomplished by first decrementing
// the current contents of SP, loading the high-order byte of the PC
// contents to the memory address now pointed to by SP; then
// decrementing SP again, and loading the low-order byte of the PC
// contents to the top of the stack.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0xEC
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,[pc+2:1,sp-1:3,sp-2:3]
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,[1,sp-1:3,sp-2:3]
function CallPe(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.PV) === 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// ret p
//
// If S flag is not set, the byte at the memory location specified
// by the contents of SP is moved to the low-order 8 bits of PC.
// SP is incremented and the byte at the memory location specified by
// the new contents of the SP are moved to the high-order eight bits of
// PC.The SP is incremented again. The next op code following this
// instruction is fetched from the memory location specified by the PC.
// This instruction is normally used to return to the main line program at
// the completion of a routine entered by a CALL instruction.
// If condition X is false, PC is simply incremented as usual, and the
// program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0xF0
// =================================
// T-States: If X is true: 5, 3, 3 (11)
// If X is false: 5 (5)
// Contention breakdown: pc:5,[sp:3,sp+1:3]
function RetP(cpu: Z80Cpu): void {
  cpu.incTact(1);
  if ((cpu.f & FlagsSetMask.S) !== 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

// pop af
//
// The top two bytes of the external memory last-in, first-out (LIFO)
// stack are popped to register pair AF. SP holds the 16-bit address
// of the current top of the stack. This instruction first loads to
// the low-order portion of RR, the byte at the memory location
// corresponding to the contents of SP; then SP is incremented and
// the contents of the corresponding adjacent memory location are
// loaded to the high-order portion of RR and the SP is now incremented
// again.
// =================================
// | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 0xF1
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,sp:3,sp+1:3
function PopAf(cpu: Z80Cpu): void {
  const val = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.af = ((<u16>cpu.readMemory(cpu.sp)) << 8) | val;
  cpu.incTact(3);
  cpu.sp++;
}

// jp p,NN
//
// If S flag is not set, the instruction loads operand NN
// to PC, and the program continues with the instruction
// beginning at address NN.
// If condition X is false, PC is incremented as usual, and
// the program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 0xF2
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function JpP(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.S) !== 0) {
    return;
  }
  cpu.pc = cpu.wz;
}

// di
//
// Disables the maskable interrupt by resetting the interrupt
// enable flip-flops (IFF1 and IFF2).
// =================================
// | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 1 | 0xF3
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Di(cpu: Z80Cpu): void {
  cpu.iff2 = cpu.iff1 = false;
}

// call p,NN
//
// If flag S is not set, this instruction pushes the current
// contents of PC onto the top of the external memory stack, then
// loads the operands NN to PC to point to the address in memory
// at which the first op code of a subroutine is to be fetched.
// At the end of the subroutine, a RET instruction can be used to
// return to the original program flow by popping the top of the
// stack back to PC. If condition X is false, PC is incremented as
// usual, and the program continues with the next sequential
// instruction. The stack push is accomplished by first decrementing
// the current contents of SP, loading the high-order byte of the PC
// contents to the memory address now pointed to by SP; then
// decrementing SP again, and loading the low-order byte of the PC
// contents to the top of the stack.
// =================================
// | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 0xF4
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,[pc+2:1,sp-1:3,sp-2:3]
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,[1,sp-1:3,sp-2:3]
function CallP(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.S) !== 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// push af
//
// The contents of the register pair BC are pushed to the external
// memory last-in, first-out (LIFO) stack. SP holds the 16-bit
// address of the current top of the Stack. This instruction first
// decrements SP and loads the high-order byte of register pair RR
// to the memory address specified by SP. Then SP is decremented again
// and loads the low-order byte of RR to the memory location
// corresponding to this new address in SP.
// =================================
// | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 0xF5
// =================================
// T-States: 5, 3, 3 (10)
// Contention breakdown: pc:5,sp-1:3,sp-2:3
function PushAf(cpu: Z80Cpu): void {
  const val = cpu.af;
  cpu.sp--;
  cpu.incTact(1);
  cpu.writeMemory(cpu.sp, <u8>(val >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>val);
  cpu.incTact(3);
}

// ret m
//
// If S flag is set, the byte at the memory location specified
// by the contents of SP is moved to the low-order 8 bits of PC.
// SP is incremented and the byte at the memory location specified by
// the new contents of the SP are moved to the high-order eight bits of
// PC.The SP is incremented again. The next op code following this
// instruction is fetched from the memory location specified by the PC.
// This instruction is normally used to return to the main line program at
// the completion of a routine entered by a CALL instruction.
// If condition X is false, PC is simply incremented as usual, and the
// program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0xF8
// =================================
// T-States: If X is true: 5, 3, 3 (11)
// If X is false: 5 (5)
// Contention breakdown: pc:5,[sp:3,sp+1:3]
function RetM(cpu: Z80Cpu): void {
  cpu.incTact(1);
  if ((cpu.f & FlagsSetMask.S) === 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = cpu.wz;
}

// ld sp,hl
//
// The contents of HL are loaded to SP.
// =================================
// | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 0xF9
// =================================
// T-States: 4 (6)
// Contention breakdown: pc:6
function LdSpHl(cpu: Z80Cpu): void {
  cpu.sp = cpu.hl;
  cpu.incTact(2);
}

// jp m,NN
//
// If S flag is set, the instruction loads operand NN
// to PC, and the program continues with the instruction
// beginning at address NN.
// If condition X is false, PC is incremented as usual, and
// the program continues with the next sequential instruction.
// =================================
// | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 0xFA
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3
function JpM(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.S) === 0) {
    return;
  }
  cpu.pc = cpu.wz;
}

// ei
//
// Sets both interrupt enable flip flops (IFFI and IFF2) to a
// logic 1 value, allowing recognition of any maskable interrupt.
// =================================
// | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0xFB
// =================================
// T-States: 4 (4)
// Contention breakdown: pc:4
function Ei(cpu: Z80Cpu): void {
  cpu.iff2 = cpu.iff1 = cpu.isInterruptBlocked = true;
}

// call m,NN
//
// If flag S is set, this instruction pushes the current
// contents of PC onto the top of the external memory stack, then
// loads the operands NN to PC to point to the address in memory
// at which the first op code of a subroutine is to be fetched.
// At the end of the subroutine, a RET instruction can be used to
// return to the original program flow by popping the top of the
// stack back to PC. If condition X is false, PC is incremented as
// usual, and the program continues with the next sequential
// instruction. The stack push is accomplished by first decrementing
// the current contents of SP, loading the high-order byte of the PC
// contents to the memory address now pointed to by SP; then
// decrementing SP again, and loading the low-order byte of the PC
// contents to the top of the stack.
// =================================
// | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0xFC
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 3, 3 (10)
// Contention breakdown: pc:4,pc+1:3,pc+2:3,[pc+2:1,sp-1:3,sp-2:3]
// Gate array contention breakdown: pc:4,pc+1:3,pc+2:3,[1,sp-1:3,sp-2:3]
function CallM(cpu: Z80Cpu): void {
  cpu.wz = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.S) === 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.incTact(1);

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);
  cpu.pc = cpu.wz;
}

// rst N
//
// The current PC contents are pushed onto the external memory stack,
// and the Page 0 memory location assigned by operand N is loaded to
// PC. Program execution then begins with the op code in the address
// now pointed to by PC. The push is performed by first decrementing
// the contents of SP, loading the high-order byte of PC to the
// memory address now pointed to by SP, decrementing SP again, and
// loading the low-order byte of PC to the address now pointed to by
// SP. The Restart instruction allows for a jump to address N.
// Because all addresses are stored in Page 0 of memory, the high-order
// byte of PC is loaded with 0x00.
// N: 0x00, 0x08, 0x10, 0x18, 0x20, 0x28, 0x30, 0x38,
// =================================
// | 1 | 1 | N | N | N | 1 | 1 | 1 | 0xC7
// =================================
// T-States: 5, 3, 3 (11)
// Contention breakdown: pc:5,sp-1:3,sp-2:3
function RstN(cpu: Z80Cpu): void {
  cpu.sp--;
  cpu.incTact(1);

  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.incTact(3);

  cpu.wz = cpu.opCode & 0x38;
  cpu.pc = cpu.wz;
}

// ============================================================================
// Indexed instructions

// add ix,QQ
//
// The contents of QQ register pair are added to the contents of IX,
// and the results are stored in IX.
//
// S, Z, P/V is not affected.
// H is set if carry from bit 11; otherwise, it is reset.
// N is reset.
// C is set if carry from bit 15; otherwise, it is reset.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | Q | Q | 1 | 0 | 0 | 1 | 0x09, ...
// =================================
// QQ: 00=BC, 01=DE, 10=IX, 11=SP
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:11
function AddIxQQ(cpu: Z80Cpu): void {
  let qq = (cpu.opCode & 0x30) >> 4;
  const ixVal = cpu.getIndexReg();
  const qqVal = qq === 2 ? ixVal : cpu.getReg16(qq);
  cpu.wz = ixVal + 1;
  cpu.setIndexReg(cpu.aluAddHL(ixVal, qqVal));
  cpu.incTact(7);
}

// ld ix,NN
//
// The 16-bit integer is loaded to IX.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 |
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 4, 3, 3 (14)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+2:3
function LdIxNN(cpu: Z80Cpu): void {
  // pc+1:3
  const low = cpu.readCodeMemory();
  cpu.pc++;
  cpu.incTact(3);

  // pc+2:3
  const high = cpu.readCodeMemory();
  cpu.pc++;
  cpu.setIndexReg(((<u16>high) << 8) | low);
  cpu.incTact(3);
}

// ld(NN),ix
///
// The low-order byte in IX is loaded to memory address (NN);
// the upper order byte is loaded to the next highest address
// (NN + 1).
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 |
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// T-States: 4, 4, 3, 3, 3, 3 (20)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,nn:3,nn+1:3
function LdNNiIx(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();

  // pc+1:3
  const l = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;

  // pc+2:3
  const addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.incTact(3);
  cpu.pc++;

  // nn:3
  cpu.wz = addr + 1;
  cpu.writeMemory(addr, <u8>ixVal);
  cpu.incTact(3);

  // nn+1:3
  cpu.writeMemory(cpu.wz, <u8>(ixVal >> 8));
  cpu.incTact(3);
}

// inc ix
//
// The contents of IX are incremented.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 1 |
// =================================
// T-States: 4, 6 (10)
// Contention breakdown: pc:4,pc+1:6
function IncIx(cpu: Z80Cpu): void {
  const value = cpu.getIndexReg();
  cpu.setIndexReg(value + 1);
  cpu.incTact(2);
}

// inc xh
//
// The contents of XH are incremented.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function IncXh(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();
  const hVal = cpu.aluIncByte(<u8>(ixVal >> 8));
  cpu.setIndexReg(((<u16>hVal) << 8) | (<u8>ixVal));
}

// dec xh
//
// The contents of XH are decremented.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 1 |
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function DecXh(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();
  const hVal = cpu.aluDecByte(<u8>(ixVal >> 8));
  cpu.setIndexReg(((<u16>hVal) << 8) | (<u8>ixVal));
}

// ld xh,N
//
// The 8-bit integer N is loaded to XH
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 0 |
// =================================
// |            8-bit              |
// =================================
// T-States: 4, 4, 3, (11)
// Contention breakdown: pc:4,pc+1:4,pc+2:3
function LdXhN(cpu: Z80Cpu): void {
  const val = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.setIndexReg(((<u16>val) << 8) | (<u8>cpu.getIndexReg()));
}

// ld ix,(NN)
//
// The contents of the address (NN) are loaded to the low-order
// portion of IX, and the contents of the next highest memory address
// (NN + 1) are loaded to the high-orderp ortion of IX.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
// =================================
// |            8-bit L            |
// =================================
// |            8-bit H            |
// =================================
// T-States: 4, 4, 3, 3, 3, 3 (20)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,nn:3,nn+1:3
function LdIxNNi(cpu: Z80Cpu): void {
  const l = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  const addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz = addr + 1;
  let val = <u16>cpu.readMemory(addr);
  cpu.incTact(3);
  val += (<u16>cpu.readMemory(cpu.wz)) << 8;
  cpu.incTact(3);
  cpu.setIndexReg(val);
}

// dec ix
//
// The contents of IX are decremented.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 1 | 1 |
// =================================
// T-States: 4, 6 (10)
// Contention breakdown: pc:4,pc+1:6
function DecIx(cpu: Z80Cpu): void {
  cpu.setIndexReg(cpu.getIndexReg() - 1);
  cpu.incTact(2);
}

// inc xl
//
// The contents of XL are incremented.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 1 | 1 | 0 | 0 |
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function IncXl(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();
  const lVal = cpu.aluIncByte(<u8>ixVal);
  cpu.setIndexReg((ixVal & 0xff00) | lVal);
}

// dec xl
//
// The contents of XL are decremented.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 1 | 1 | 0 | 1 |
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function DecXl(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();
  const lVal = cpu.aluDecByte(<u8>ixVal);
  cpu.setIndexReg((ixVal & 0xff00) | lVal);
}

// ld xl,N
//
// The 8-bit integer N is loaded to XL
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 0 | 1 | 1 | 1 | 0 |
// =================================
// |            8-bit              |
// =================================
// T-States: 4, 4, 3, (11)
// Contention breakdown: pc:4,pc+1:4,pc+2:3
function LdXlN(cpu: Z80Cpu): void {
  const val = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.setIndexReg((cpu.getIndexReg() & 0xff00) | val);
}

// inc (ix+D)
//
// The contents of IX are added to the two's-complement displacement
// integer, D, to point to an address in memory. The contents of this
// address are then incremented.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 3; otherwise, it is reset.
// P/V is set if (IX+D) was 0x7F before operation; otherwise, it is reset.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 0 |
// =================================
// |            8-bit              |
// =================================
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+2:1 ×5,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:8,ii+n:4,ii+n(write):3
function IncIxi(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();
  const offset = cpu.readCodeMemory();
  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  let memVal = cpu.readMemory(addr);
  cpu.incTact(3);
  memVal = cpu.aluIncByte(memVal);
  cpu.incTact(1);
  cpu.writeMemory(addr, memVal);
  cpu.incTact(3);
}

// dec (ix+D)
//
// The contents of IX are added to the two's-complement displacement
// integer, D, to point to an address in memory. The contents of this
// address are then decremented.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4, otherwise, it is reset.
// P/V is set if (IX+D) was 0x80 before operation; otherwise, it is reset.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 1 |
// =================================
// |            8-bit              |
// =================================
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+2:1 ×5,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:8,ii+n:4,ii+n(write):3
function DecIxi(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();
  const offset = cpu.readCodeMemory();
  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  let memVal = cpu.readMemory(addr);
  cpu.incTact(3);
  memVal = cpu.aluDecByte(memVal);
  cpu.incTact(1);
  cpu.writeMemory(addr, memVal);
  cpu.incTact(3);
}

// ld (ix+D),N
//
// The n operand is loaded to the memory address specified by the sum
// of IX and the two's complement displacement operand D.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 |
// =================================
// |            8-bit D            |
// =================================
// |            8-bit N            |
// =================================
// T-States: 4, 4, 3, 5, 3 (19)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 ×2,ii+n:3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:3
function LdIxiN(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();
  const offset = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  const val = cpu.readCodeMemory();
  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(2);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  cpu.writeMemory(addr, val);
  cpu.incTact(3);
}

// ld Q,xh
//
// The contents of XH are moved to register specified by Q
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 1 | Q | Q | Q | 1 | 0 | 0 |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function LdQXh(cpu: Z80Cpu): void {
  const q = (cpu.opCode & 0x38) >> 3;
  const ixVal = cpu.getIndexReg();
  cpu.setReg8(q, <u8>(ixVal >> 8));
}

// ld Q,xl
//
// The contents of XL are moved to register specified by Q
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 1 | Q | Q | Q | 1 | 0 | 0 |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=N/A, 101=N/A, 110=N/A, 111=A
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function LdQXl(cpu: Z80Cpu): void {
  const q = (cpu.opCode & 0x38) >> 3;
  const ixVal = cpu.getIndexReg();
  cpu.setReg8(q, <u8>ixVal);
}

// ld Q,(ix+D)
//
// The contents of IX summed with two's-complement displacement D
// is loaded to Q
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | Q | Q | Q | 1 | 1 | 0 |
// =================================
// |            8-bit D            |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=N/A, 101=N/A, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 3 (19)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+2:1 ×5,ii+n:3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:8,ii+n:3
function LdQIxi(cpu: Z80Cpu): void {
  const q = (cpu.opCode & 0x38) >> 3;
  const ixVal = cpu.getIndexReg();
  const offset = cpu.readCodeMemory();
  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  cpu.setReg8(q, cpu.readMemory(addr));
  cpu.incTact(3);
}

// ld (ix+D),Q
//
// The contents of Q are loaded to the memory address specified
// by the contents of IX summed with D, a two's-complement displacement
// integer.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 0 | 0 | 1 | 1 | 0 | Q | Q | Q |
// =================================
// |            8-bit D            |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=N/A, 101=N/A, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 3 (19)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+2:1 ×5,ii+n:3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:8,ii+n:3
function LdIxiQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const ixVal = cpu.getIndexReg();
  const offset = cpu.readCodeMemory();
  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  cpu.writeMemory(addr, cpu.getReg8(q));
  cpu.incTact(3);
}

// Executes one of the ADD, ADC, SUB, SBC, AND, XOR, OR, or CP
// operation for A and XH.
//
// The flags are set according to the ALU operation rules.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 1 | 0 | A | A | A | 1 | 0 | 0 |
// =================================
// A: 000=ADD, 001=ADC, 010=SUB, 011=SBC,
//    100=AND, 101=XOR, 110=OR, 111=CP
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function AluAXh(cpu: Z80Cpu): void {
  const ix = cpu.getIndexReg();
  const op = (cpu.opCode & 0x38) >> 3;
  const alg = aluAlgorithms[op];
  alg(cpu, <u8>(ix >> 8), cpu.cFlag);
}

// Executes one of the ADD, ADC, SUB, SBC, AND, XOR, OR, or CP
// operation for A and XL.
//
// The flags are set according to the ALU operation rules.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 1 | 0 | A | A | A | 1 | 0 | 0 |
// =================================
// A: 000=ADD, 001=ADC, 010=SUB, 011=SBC,
//    100=AND, 101=XOR, 110=OR, 111=CP
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function AluAXl(cpu: Z80Cpu): void {
  const ix = cpu.getIndexReg();
  const op = (cpu.opCode & 0x38) >> 3;
  const alg = aluAlgorithms[op];
  alg(cpu, <u8>ix, cpu.cFlag);
}

// Executes one of the ADD, ADC, SUB, SBC, AND, XOR, OR, or CP
// operation for A and the 8/bit value at the (IX+D) address
//
// The flags are set according to the ALU operation rules.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 1 | 0 | A | A | A | 1 | 1 | 0 |
// =================================
// |            8-bit D            |
// =================================
// T-States: 4, 4, 3, 5, 3 (19)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+2:1 ×5,ii+n:3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:8,ii+n:3
function AluAIxi(cpu: Z80Cpu): void {
  const ixVal = cpu.getIndexReg();
  const offset = cpu.readCodeMemory();
  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
    cpu.readMemory(cpu.pc);
    cpu.incTact(1);
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  const op = (cpu.opCode & 0x38) >> 3;
  const alg = aluAlgorithms[op];
  alg(cpu, cpu.readMemory(addr), cpu.cFlag);
  cpu.incTact(3);
}

// pop ix
//
// The top two bytes of the external memory last-in, first-out (LIFO)
// stack are popped to IX. SP holds the 16-bit address of the current
// top of the Stack. This instruction first loads to the low-order
// portion of IX the byte at the memory location corresponding to the
// contents of SP; then SP is incremented and the contents of the
// corresponding adjacent memory location are loaded to the high-order
// portion of IX. SP is incremented again.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 1 |
// =================================
// T-States: 4, 4, 3, 3 (14)
// Contention breakdown: pc:4,pc+1:4,sp:3,sp+1:3
function PopIx(cpu: Z80Cpu): void {
  let val = <u16>cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  val += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.setIndexReg(val);
}

// ex (sp),ix
//
// The low-order byte in IX is exchanged with the contents of the
// memory address specified by the contents of SP, and the
// high-order byte of IX is exchanged with the next highest memory
// address (SP+1).
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 |
// =================================
// T-States: 4, 4, 3, 4, 3, 5 (23)
// Contention breakdown: pc:4,pc+1:4,sp:3,sp+1:3,sp+1:1,sp+1(write):3,sp(write):3,sp(write):1 ×2
// Gate array contention breakdown: pc:4,pc+1:4,sp:3,sp+1:4,sp+1(write):3,sp(write):5
function ExSpiIx(cpu: Z80Cpu): void {
  let spOld = cpu.sp;
  const ix = cpu.getIndexReg();
  const l = cpu.readMemory(spOld);
  cpu.incTact(3);
  const h = cpu.readMemory(++spOld);
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(spOld);
    cpu.incTact(1);
  }
  cpu.writeMemory(spOld, <u8>(ix >> 8));
  cpu.incTact(3);
  cpu.writeMemory(--spOld, <u8>ix);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.incTact(3);
    cpu.readMemory(spOld);
    cpu.incTact(1);
    cpu.readMemory(spOld);
    cpu.incTact(1);
  }
  cpu.wz = ((<u16>h) << 8) | l;
  cpu.setIndexReg(cpu.wz);
}

// push ix
//
// The contents of IX are pushed to the external memory last-in,
// first-out (LIFO) stack. SP holds the 16-bit address of the
// current top of the Stack. This instruction first decrements SP
// and loads the high-order byte of IX to the memory address
// specified by SP; then decrements SP again and loads the low-order
// byte to the memory location corresponding to this new address
// in SP.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 1 |
// =================================
// T-States: 4, 5, 3, 3 (15)
// Contention breakdown: pc:4,pc+1:5,sp-1:3,sp-2:3
function PushIx(cpu: Z80Cpu): void {
  const ix = cpu.getIndexReg();
  cpu.sp--;
  cpu.incTact(1);
  cpu.writeMemory(cpu.sp, <u8>(ix >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>ix);
  cpu.incTact(3);
}

// jp (ix)
//
// The PC is loaded with the contents of IX. The next instruction
// is fetched from the location designated by the new contents of PC.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 1 |
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function JpIxi(cpu: Z80Cpu): void {
  cpu.pc = cpu.getIndexReg();
}

// ld sp,ix
//
// The 2-byte contents of IX are loaded to SP.
//
// =================================
// | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
// =================================
// | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 |
// =================================
// T-States: 4, 6 (10)
// Contention breakdown: pc:4,pc+1:6
function LdSpIx(cpu: Z80Cpu): void {
  cpu.sp = cpu.getIndexReg();
  cpu.incTact(2);
}

// ============================================================================
// Extended instructions

// swapnib
//
// Swaps the high and low nibbles of the Accummulator
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 23
// =================================
// | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 1 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function Swapnib(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.a = (cpu.a >> 4) | (cpu.a << 4);
}

// mirror
//
// Mirrors (reverses the order) of bits in the accumulator.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 24
// =================================
// | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function Mirror(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let newA: u8 = 0;
  let oldA = cpu.a;
  for (let i = 0; i < 8; i++) {
    newA <<= 1;
    newA |= oldA & 0x01;
    oldA >>= 1;
  }
  cpu.a = newA;
}

// test N
//
// Similar to CP, but performs an AND instead of a subtraction.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 27
// =================================
// | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 1 |
// =================================
// |               N               |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4,pc+1:3
function TestN(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  const value = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  const result = cpu.a & value;
  cpu.f = <u8>(aluLogOpFlags[result] | FlagsSetMask.H);
}

// bsla de,b
//
// Shifts DE left by the number of bits determined by bit 0..3 of B.
// No flags are modified.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 28
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function BslaDeB(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.de = cpu.de << (cpu.b & 0x0f);
}

// bsra de,b
//
// Shifts DE right by the number of bits determined by bit 0..3 of B.
// Bit 15 of DE remains unchanged.
// No flags are modified.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 29
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 1 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function BsraDeB(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.de = (cpu.de >> (cpu.b & 0x0f)) | (cpu.de & 0x8000);
}

// bsrl de,b
//
// Shifts DE right by the number of bits determined by bit 0..3 of B.
// Bit 15 of DE gets 0.
// No flags are modified.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 2a
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function BsrlDeB(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.de = cpu.de >> (cpu.b & 0x0f);
}

// bsrf de,b
//
// Shifts DE right by the number of bits determined by bit 0..3 of B.
// Shifts in 1s from the left
// No flags are modified.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 2a
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function BsrfDeB(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.de = ~(~cpu.de >> (cpu.b & 0x0f));
}

// brlc de,b
//
// Rotates DE left by the number of bits determined by bit 0..3 of B.
// Shifts in 1s from the left
// No flags are modified.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 2a
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function BrlcDeB(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.de = (cpu.de << (cpu.b & 0x0f)) | (cpu.de >> (16 - (cpu.b & 0x0f)));
}

// mul
//
// Multiplies D by E, storing 16 bit result into DE. Does not alter any flags.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 30
// =================================
// | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function Mul(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.de = <u16>cpu.d * cpu.e;
}

// add hl,a
//
// Adds the unsigned A register to register pair HL. Does not alter any flags.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 31
// =================================
// | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function AddHlA(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.hl += cpu.a;
}

// add de,a
//
// Adds the unsigned A register to register pair DE. Does not alter any flags.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 32
// =================================
// | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function AddDeA(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.de += cpu.a;
}

// add bc,a
//
// Adds the unsigned A register to register pair BC. Does not alter any flags.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 33
// =================================
// | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 1 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4
function AddBcA(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.bc += cpu.a;
}

// add hl,NN
//
// Adds the 16-bit NN value to register pair HL. Does not alter any flags.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 34
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4,3,3,2
function AddHlNN(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let value = <u16>cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  value += (<u16>cpu.readCodeMemory()) << 8;
  cpu.pc++;
  cpu.hl += value;
  cpu.incTact(5);
}

// add de,NN
//
// Adds the 16-bit NN value to register pair DE. Does not alter any flags.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 35
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 1 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4,3,3,2
function AddDeNN(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let value = <u16>cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  value += (<u16>cpu.readCodeMemory()) << 8;
  cpu.pc++;
  cpu.de += value;
  cpu.incTact(5);
}

// add bc,NN
//
// Adds the 16-bit NN value to register pair BC. Does not alter any flags.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 36
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4,3,3,2
function AddBcNN(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let value = <u16>cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  value += (<u16>cpu.readCodeMemory()) << 8;
  cpu.pc++;
  cpu.bc += value;
  cpu.incTact(5);
}

// in Q,(c)
//
// The contents of Register C are placed on the bottom half (A0
// through A7) of the address bus to select the I/O device at one
// of 256 possible ports. The contents of Register B are placed on
// the top half (A8 through A15) of the address bus at this time.
// Then one byte from the selected port is placed on the data bus
// and written to Register Q in the CPU.
//
// S is set if input data is negative; otherwise, it is reset.
// Z is set if input data is 0; otherwise, it is reset.
// H is reset.
// P/V is set if parity is even; otherwise, it is reset.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 40
// =================================
// | 0 | 1 | Q | Q | Q | 0 | 0 | 0 |
// =================================
// T-States: 4, 4, 4 (12)
// Contention breakdown: pc:4,pc+1:4,I/O
function InQCi(cpu: Z80Cpu): void {
  const q = (cpu.opCode >> 3) & 0x07;
  cpu.wz = cpu.bc + 1;
  const pval = cpu.readPort(cpu.bc);
  cpu.f = <u8>(aluLogOpFlags[pval] | (cpu.f & FlagsSetMask.C));
  if (q !== 6) {
    cpu.setReg8(q, pval);
  }
}

// out (c),Q
//
// The contents of Register C are placed on the bottom half (A0
// through A7) of the address bus to select the I/O device at one
// of 256 possible ports. The contents of Register B are placed on
// the top half (A8 through A15) of the address bus at this time.
// Then the byte contained in register B is placed on the data bus
// and written to the selected peripheral device.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 41
// =================================
// | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 |
// =================================
// T-States: 4, 4, 4 (12)
// Contention breakdown: pc:4,pc+1:4,I/O
function OutCiQ(cpu: Z80Cpu): void {
  const q = (cpu.opCode >> 3) & 0x07;
  cpu.wz = cpu.bc + 1;
  cpu.writePort(cpu.bc, q !== 6 ? cpu.getReg8(q) : 0);
}

// sbc hl,QQ
//
// The contents of the register pair QQ and the Carry Flag are
// subtracted from the contents of HL, and the result is stored
// in HL.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 12; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is set.
//  C is set if borrow; otherwise, it is reset.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | Q | Q | 0 | 0 | 1 | 0 |
// =================================
// QQ: 00=BC, 01=DE, 10=HL, 11=SP
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:11
function SbcHlQQ(cpu: Z80Cpu): void {
  cpu.wz = cpu.hl + 1;
  const cfVal: u32 = cpu.cFlag ? 1 : 0;
  var qq = (cpu.opCode & 0x30) >> 4;
  let flags = FlagsSetMask.N;
  flags |=
    ((<u32>(cpu.hl & 0x0fff) - <u32>(cpu.getReg16(qq) & 0x0fff) - cfVal) >> 8) &
    FlagsSetMask.H;
  let sbcVal = <u32>cpu.hl - <u32>cpu.getReg16(qq) - cfVal;
  if ((sbcVal & 0x10000) !== 0) {
    flags |= FlagsSetMask.C;
  }
  if ((sbcVal & 0xffff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  var signedSbc =
    <i32>(<i16>cpu.hl) - <i32>(<i16>cpu.getReg16(qq)) - <i32>cfVal;
  if (signedSbc < -0x8000 || signedSbc >= 0x8000) {
    flags |= FlagsSetMask.PV;
  }
  cpu.hl = <u16>sbcVal;
  cpu.f = <u8>(
    (flags | (cpu.h & (FlagsSetMask.S | FlagsSetMask.R3 | FlagsSetMask.R5)))
  );
  cpu.incTact(7);
}

// ld (NN),QQ
//
// The low-order byte of register pair QQ is loaded to memory address
// (NN); the upper byte is loaded to memory address(NN + 1).
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | Q | Q | 0 | 0 | 1 | 1 |
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// QQ: 00=BC, 01=DE, 10=HL, 11=SP
// T-States: 4, 4, 3, 3, 3, 3 (20)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,nn:3,nn+1:3
function LdNNiQQ(cpu: Z80Cpu): void {
  const l = <u16>cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  let addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz = addr + 1;
  const regVal = cpu.getReg16((cpu.opCode & 0x30) >> 4);
  cpu.writeMemory(addr, <u8>regVal);
  cpu.incTact(3);
  cpu.writeMemory(cpu.wz, <u8>(regVal >> 8));
  cpu.incTact(3);
}

// neg
//
// The contents of the Accumulator are negated (two's complement).
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if Accumulator was 80h before operation; otherwise, it is reset.
// N is set.
// C is set if Accumulator was not 00h before operation; otherwise, it is reset.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 |
// =================================
// T-States: 4, 4, 3, 3, 3, 3 (20)
// Contention breakdown: pc:4,pc+1:4
function Neg(cpu: Z80Cpu): void {
  const result = -(<i16>cpu.a);
  const lNibble = -(<i16>(cpu.a & 0x0f)) & 0x10;

  let flags = result & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3);
  flags |= FlagsSetMask.N;
  if ((result & 0xff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  if (cpu.a !== 0) {
    flags |= FlagsSetMask.C;
  }
  if (lNibble !== 0) {
    flags |= FlagsSetMask.H;
  }
  if (cpu.a === 0x80) {
    flags |= FlagsSetMask.PV;
  }
  cpu.f = <u8>flags;
  cpu.a = <u8>result;
}

// retn (reti)
//
// This instruction is used at the end of a nonmaskable interrupts
// service routine to restore the contents of PC. The state of IFF2
// is copied back to IFF1 so that maskable interrupts are enabled
// immediately following the RETN if they were enabled before the
// nonmaskable interrupt.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 1 |
// =================================
// T-States: 4, 4, 4, 3, 3 (14)
// Contention breakdown: pc:4,pc+1:4,sp:3,sp+1:3
function Retn(cpu: Z80Cpu): void {
  cpu.iff1 = cpu.iff2;
  let addr = <u16>cpu.readMemory(cpu.sp);
  cpu.incTact(3);
  cpu.sp++;
  addr += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.incTact(3);
  cpu.sp++;
  cpu.pc = addr;
  cpu.wz = addr;
}

// im N
//
// Sets Interrupt Mode to N
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | 0 | N | N | 1 | 1 | 0 |
// =================================
// N: 00=IM 0, 01=N/A 10=IM 1, 11=IM 2
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function ImN(cpu: Z80Cpu): void {
  let mode = (cpu.opCode & 0x18) >> 3;
  if (mode < 2) {
    mode = 1;
  }
  mode--;
  cpu.interruptMode = mode;
}

/// ld i,a / ld r,a
//
// The contents of A are loaded to I or R
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | 0 | R | 1 | 1 | 1 | 1 |
// =================================
// R: 0=I, 1=R
// T-States: 4, 5 (9)
// Contention breakdown: pc:4,pc+1:5
function LdXrA(cpu: Z80Cpu): void {
  if ((cpu.opCode & 0x08) === 0) {
    cpu.i = cpu.a;
  } else {
    cpu.r = cpu.a;
  }
  cpu.incTact(1);
}

/// adc hl,QQ
//
// The contents of register pair QQ are added with the Carry flag
// to the contents of HL, and the result is stored in HL.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// H is set if carry from bit 11; otherwise, it is reset.
// P/V is set if overflow; otherwise, it is reset.
// N is reset.
// C is set if carry from bit 15; otherwise, it is reset.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | Q | Q | 1 | 0 | 1 | 0 |
// =================================
// QQ: 00=BC, 01=DE, 10=HL, 11=SP
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:11
function AdcHlQQ(cpu: Z80Cpu): void {
  cpu.wz = cpu.hl + 1;
  const cfVal = <u32>cpu.cFlag ? 1 : 0;
  const qq = (cpu.opCode & 0x30) >> 4;
  let flags =
    ((<u32>(cpu.hl & 0x0fff) +
      <u32>(cpu.getReg16(qq) & 0x0fff) +
      <u32>(cpu.f & FlagsSetMask.C)) >>
      8) &
    FlagsSetMask.H &
    0xff;
  const adcVal =
    <u32>(cpu.hl & 0xffff) + <u32>(cpu.getReg16(qq) & 0xffff) + cfVal;
  if ((adcVal & 0x10000) !== 0) {
    flags |= FlagsSetMask.C;
  }
  if ((adcVal & 0xffff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  const signedAdc =
    <i32>(<i16>cpu.hl) + <i32>(<i16>cpu.getReg16(qq)) + <i32>cfVal;
  if (signedAdc < -0x8000 || signedAdc >= 0x8000) {
    flags |= FlagsSetMask.PV;
  }
  cpu.hl = <u16>adcVal;
  cpu.f = <u8>(
    (flags | (cpu.h & (FlagsSetMask.S | FlagsSetMask.R3 | FlagsSetMask.R5)))
  );
  cpu.incTact(7);
}

// ld qq,(NN)
//
// The contents of address (NN) are loaded to the low-order portion
// of register pair QQ, and the contents of (NN + 1) are loaded to
// the high-order portion of QQ.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | Q | Q | 1 | 0 | 1 | 1 |
// =================================
// |           8-bit L             |
// =================================
// |           8-bit H             |
// =================================
// QQ: 00=BC, 01=DE, 10=HL, 11=SP
// T-States: 4, 4, 3, 3, 3, 3 (20)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,nn:3,nn+1:3
function LdQQNNi(cpu: Z80Cpu): void {
  const addrl = <u16>cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  const addr = ((<u16>cpu.readCodeMemory()) << 8) | addrl;
  cpu.incTact(3);
  cpu.pc++;
  cpu.wz = addr + 1;
  const l = cpu.readMemory(addr);
  cpu.incTact(3);
  const h = cpu.readMemory(cpu.wz);
  cpu.incTact(3);
  cpu.setReg16((cpu.opCode & 0x30) >> 4, ((<u16>h) << 8) | (<u16>l));
}

/// ld a,i / ld a,r
//
// The contents of I or R are loaded to A
//
// S is set if the I Register is negative; otherwise, it is reset.
// Z is set if the I Register is 0; otherwise, it is reset.
// H is reset.
// P/V contains contents of IFF2.
// N is reset.
// C is not affected.
// If an interrupt occurs during execution of this instruction, the Parity flag contains a 0.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | 0 | R | 1 | 1 | 1 | 1 |
// =================================
// R: 0=I, 1=R
// T-States: 4, 5 (9)
// Contention breakdown: pc:4,pc+1:5
function LdAXr(cpu: Z80Cpu): void {
  const source = (cpu.opCode & 0x08) === 0 ? cpu.i : cpu.r;
  cpu.a = source;
  const flags =
    (cpu.f & FlagsSetMask.C) |
    (source & FlagsSetMask.R3R5) |
    (cpu.iff2 ? FlagsSetMask.PV : 0) |
    (source & 0x80) |
    (source === 0 ? FlagsSetMask.Z : 0);
  cpu.f = <u8>flags;
  cpu.incTact(1);
}

// rrd
//
// The contents of the low-order four bits (bits 3, 2, 1, and 0)
// of memory location (HL) are copied to the low-order four bits
// of A. The previous contents of the low-order four bits of A are
// copied to the high-order four bits(7, 6, 5, and 4) of location
// (HL); and the previous contents of the high-order four bits of
// (HL) are copied to the low-order four bits of (HL). The contents
// of the high-order bits of A are unaffected.
//
// S is set if A is negative after an operation; otherwise, it is reset.
// Z is set if A is 0 after an operation; otherwise, it is reset.
// H is reset.
// P/V is set if the parity of A is even after an operation; otherwise,
// it is reset.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | 1 | 0 | 0 | 1 | 1 | 1 |
// =================================
// T-States: 4, 4, 3, 4, 3 (18)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1 ×4,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:7,hl(write):3
function Rrd(cpu: Z80Cpu): void {
  const tmp = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }

  cpu.wz = cpu.hl + 1;
  cpu.writeMemory(cpu.hl, (cpu.a << 4) | (tmp >> 4));
  cpu.incTact(3);

  cpu.a = (cpu.a & 0xf0) | (tmp & 0x0f);
  cpu.f = <u8>(aluLogOpFlags[cpu.a] | (cpu.f & FlagsSetMask.C));
}

// rld
//
// The contents of the low-order four bits (bits 3, 2, 1, and 0)
// of the memory location (HL) are copied to the high-order four
// bits (7, 6, 5, and 4) of that same memory location; the previous
// contents of those high-order four bits are copied to the
// low-order four bits of A; and the previous contents of the
// low-order four bits of A are copied to the low-order four bits
// of memory location(HL). The contents of the high-order bits of A
// are unaffected.
//
// S is set if A is negative after an operation; otherwise, it is reset.
// Z is set if the A is 0 after an operation; otherwise, it is reset.
// H is reset.
// P/V is set if the parity of A is even after an operation; otherwise,
// it is reset.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 0 | 1 | 1 | 0 | 1 | 1 | 1 | 1 |
// =================================
// T-States: 4, 4, 3, 4, 3 (18)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1 ×4,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:7,hl(write):3
function Rld(cpu: Z80Cpu): void {
  const tmp = cpu.readMemory(cpu.hl);
  cpu.incTact(3);

  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }

  cpu.wz = cpu.hl + 1;
  cpu.writeMemory(cpu.hl, ((cpu.a & 0x0f) | (tmp << 4)) & 0xff);
  cpu.incTact(3);

  cpu.a = (cpu.a & 0xf0) | (tmp >> 4);
  cpu.f = <u8>(aluLogOpFlags[cpu.a] | (cpu.f & FlagsSetMask.C));
}

// push NN
//
// Pushes the 16-bit value to the stack
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 8A
// =================================
// | 1 | 0 | 0 | 0 | 1 | 0 | 1 | 0 |
// =================================
// |             N Low             |
// =================================
// |             N High            |
// =================================
// T-States: 4, 4, 3, 3, 3, 3 (20)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,sp-1:3,sp-2:3
function PushNN(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let value = <u16>cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  value += (<u16>cpu.readCodeMemory()) << 8;
  cpu.incTact(3);
  cpu.pc++;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(value >> 8));
  cpu.incTact(3);
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>value);
  cpu.incTact(3);
}

// outinb
//
// The contents of the HL register pair are placed on the address
// bus to select a location in memory. The byte contained in this
// memory location is temporarily stored in the CPU. Then, after B
// is decremented, the contents of C are placed on the bottom half
// (A0 through A7) of the address bus to select the I/O device at
// one of 256 possible ports. Register B is used as a byte counter,
// and its decremented value is placed on the top half (A8 through
// A15) of the address bus. The byte to be output is placed on the
// data bus and written to a selected peripheral device. Finally,
// the HL is incremented.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 91
// =================================
// | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 1 |
// =================================
// |           Register            |
// =================================
// |            Value              |
// =================================
// T-States: 4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,hl:3,I/O
function OutInB(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }

  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  // hl:3
  var val = cpu.readMemory(cpu.hl);
  cpu.incTact(3);

  // I/O
  cpu.writePort(cpu.bc, val);
  cpu.hl++;
}

/// nextreg reg,val
//
// Sets the specified 8-bit NEXT register to the
// provided 8-bit value
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 91
// =================================
// | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 1 |
// =================================
// |           Register            |
// =================================
// |            Value              |
// =================================
// T-States: 4, 4, 3, 3 (14)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3
function NextReg(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  const reg = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  const val = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.writeTbBlueIndex(reg);
  cpu.writeTbBlueValue(val);
}

// nextreg reg,A
//
// Sets the specified 8-bit NEXT register to the
// value of A.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 92
// =================================
// | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
// =================================
// |           Register            |
// =================================
// |            Value              |
// =================================
// T-States: 4, 4, 3 (11)
// Contention breakdown: pc:4,pc+1:4,pc+2:3
function NextRegA(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  const reg = cpu.readCodeMemory();
  cpu.incTact(3);
  cpu.pc++;
  cpu.writeTbBlueIndex(reg);
  cpu.writeTbBlueValue(cpu.a);
}

// pixeldn
//
// Updates the address in HL to move down by one line of pixels.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 93
// =================================
// | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function PixelDn(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }

  if ((cpu.h & 0x07) === 0x07) {
    if (cpu.l < 0xe0) {
      cpu.l += 0x20;
      cpu.h &= 0xf8;
    } else {
      cpu.l += 0x20;
      cpu.h++;
    }
  } else {
    cpu.hl += 0x0100;
  }
}

// pixelad
//
// Takes E and D as the X,Y coordinate of a point and
// calculates the address of the byte containing this
// pixel in the pixel area of standard ULA screen 0,
// storing it in HL.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 94
// =================================
// | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function PixelAd(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  const da = (<u16>0x4000) | (<u16>(cpu.e >> 3)) | ((<u16>cpu.d) << 5);
  cpu.hl =
    (da & 0xf81f) | // --- Reset V5, V4, V3, V2, V1
    ((da & 0x0700) >> 3) | // --- Keep V5, V4, V3 only
    ((da & 0x00e0) << 3); // --- Exchange the V2, V1, V0 bit
  // --- group with V5, V4, V3
}

// setae
//
// Takes the bit number to set from E (only the lower 3 bits)
// and sets that bit on A.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 95
// =================================
// | 1 | 0 | 0 | 1 | 0 | 1 | 0 | 1 |
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function SetAE(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.a = 0x80 >> (cpu.e & 0x07);
}

// jp (c)
//
// Sets bottom 14 bits of current PC to value read from I/O port:
// PC[13:0] = (IN (C) << 6) (can be used to execute code block read from a disk
// stream). "current PC" is address of next instruction after JP (C), as
// the PC is advanced by fetching op code from memory and is already advanced
// when execution happens - if the JP instruction resides at the very end of
// 16k memory block (..FE or ..FF address), then newly composed PC value will
// land into following 16k block.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED 98
// =================================
// | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 |
// =================================
// T-States: 4, 4, (8)
// Contention breakdown: pc:4,pc+1:4,3,2
function JpInC(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  cpu.wz = cpu.bc + 1;
  const pval = cpu.readPort(cpu.bc);
  cpu.pc = (cpu.pc & 0xc000) + ((<u16>pval) << 6);
  cpu.incTact(1);
}

// ldi
//
// A byte of data is transferred from the memory location addressed
// by the contents of HL to the memory location addressed by the
// contents of DE. Then both these register pairs are incremented
// and BC is decremented.
//
// S is not affected.
// Z is not affected.
// H is reset.
// P/V is set if BC – 1 is not 0; otherwise, it is reset.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
// =================================
// T-States: 4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3,de:1 ×2
// Gate array contention breakdown: pc:4,pc+1:4,hl:3,de:5
function Ldi(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl++);
  cpu.incTact(3);
  cpu.writeMemory(cpu.de, memVal);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.incTact(3);
    cpu.writeMemory(cpu.de, memVal);
    cpu.incTact(1);
    cpu.writeMemory(cpu.de, memVal);
    cpu.incTact(1);
  }
  cpu.de++;
  memVal += cpu.a;
  memVal = <u8>((memVal & FlagsSetMask.R3) | ((memVal << 4) & FlagsSetMask.R5));
  cpu.f = <u8>(
    ((cpu.f &
      ~(
        FlagsSetMask.N |
        FlagsSetMask.H |
        FlagsSetMask.PV |
        FlagsSetMask.R3 |
        FlagsSetMask.R5
      )) |
      memVal)
  );
  if (--cpu.bc !== 0) {
    cpu.f |= <u8>FlagsSetMask.PV;
  }
}

// cpi
//
// The contents of the memory location addressed by HL is compared
// with the contents of A. With a true compare, Z flag is
// set. Then HL is incremented and BC is decremented.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if A is (HL); otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if BC – 1 is not 0; otherwise, it is reset.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 1 |
// =================================
// T-States: 4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1 ×5
// Gate array contention breakdown: pc:4,pc+1:4,hl:8
function Cpi(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl);
  const compRes = cpu.a - memVal;
  let r3r5 = compRes;
  let flags = (cpu.f & FlagsSetMask.C) | FlagsSetMask.N;
  if ((((cpu.a & 0x0f) - (compRes & 0x0f)) & 0x10) !== 0) {
    flags |= FlagsSetMask.H;
    r3r5 = compRes - 1;
  }
  if ((compRes & 0xff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  flags |= compRes & FlagsSetMask.S;
  flags |= (r3r5 & FlagsSetMask.R3) | ((r3r5 << 4) & FlagsSetMask.R5);

  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.hl++;

  if (--cpu.bc !== 0) {
    flags |= FlagsSetMask.PV;
  }
  cpu.f = <u8>flags;
  cpu.wz++;
}

// ini
//
// The contents of Register C are placed on the bottom half (A0
// through A7) of the address bus to select the I/O device at one
// of 256 possible ports. Register B can be used as a byte counter,
// and its contents are placed on the top half (A8 through A15) of
// the address bus at this time. Then one byte from the selected
// port is placed on the data bus and written to the CPU. The
// contents of the HL register pair are then placed on the address
// bus and the input byte is written to the corresponding location
// of memory. Finally, B is decremented and HL is incremented.
//
// S is unknown.
// Z is set if B – 1 = 0; otherwise it is reset.
// H is unknown.
// P/V is unknown.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 0 | 0 | 0 | 1 | 0 |
// =================================
// T-States: 4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,I/O,hl:3
function Ini(cpu: Z80Cpu): void {
  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  // I/O
  cpu.wz = cpu.bc + 1;
  const val = cpu.readPort(cpu.bc);

  // hl:3
  cpu.writeMemory(cpu.hl, val);
  cpu.incTact(3);

  cpu.f |= <u8>FlagsSetMask.N;
  if (--cpu.b === 0) {
    cpu.f |= <u8>FlagsSetMask.Z;
  } else {
    cpu.f &= <u8>~FlagsSetMask.Z;
  }
  cpu.hl++;
}

// outi
//
// The contents of the HL register pair are placed on the address
// bus to select a location in memory. The byte contained in this
// memory location is temporarily stored in the CPU. Then, after B
// is decremented, the contents of C are placed on the bottom half
// (A0 through A7) of the address bus to select the I/O device at
// one of 256 possible ports. Register B is used as a byte counter,
// and its decremented value is placed on the top half (A8 through
// A15) of the address bus. The byte to be output is placed on the
// data bus and written to a selected peripheral device. Finally,
// the HL is incremented.
//
// S is unknown.
// Z is set if B – 1 = 0; otherwise it is reset.
// H is unknown.
// P/V is unknown.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 0 | 0 | 0 | 1 | 1 |
// =================================
// T-States: 4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,hl:3,I/O
function Outi(cpu: Z80Cpu): void {
  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  cpu.f |= <u8>FlagsSetMask.N;
  if (--cpu.b === 0) {
    cpu.f |= <u8>FlagsSetMask.Z;
  } else {
    cpu.f &= <u8>~FlagsSetMask.Z;
  }

  // hl:3
  const val = cpu.readMemory(cpu.hl);
  cpu.incTact(3);

  // I/O
  cpu.writePort(cpu.bc, val);

  cpu.hl++;
  cpu.wz = cpu.bc + 1;
}

// ldix
//
// A byte of data is transferred from the memory location addressed
// by the contents of HL to the memory location addressed by the
// contents of DE, provided, the data does not equal with A.
// Then both these register pairs are incremented and BC is decremented.
//
// No flags are affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED A4
// =================================
// | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
// =================================
// T-States: 4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:5
function Ldix(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let memVal = cpu.readMemory(cpu.hl++);
  cpu.incTact(3);
  if (cpu.a !== memVal) {
    cpu.writeMemory(cpu.de, memVal);
  }
  cpu.incTact(5);
  cpu.de++;
  cpu.bc--;
}

// ldws
//
// Copies the byte pointed to by HL to the address pointed to by DE and increments
// only L and D.
//
// The flags are identical to what the INC D instruction would produce.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED A4
// =================================
// | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
// =================================
// T-States: 4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3
function Ldws(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  const val = cpu.readMemory(cpu.hl);
  cpu.incTact(3);
  cpu.writeMemory(cpu.de, val);
  cpu.incTact(3);
  cpu.l++;
  cpu.f = incOpFlags[cpu.d] | (<u8>(cpu.f & FlagsSetMask.C));
  cpu.d++;
}

// ldd
//
// Transfers a byte of data from the memory location addressed by
// HL to the memory location addressed by DE. Then DE, HL, and BC
// is decremented.
//
// S is not affected.
// Z is not affected.
// H is reset.
// P/V is set if BC – 1 is not 0; otherwise, it is reset.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 0 |
// =================================
// T-States: 4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3,de:1 ×2
// Gate array contention breakdown: pc:4,pc+1:4,hl:3,de:5
function Ldd(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl--);
  cpu.incTact(3);
  cpu.writeMemory(cpu.de, memVal);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.incTact(3);
    cpu.writeMemory(cpu.de, memVal);
    cpu.incTact(1);
    cpu.writeMemory(cpu.de, memVal);
    cpu.incTact(1);
  }
  cpu.de--;
  memVal += cpu.a;
  memVal = <u8>((memVal & FlagsSetMask.R3) | ((memVal << 4) & FlagsSetMask.R5));
  cpu.f = <u8>(
    ((cpu.f &
      ~(
        FlagsSetMask.N |
        FlagsSetMask.H |
        FlagsSetMask.PV |
        FlagsSetMask.R3 |
        FlagsSetMask.R5
      )) |
      memVal)
  );
  if (--cpu.bc !== 0) {
    cpu.f |= <u8>FlagsSetMask.PV;
  }
}

// cpd
//
// The contents of the memory location addressed by HL is compared
// with the contents of A. During the compare operation, the Zero
// flag is set or reset. HL and BC are decremented.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if A is (HL); otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if BC – 1 is not 0; otherwise, it is reset.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 1 |
// =================================
// T-States: 4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1 ×5
// Gate array contention breakdown: pc:4,pc+1:4,hl:8
function Cpd(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl);
  const compRes = cpu.a - memVal;
  let r3r5 = compRes;
  let flags = (cpu.f & FlagsSetMask.C) | FlagsSetMask.N;
  if ((((cpu.a & 0x0f) - (compRes & 0x0f)) & 0x10) !== 0) {
    flags |= FlagsSetMask.H;
    r3r5 = compRes - 1;
  }
  if (compRes === 0) {
    flags |= FlagsSetMask.Z;
  }
  flags |= compRes & FlagsSetMask.S;
  flags |= (r3r5 & FlagsSetMask.R3) | ((r3r5 << 4) & FlagsSetMask.R5);

  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.hl--;

  if (--cpu.bc !== 0) {
    flags |= FlagsSetMask.PV;
  }
  cpu.f = <u8>flags;
  cpu.wz--;
}

// ind
//
// The contents of C are placed on the bottom half (A0 through A7)
// of the address bus to select the I/O device at one of 256
// possible ports. Register B is used as a byte counter, and its
// contents are placed on the top half (A8 through A15) of the
// address bus at this time. Then one byte from the selected port
// is placed on the data bus and written to the CPU. The contents
// of HL are placed on the address bus and the input byte is written
// to the corresponding location of memory. Finally, B and HLL are
// decremented.
//
// S is unknown.
// Z is set if B – 1 = 0; otherwise it is reset.
// H is unknown.
// P/V is unknown.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
// =================================
// T-States: 4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,I/O,hl:3
function Ind(cpu: Z80Cpu): void {
  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  cpu.wz = cpu.bc - 1;

  // I/O
  const val = cpu.readPort(cpu.bc);

  // hl:3
  cpu.writeMemory(cpu.hl, val);
  cpu.incTact(3);

  cpu.f |= <u8>FlagsSetMask.N;
  if (--cpu.b === 0) {
    cpu.f |= <u8>FlagsSetMask.Z;
  } else {
    cpu.f &= <u8>~FlagsSetMask.Z;
  }

  cpu.hl--;
}

// outd
//
// The contents of the HL register pair are placed on the address
// bus to select a location in memory. The byte contained in this
// memory location is temporarily stored in the CPU. Then, after B
// is decremented, the contents of C are placed on the bottom half
// (A0 through A7) of the address bus to select the I/O device at
// one of 256 possible ports. Register B is used as a byte counter,
// and its decremented value is placed on the top half (A8 through
// A15) of the address bus. The byte to be output is placed on the
// data bus and written to a selected peripheral device. Finally,
// the HL is decremented.
//
// S is unknown.
// Z is set if B – 1 = 0; otherwise it is reset.
// H is unknown.
// P/V is unknown.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 1 |
// =================================
// T-States: 4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,hl:3,I/O
function Outd(cpu: Z80Cpu): void {
  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  cpu.f = decOpFlags[cpu.b];
  cpu.f |= <u8>FlagsSetMask.N;
  if (--cpu.b === 0) {
    cpu.f |= <u8>FlagsSetMask.Z;
  } else {
    cpu.f &= <u8>~FlagsSetMask.Z;
  }

  // hl:3
  const val = cpu.readMemory(cpu.hl);
  cpu.incTact(3);

  // I/O
  cpu.writePort(cpu.bc, val);

  cpu.hl--;
  cpu.wz = cpu.bc - 1;
}

// lddx
//
// Transfers a byte of data from the memory location addressed by
// HL to the memory location addressed by DE, provided, it is not
// equal with A. Then DE, HL, and BC is decremented.
//
// No flags affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED AC
// =================================
// | 1 | 0 | 1 | 0 | 1 | 1 | 0 | 0 |
// =================================
// T-States: 4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3,de:1 ×2
// Gate array contention breakdown: pc:4,pc+1:4,hl:3,de:5
function Lddx(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let memVal = cpu.readMemory(cpu.hl--);
  cpu.incTact(3);
  if (cpu.a !== memVal) {
    cpu.writeMemory(cpu.de, memVal);
  }
  cpu.incTact(3);
  cpu.incTact(2);
  cpu.de--;
  cpu.bc--;
}

// ldir
//
// Transfers a byte of data from the memory location addressed by
// HL to the memory location addressed DE. Then HL and DE are
// incremented. BC is decremented. If decrementing allows the BC
// to go to 0, the instruction is terminated. If BC isnot 0,
// the program counter is decremented by two and the instruction
// is repeated. Interrupts are recognized and two refresh cycles
// are executed after each data transfer. When the BC is set to 0
// prior to instruction execution, the instruction loops
// through 64 KB.
//
// S is not affected.
// Z is not affected.
// H is reset.
// P/V is set if BC – 1 is not 0; otherwise, it is reset.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
// =================================
// T-States:
// BC!=0: 4, 4, 3, 5, 5 (21)
// BC=0:  4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3,de:1 ×2,[de:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:4,hl:3,de:5,[5]
function Ldir(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl++);
  cpu.incTact(3);
  cpu.writeMemory(cpu.de, memVal);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.incTact(3);
    cpu.writeMemory(cpu.de, memVal);
    cpu.incTact(1);
    cpu.writeMemory(cpu.de, memVal);
    cpu.incTact(1);
  }
  cpu.de++;
  memVal += cpu.a;
  memVal = <u8>((memVal & FlagsSetMask.R3) | ((memVal << 4) & FlagsSetMask.R5));
  cpu.f = <u8>(
    ((cpu.f &
      ~(
        FlagsSetMask.N |
        FlagsSetMask.H |
        FlagsSetMask.PV |
        FlagsSetMask.R3 |
        FlagsSetMask.R5
      )) |
      memVal)
  );
  if (--cpu.bc === 0) {
    return;
  }

  cpu.f |= <u8>FlagsSetMask.PV;
  cpu.pc -= 2;
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.de - 1);
    cpu.incTact(1);
    cpu.readMemory(cpu.de - 1);
    cpu.incTact(1);
    cpu.readMemory(cpu.de - 1);
    cpu.incTact(1);
    cpu.readMemory(cpu.de - 1);
    cpu.incTact(1);
    cpu.readMemory(cpu.de - 1);
    cpu.incTact(1);
  }
  cpu.wz = cpu.pc + 1;
}

// cpir
//
// The contents of the memory location addressed HL is compared with
// the contents of A. During a compare operation, the Zero flag is
// set or reset. Then HL is incremented and BC is decremented.
// If decrementing causes BC to go to 0 or if A = (HL), the
/// instruction is terminated. If BC is not 0 and A is not equal
/// (HL), the program counter is decremented by two and the
/// instruction is repeated. Interrupts are recognized and two
/// refresh cycles are executed after each data transfer. If BC is set
/// to 0 before instruction execution, the instruction loops through
/// 64 KB if no match is found.
///
/// S is set if result is negative; otherwise, it is reset.
/// Z is set if A is (HL); otherwise, it is reset.
/// H is set if borrow from bit 4; otherwise, it is reset.
/// P/V is set if BC – 1 is not 0; otherwise, it is reset.
/// N is set.
/// C is not affected.
///
/// =================================
/// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
/// =================================
/// | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
/// =================================
/// T-States:
/// BC!=0: 4, 4, 3, 5, 5 (21)
/// BC=0:  4, 4, 3, 5 (16)
/// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1 ×5,[hl:1 ×5]
/// Gate array contention breakdown: pc:4,pc+1:4,hl:8,[5]
function Cpir(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl);
  const compRes = cpu.a - memVal;
  let r3r5 = compRes;
  let flags = (cpu.f & FlagsSetMask.C) | FlagsSetMask.N;
  if ((((cpu.a & 0x0f) - (compRes & 0x0f)) & 0x10) !== 0) {
    flags |= FlagsSetMask.H;
    r3r5 = compRes - 1;
  }
  if (compRes === 0) {
    flags |= FlagsSetMask.Z;
  }
  flags |= compRes & FlagsSetMask.S;
  flags |= (r3r5 & FlagsSetMask.R3) | ((r3r5 << 4) & FlagsSetMask.R5);

  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.hl++;

  if (--cpu.bc !== 0) {
    flags |= FlagsSetMask.PV;
    if ((flags & FlagsSetMask.Z) === 0) {
      cpu.pc -= 2;
      if (cpu.useGateArrayContention) {
        cpu.incTact(5);
      } else {
        cpu.readMemory(cpu.hl - 1);
        cpu.incTact(1);
        cpu.readMemory(cpu.hl - 1);
        cpu.incTact(1);
        cpu.readMemory(cpu.hl - 1);
        cpu.incTact(1);
        cpu.readMemory(cpu.hl - 1);
        cpu.incTact(1);
        cpu.readMemory(cpu.hl - 1);
        cpu.incTact(1);
      }
      cpu.wz = cpu.pc + 1;
    }
  }
  cpu.f = <u8>flags;
}

// inir
//
// The contents of Register C are placed on the bottom half (A0
// through A7) of the address bus to select the I/O device at one
// of 256 possible ports. Register B can be used as a byte counter,
// and its contents are placed on the top half (A8 through A15) of
// the address bus at this time. Then one byte from the selected
// port is placed on the data bus and written to the CPU. The
// contents of the HL register pair are then placed on the address
// bus and the input byte is written to the corresponding location
// of memory. Finally, B is decremented and HL is incremented.
// If decrementing causes B to go to 0, the instruction is terminated.
// If B is not 0, PC is decremented by two and the instruction
// repeated. Interrupts are recognized and two refresh cycles
// execute after each data transfer.
//
// S is unknown.
// Z is set if B – 1 = 0; otherwise it is reset.
// H is unknown.
// P/V is unknown.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 1 | 0 | 0 | 1 | 0 |
// =================================
// T-States:
// BC!=0: 4, 5, 3, 4, 5 (21)
// BC=0:  4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,I/O,hl:3,[hl:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:5,I/O,hl:3,[5]
function Inir(cpu: Z80Cpu): void {
  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  // I/O
  cpu.wz = cpu.bc + 1;
  const val = cpu.readPort(cpu.bc);

  // hl:3
  cpu.writeMemory(cpu.hl, val);
  cpu.incTact(3);

  cpu.f = <u8>(decOpFlags[cpu.b] | (cpu.f & FlagsSetMask.C));
  cpu.b--;
  cpu.hl++;

  if (cpu.b !== 0) {
    cpu.f |= <u8>FlagsSetMask.PV;
    cpu.pc -= 2;
    if (cpu.useGateArrayContention) {
      cpu.incTact(5);
    } else {
      cpu.readMemory(cpu.hl - 1);
      cpu.incTact(1);
      cpu.readMemory(cpu.hl - 1);
      cpu.incTact(1);
      cpu.readMemory(cpu.hl - 1);
      cpu.incTact(1);
      cpu.readMemory(cpu.hl - 1);
      cpu.incTact(1);
      cpu.readMemory(cpu.hl - 1);
      cpu.incTact(1);
    }
  } else {
    cpu.f &= <u8>~FlagsSetMask.PV;
  }
}

// otir
//
// The contents of the HL register pair are placed on the address
// bus to select a location in memory. The byte contained in this
// memory location is temporarily stored in the CPU. Then, after B
// is decremented, the contents of C are placed on the bottom half
// (A0 through A7) of the address bus to select the I/O device at
// one of 256 possible ports. Register B is used as a byte counter,
// and its decremented value is placed on the top half (A8 through
// A15) of the address bus. The byte to be output is placed on the
// data bus and written to a selected peripheral device. Finally,
// the HL is incremented.
// If the decremented B Register is not 0, PC is decremented by two
// and the instruction is repeated. If B has gone to 0, the
// instruction is terminated. Interrupts are recognized and two
// refresh cycles are executed after each data transfer.
//
// S is unknown.
// Z is set if B – 1 = 0; otherwise it is reset.
// H is unknown.
// P/V is unknown.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 1 | 0 | 0 | 1 | 1 |
// =================================
// T-States:
// BC!=0: 4, 5, 3, 4, 5 (21)
// BC=0:  4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,hl:3,I/O,[bc:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:5,hl:3,I/O,[5]
function Otir(cpu: Z80Cpu): void {
  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  cpu.f = decOpFlags[cpu.b];
  cpu.b--;

  // hl:3
  const val = cpu.readMemory(cpu.hl++);
  cpu.incTact(3);

  // I/O
  cpu.writePort(cpu.bc, val);

  if (cpu.b !== 0) {
    cpu.f |= <u8>FlagsSetMask.PV;
    cpu.pc -= 2;
    if (cpu.useGateArrayContention) {
      cpu.incTact(5);
    } else {
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
    }
  } else {
    cpu.f &= <u8>~FlagsSetMask.PV;
  }
  cpu.f &= <u8>~FlagsSetMask.C;
  if (cpu.l === 0) {
    cpu.f |= <u8>FlagsSetMask.C;
  }
  cpu.wz = cpu.bc + 1;
}

// LDIRX
//
// Transfers a byte of data from the memory location addressed by
// HL to the memory location addressed DE, provided the data is
// not equal wioth A. Then HL and DE are
// incremented. BC is decremented. If decrementing allows the BC
// to go to 0, the instruction is terminated. If BC isnot 0,
// the program counter is decremented by two and the instruction
// is repeated. Interrupts are recognized and two refresh cycles
// are executed after each data transfer. When the BC is set to 0
// prior to instruction execution, the instruction loops
// through 64 KB.
//
// No flags affected
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
// =================================
// T-States:
// BC!=0: 4, 4, 3, 5, 5 (21)
// BC=0:  4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3,de:5,[de:3]
// Gate array contention breakdown: pc:4,pc+1:4,hl:3,de:5,[5]
function Ldirx(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let memVal = cpu.readMemory(cpu.hl++);
  cpu.incTact(3);
  if (cpu.a !== memVal) {
    cpu.writeMemory(cpu.de, memVal);
  }
  cpu.incTact(5);
  cpu.de++;
  if (--cpu.bc === 0) {
    return;
  }
  cpu.pc -= 2;
  cpu.incTact(5);
  cpu.wz = cpu.pc + 1;
}

// ldpirx
//
// Similar to LDIRX except the source byte address is not just HL, but is
// obtained by using the top 13 bits of HL and the lower 3 bits of DE and
// HL does not increment during whole loop (HL works as base address of
// aligned 8 byte lookup table, DE works as destination and also wrapping
// index 0..7 into table). This is intended for "pattern fill" functionality.
//
// No flags affected.
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED B7
// =================================
// | 1 | 0 | 1 | 1 | 0 | 1 | 1 | 1 |
// =================================
// T-States:
// BC!=0: 4, 4, 3, 5, 5 (21)
// BC=0:  4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3,de:5,[de:3]
function Ldpirx(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let memVal = cpu.readMemory((cpu.hl & 0xfff8) + (cpu.e & 0x07));
  cpu.incTact(3);
  if (cpu.a !== memVal) {
    cpu.writeMemory(cpu.de, memVal);
  }
  cpu.incTact(5);
  cpu.de++;
  if (--cpu.bc === 0) {
    return;
  }
  cpu.pc -= 2;
  cpu.incTact(5);
  cpu.wz = cpu.pc + 1;
}

// lddr
//
// Transfers a byte of data from the memory location addressed by
// HL to the memory location addressed by DE. Then DE, HL, and BC
// is decremented.
// If decrementing causes BC to go to 0, the instruction is
// terminated. If BC is not 0, PC is decremented by two and the
// instruction is repeated. Interrupts are recognized and two
// refresh cycles execute after each data transfer.
// When BC is set to 0, prior to instruction execution, the
// instruction loops through 64 KB.
//
// S is not affected.
// Z is not affected.
// H is reset.
// P/V is set if BC – 1 is not 0; otherwise, it is reset.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |
// =================================
// T-States:
// BC!=0: 4, 4, 3, 5, 5 (21)
// BC=0:  4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3,de:1 ×2,[de:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:4,hl:3,de:5,[5]
function Lddr(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl--);
  cpu.incTact(3);
  cpu.writeMemory(cpu.de, memVal);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.incTact(3);
    cpu.writeMemory(cpu.de, memVal);
    cpu.incTact(1);
    cpu.writeMemory(cpu.de, memVal);
    cpu.incTact(1);
  }
  cpu.de--;
  memVal += cpu.a;
  memVal = <u8>((memVal & FlagsSetMask.R3) | ((memVal << 4) & FlagsSetMask.R5));
  cpu.f = <u8>(
    ((cpu.f &
      ~(
        FlagsSetMask.N |
        FlagsSetMask.H |
        FlagsSetMask.PV |
        FlagsSetMask.R3 |
        FlagsSetMask.R5
      )) |
      memVal)
  );
  if (--cpu.bc === 0) {
    return;
  }
  cpu.f |= <u8>FlagsSetMask.PV;
  cpu.pc -= 2;
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.de + 1);
    cpu.incTact(1);
    cpu.readMemory(cpu.de + 1);
    cpu.incTact(1);
    cpu.readMemory(cpu.de + 1);
    cpu.incTact(1);
    cpu.readMemory(cpu.de + 1);
    cpu.incTact(1);
    cpu.readMemory(cpu.de + 1);
    cpu.incTact(1);
  }
  cpu.wz = cpu.pc + 1;
}

// cpdr
//
// The contents of the memory location addressed by HL is compared
// with the contents of A. During the compare operation, the Zero
// flag is set or reset. HL and BC are decremented.
// If BC is not 0 and A = (HL), PC is decremented by two and the
// instruction is repeated. Interrupts are recognized and two
// refresh cycles execute after each data transfer. When the BC is
// set to 0, prior to instruction execution, the instruction loops
// through 64 KB if no match is found.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if A is (HL); otherwise, it is reset.
// H is set if borrow from bit 4; otherwise, it is reset.
// P/V is set if BC – 1 is not 0; otherwise, it is reset.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 1 | 1 | 0 | 0 | 1 |
// =================================
// T-States:
// BC!=0: 4, 4, 3, 5, 5 (21)
// BC=0:  4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1 ×5,[hl:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:4,hl:8,[5]
function Cpdr(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl);
  const compRes = cpu.a - memVal;
  let r3r5 = compRes;
  let flags = (cpu.f & FlagsSetMask.C) | FlagsSetMask.N;
  if ((((cpu.a & 0x0f) - (compRes & 0x0f)) & 0x10) !== 0) {
    flags |= FlagsSetMask.H;
    r3r5 = compRes - 1;
  }
  if (compRes === 0) {
    flags |= FlagsSetMask.Z;
  }
  flags |= compRes & FlagsSetMask.S;
  flags |= (r3r5 & FlagsSetMask.R3) | ((r3r5 << 4) & FlagsSetMask.R5);

  cpu.incTact(3);
  if (cpu.useGateArrayContention) {
    cpu.incTact(5);
  } else {
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.hl--;

  if (--cpu.bc !== 0) {
    flags |= FlagsSetMask.PV;
    if ((flags & FlagsSetMask.Z) === 0) {
      cpu.pc -= 2;
      if (cpu.useGateArrayContention) {
        cpu.incTact(5);
      } else {
        cpu.readMemory(cpu.hl + 1);
        cpu.incTact(1);
        cpu.readMemory(cpu.hl + 1);
        cpu.incTact(1);
        cpu.readMemory(cpu.hl + 1);
        cpu.incTact(1);
        cpu.readMemory(cpu.hl + 1);
        cpu.incTact(1);
        cpu.readMemory(cpu.hl + 1);
        cpu.incTact(1);
      }
      cpu.wz = cpu.pc + 1;
    }
  }
  cpu.f = <u8>flags;
}

// indr
//
// The contents of C are placed on the bottom half (A0 through A7)
// of the address bus to select the I/O device at one of 256
// possible ports. Register B is used as a byte counter, and its
// contents are placed on the top half (A8 through A15) of the
// address bus at this time. Then one byte from the selected port
// is placed on the data bus and written to the CPU. The contents
// of HL are placed on the address bus and the input byte is written
// to the corresponding location of memory. Finally, B and HL are
// decremented.
// If decrementing causes B to go to 0, the instruction is
// terminated. If B is not 0, PC is decremented by two and the
// instruction repeated. Interrupts are recognized and two refresh
// cycles are executed after each data transfer.
//
// S is unknown.
// Z is set if B – 1 = 0; otherwise it is reset.
// H is unknown.
// P/V is unknown.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 1 | 1 | 0 | 1 | 0 |
// =================================
// T-States:
// BC!=0: 4, 5, 3, 4, 5 (21)
// BC=0:  4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,I/O,hl:3,[hl:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:5,I/O,hl:3,[5]
function Indr(cpu: Z80Cpu): void {
  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  cpu.wz = cpu.bc - 1;

  // I/O
  const val = cpu.readPort(cpu.bc);

  // hl:3
  cpu.writeMemory(cpu.hl, val);
  cpu.incTact(3);

  cpu.f = <u8>(decOpFlags[cpu.b] | (cpu.f & FlagsSetMask.C));
  cpu.b--;
  cpu.hl--;

  if (cpu.b !== 0) {
    cpu.f |= <u8>FlagsSetMask.PV;
    cpu.pc -= 2;
    if (cpu.useGateArrayContention) {
      cpu.incTact(5);
    } else {
      cpu.readMemory(cpu.hl + 1);
      cpu.incTact(1);
      cpu.readMemory(cpu.hl + 1);
      cpu.incTact(1);
      cpu.readMemory(cpu.hl + 1);
      cpu.incTact(1);
      cpu.readMemory(cpu.hl + 1);
      cpu.incTact(1);
      cpu.readMemory(cpu.hl + 1);
      cpu.incTact(1);
    }
  } else {
    cpu.f &= <u8>~FlagsSetMask.PV;
  }
}

// otdr
//
// The contents of the HL register pair are placed on the address
// bus to select a location in memory. The byte contained in this
// memory location is temporarily stored in the CPU. Then, after B
// is decremented, the contents of C are placed on the bottom half
// (A0 through A7) of the address bus to select the I/O device at
// one of 256 possible ports. Register B is used as a byte counter,
// and its decremented value is placed on the top half (A8 through
// A15) of the address bus. The byte to be output is placed on the
// data bus and written to a selected peripheral device. Finally,
// the HL is decremented.
// If the decremented B Register is not 0, PC is decremented by
// two and the instruction is repeated. If B has gone to 0, the
// instruction is terminated. Interrupts are recognized and two
// refresh cycles are executed after each data transfer.
//
// S is unknown.
// Z is set if B – 1 = 0; otherwise it is reset.
// H is unknown.
// P/V is unknown.
// N is set.
// C is not affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED
// =================================
// | 1 | 0 | 1 | 1 | 1 | 0 | 1 | 1 |
// =================================
// T-States:
// BC!=0: 4, 5, 3, 4, 5 (21)
// BC=0:  4, 5, 3, 4 (16)
// Contention breakdown: pc:4,pc+1:5,hl:3,I/O,[bc:1 ×5]
// Gate array contention breakdown: pc:4,pc+1:5,hl:3,I/O,[5]
function Otdr(cpu: Z80Cpu): void {
  // pc+1:5 -> remaining 1
  cpu.incTact(1);

  cpu.f = decOpFlags[cpu.b];
  cpu.b--;

  // hl:3
  const val = cpu.readMemory(cpu.hl--);
  cpu.incTact(3);

  // I/O
  cpu.writePort(cpu.bc, val);

  if (cpu.b !== 0) {
    cpu.f |= <u8>FlagsSetMask.PV;
    cpu.pc -= 2;
    if (cpu.useGateArrayContention) {
      cpu.incTact(5);
    } else {
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
      cpu.readMemory(cpu.bc);
      cpu.incTact(1);
    }
  } else {
    cpu.f &= <u8>~FlagsSetMask.PV;
  }
  cpu.f &= <u8>~FlagsSetMask.C;
  if (cpu.l === 0xff) {
    cpu.f |= <u8>FlagsSetMask.C;
  }
  cpu.wz = cpu.bc - 1;
}

// lddrx
// </summary>
// <remarks>
//
// Transfers a byte of data from the memory location addressed by
// HL to the memory location addressed by DE, provided the data
// is not equal with A. Then DE, HL, and BC is decremented.
// If decrementing causes BC to go to 0, the instruction is
// terminated. If BC is not 0, PC is decremented by two and the
// instruction is repeated. Interrupts are recognized and two
// refresh cycles execute after each data transfer.
// When BC is set to 0, prior to instruction execution, the
// instruction loops through 64 KB.
//
// No flags affected.
//
// =================================
// | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | ED BC
// =================================
// | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 |
// =================================
// T-States:
// BC!=0: 4, 4, 3, 5, 5 (21)
// BC=0:  4, 4, 3, 5 (16)
// Contention breakdown: pc:4,pc+1:4,hl:3,de:3,de:3,[de:5]
// Gate array contention breakdown: pc:4,pc+1:4,hl:3,de:5,[5]
function Lddrx(cpu: Z80Cpu): void {
  if (!cpu.allowExtendedInstructionSet) {
    return;
  }
  let memVal = cpu.readMemory(cpu.hl--);
  cpu.incTact(3);
  if (cpu.a !== memVal) {
    cpu.writeMemory(cpu.de, memVal);
  }
  cpu.incTact(5);
  cpu.de--;
  if (--cpu.bc === 0) {
    return;
  }
  cpu.pc -= 2;
  cpu.incTact(5);
  cpu.wz = cpu.pc + 1;
}

// ============================================================================
// Bit instructions

// rlc Q
//
// The contents of register Q are rotated left 1 bit position. The
// contents of bit 7 are copied to the Carry flag and also to bit 0.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 7 of the original register value.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 0 | 0 | 0 | Q | Q | Q | 0x00
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function RlcQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const rlcVal = cpu.getReg8(q);
  cpu.setReg8(q, rolOpResults[rlcVal]);
  cpu.f = rlcFlags[rlcVal];
}

// rlc (hl)
//
// The contents of the memory address specified by the contents
// of HL are rotated left 1 bit position.The contents of bit 7
// are copied to the Carry flag and also to bit 0.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 7 of the source byte.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0x06
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function RlcHli(cpu: Z80Cpu): void {
  const rlcVal = cpu.readMemory(cpu.hl);
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, rolOpResults[rlcVal]);
  cpu.incTact(3);
  cpu.f = rlcFlags[rlcVal];
}

// rrc Q
//
// The contents of register Q are rotated right 1 bit position.
// The contents of bit 0 are copied to the Carry flag and also
// to bit 7.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 0 of the original register value.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 0 | 0 | 1 | Q | Q | Q | 0x08, ...
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function RrcQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const rrcVal = cpu.getReg8(q);
  cpu.setReg8(q, rorOpResults[rrcVal]);
  cpu.f = rrcFlags[rrcVal];
}

// rrc (hl)
//
// The contents of the memory address specified by the contents
// of HL are rotated right 1 bit position. The contents of bit 0
// are copied to the Carry flag and also to bit 7.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 0 of the source byte.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0 | 0x0E
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function RrcHli(cpu: Z80Cpu): void {
  const rrcVal = cpu.readMemory(cpu.hl);
  cpu.f = rrcFlags[rrcVal];
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, rorOpResults[rrcVal]);
  cpu.incTact(3);
}

// rl Q
///
// The contents of Register Q are rotated left 1 bit position. The
// contents of bit 7 are copied to the Carry flag, and the previous
// contents of the Carry flag are copied to bit 0.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of the original register value.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 0 | 1 | 0 | Q | Q | Q | 0x10, ...
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function RlQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const rlVal = cpu.getReg8(q);
  if (cpu.cFlag) {
    cpu.f = rlCarry1Flags[rlVal];
    cpu.setReg8(q, (rlVal << 1) + 1);
  } else {
    cpu.f = rlCarry0Flags[rlVal];
    cpu.setReg8(q, rlVal << 1);
  }
}

// rl (hl)
//
// The contents of the memory address specified by the contents
// of HL are rotated left 1 bit position. The contents of bit 7
// are copied to the Carry flag, and the previous contents of the
// Carry flag are copied to bit 0.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of the source byte.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 0 | 1 | 0 | 1 | 1 | 0 | 0x16
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function RlHli(cpu: Z80Cpu): void {
  var rlVal = cpu.readMemory(cpu.hl);
  if (cpu.cFlag) {
    cpu.f = rlCarry1Flags[rlVal];
    rlVal = (rlVal << 1) + 1;
  } else {
    cpu.f = rlCarry0Flags[rlVal];
    rlVal = rlVal << 1;
  }
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, rlVal);
  cpu.incTact(3);
}

// rr Q
//
// The contents of register B are rotated right 1 bit position
// through the Carry flag. The contents of bit 0 are copied to the
// Carry flag and the previous contents of the Carry flag are
// copied to bit 7.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 0 of the original register value.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 0 | 1 | 1 | Q | Q | Q | 0x18, ...
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function RrQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const rrVal = cpu.getReg8(q);
  if (cpu.cFlag) {
    cpu.f = rrCarry1Flags[rrVal];
    cpu.setReg8(q, (rrVal >> 1) + 0x80);
  } else {
    cpu.f = rrCarry0Flags[rrVal];
    cpu.setReg8(q, rrVal >> 1);
  }
}

// rr (hl)
//
// The contents of the memory address specified by the contents
// of HL are rotated right 1 bit position through the Carry flag.
// The contents of bit 0 are copied to the Carry flag and the
// previous contents of the Carry flag are copied to bit 7.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 0 of (HL).
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 0 | 0x1E
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function RrHli(cpu: Z80Cpu): void {
  let rrVal = cpu.readMemory(cpu.hl);
  if (cpu.cFlag) {
    cpu.f = rrCarry1Flags[rrVal];
    rrVal = (rrVal >> 1) + 0x80;
  } else {
    cpu.f = rrCarry0Flags[rrVal];
    rrVal = rrVal >> 1;
  }
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, rrVal);
  cpu.incTact(3);
}

// sla Q
//
// An arithmetic shift left 1 bit position is performed on the
// contents of register Q. The contents of bit 7 are copied to
// the Carry flag.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of the original register value.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 1 | 0 | 0 | Q | Q | Q | 0x20, ...
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function SlaQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const slaVal = cpu.getReg8(q);
  cpu.f = rlCarry0Flags[slaVal];
  cpu.setReg8(q, slaVal << 1);
}

// sla (hl)
//
// An arithmetic shift left 1 bit position is performed on the
// contents the memory address specified by the contents of HL.
// The contents of bit 7 are copied to the Carry flag.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of (HL).
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0x26
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function SlaHli(cpu: Z80Cpu): void {
  let slaVal = cpu.readMemory(cpu.hl);
  cpu.f = rlCarry0Flags[slaVal];
  slaVal <<= 1;
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, slaVal);
  cpu.incTact(3);
}

// sra Q
//
// An arithmetic shift right 1 bit position is performed on the
// contents of register B. The contents of bit 0 are copied to the
// Carry flag and the previous contents of bit 7 remain unchanged.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 0 of the original register value.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0x28
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function SraQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const sraVal = cpu.getReg8(q);
  cpu.f = sraFlags[sraVal];
  cpu.setReg8(q, (sraVal >> 1) + (sraVal & 0x80));
}

// sra (hl)
//
// An arithmetic shift right 1 bit position is performed on the
// contents the memory address specified by the contents of HL.
// The contents of bit 0 are copied to the Carry flag and the
// previous contents of bit 7 remain unchanged.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 0 of the source byte.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 1 | 0 | 1 | 1 | 1 | 0 | 0x2E
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function SraHli(cpu: Z80Cpu): void {
  let sraVal = cpu.readMemory(cpu.hl);
  cpu.f = sraFlags[sraVal];
  sraVal = (sraVal >> 1) + (sraVal & 0x80);
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, sraVal);
  cpu.incTact(3);
}

// sll Q
//
// An arithmetic shift left 1 bit position is performed on the
// contents of register Q. The contents of bit 7 are copied to
// the Carry flag. Bit 0 is set to 1.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of the original register value.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 1 | 1 | 0 | Q | Q | Q | 0x30, ...
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function SllQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const sllVal = cpu.getReg8(q);
  cpu.f = rlCarry1Flags[sllVal];
  cpu.setReg8(q, (sllVal << 1) + 1);
}

// sll (hl)
//
// An arithmetic shift left 1 bit position is performed on the
// contents the memory address specified by the contents of HL.
// The contents of bit 7 are copied to the Carry flag. Bit 0 is
// set to 1.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of the source byte.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 | 0x36
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function SllHli(cpu: Z80Cpu): void {
  let sllVal = cpu.readMemory(cpu.hl);
  cpu.f = rlCarry1Flags[sllVal];
  sllVal <<= 1;
  sllVal++;
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, sllVal);
  cpu.incTact(3);
}

// srl Q
//
// The contents of register B are shifted right 1 bit position.
// The contents of bit 0 are copied to the Carry flag, and bit 7
// is reset.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of the original register value.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 0x38
// =================================
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function SrlQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const srlVal = cpu.getReg8(q);
  cpu.f = rrCarry0Flags[srlVal];
  cpu.setReg8(q, srlVal >> 1);
}

// srl (hl)
//
// The contents the memory address specified by the contents of HL
// are shifted right 1 bit position. The contents of bit 0 are
// copied to the Carry flag, and bit 7 is reset.
//
// S, Z, P/V are not affected.
// H, N are reset.
// C is data from bit 7 of the source byte
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0xCB
// =================================
// | 0 | 0 | 1 | 1 | 1 | 1 | 1 | 0 | 0x3E
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function SrlHli(cpu: Z80Cpu): void {
  let srlVal = cpu.readMemory(cpu.hl);
  cpu.f = rrCarry0Flags[srlVal];
  srlVal >>= 1;
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, srlVal);
  cpu.incTact(3);
}

// bit N,Q
//
// This instruction tests bit N in register Q and sets the Z
// flag accordingly.
//
// S Set if N = 7 and tested bit is set.
// Z is set if specified bit is 0; otherwise, it is reset.
// H is set.
// P/V is Set just like ZF flag.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 1 | N | N | N | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function BitNQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const n = (cpu.opCode & 0x38) >> 3;
  const srcVal = cpu.getReg8(q);
  const testVal = srcVal & (1 << n);
  var flags =
    FlagsSetMask.H |
    (cpu.f & FlagsSetMask.C) |
    (srcVal & (FlagsSetMask.R3 | FlagsSetMask.R5));
  if (testVal === 0) {
    flags |= FlagsSetMask.Z | FlagsSetMask.PV;
  }
  if (n === 7 && testVal !== 0) {
    flags |= FlagsSetMask.S;
  }
  cpu.f = <u8>flags;
}

// bit N,(hl)
//
// This instruction tests bit b in the memory location specified by
// the contents of HL and sets the Z flag accordingly.
//
// S Set if N = 7 and tested bit is set.
// Z is set if specified bit is 0; otherwise, it is reset.
// H is set.
// P/V is Set just like ZF flag.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 1 | N | N | N | 1 | 1 | 0 |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 4 (12)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1
// Gate array contention breakdown: pc:4,pc+1:4,hl:4
function BitNHli(cpu: Z80Cpu): void {
  const srcVal = cpu.readMemory(cpu.hl);
  const n = (cpu.opCode & 0x38) >> 3;
  const testVal = srcVal & (1 << n);
  var flags =
    FlagsSetMask.H |
    (cpu.f & FlagsSetMask.C) |
    (srcVal & (FlagsSetMask.R3 | FlagsSetMask.R5));
  if (testVal === 0) {
    flags |= FlagsSetMask.Z | FlagsSetMask.PV;
  }
  if (n === 7 && testVal !== 0) {
    flags |= FlagsSetMask.S;
  }
  flags =
    (flags & ~FlagsSetMask.R3) |
    (flags & ~FlagsSetMask.R5) |
    (cpu.wh & (FlagsSetMask.R3 | FlagsSetMask.R5));

  cpu.f = <u8>flags;
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
}

// res N,Q
//
// Bit N in register Q is reset.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 1 | 0 | N | N | N | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function ResNQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const n = (cpu.opCode & 0x38) >> 3;
  cpu.setReg8(q, cpu.getReg8(q) & ~(1 << n));
}

// res N,(hl)
//
// Bit N in the memory location addressed by the contents of
// HL is reset.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 1 | 0 | N | N | N | 1 | 1 | 0 |
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function ResNHli(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl);
  const n = (cpu.opCode & 0x38) >> 3;
  memVal &= ~(1 << n);
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, memVal);
  cpu.incTact(3);
}

// set N,Q
//
// Bit N in register Q is set.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 1 | 1 | N | N | N | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4 (8)
// Contention breakdown: pc:4,pc+1:4
function SetNQ(cpu: Z80Cpu): void {
  const q = cpu.opCode & 0x07;
  const n = (cpu.opCode & 0x38) >> 3;
  cpu.setReg8(q, cpu.getReg8(q) | (1 << n));
}

// set N,(hl)
//
// Bit N in the memory location addressed by the contents of
// HL is set.
//
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 1 | 1 | N | N | N | 1 | 1 | 0 |
// =================================
// T-States: 4, 4, 4, 3 (15)
// Contention breakdown: pc:4,pc+1:4,hl:3,hl:1,hl(write):3
// Gate array contention breakdown: pc:4,pc+1:4,hl:4,hl(write):3
function SetNHli(cpu: Z80Cpu): void {
  let memVal = cpu.readMemory(cpu.hl);
  const n = (cpu.opCode & 0x38) >> 3;
  memVal |= 1 << n;
  if (cpu.useGateArrayContention) {
    cpu.incTact(4);
  } else {
    cpu.incTact(3);
    cpu.readMemory(cpu.hl);
    cpu.incTact(1);
  }
  cpu.writeMemory(cpu.hl, memVal);
  cpu.incTact(3);
}

// ============================================================================
// Indexed bit instructions

// rlc (ix + D),Q
//
// The contents of the indexed memory address are rotated left 1 bit position. The
// contents of bit 7 are copied to the Carry flag and also to bit 0. The result is
// stored in register Q
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 7 of the source byte.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 0 | 0 | 0 | 0 | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XrlcQ(cpu: Z80Cpu, addr: u16): void {
  const q = cpu.opCode & 0x07;
  let rlcVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  const val = rolOpResults[rlcVal];
  if (q !== 6) {
    cpu.setReg8(q, val);
  }
  cpu.writeMemory(addr, val);
  cpu.incTact(3);
  cpu.f = rlcFlags[rlcVal];
}

// rrc (ix + D),Q
//
// The contents of the indexed memory address are rotated right 1 bit position. The
// contents of bit 0 are copied to the Carry flag and also to bit 7. The result is
// stored in register Q.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 0 of the source byte.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 0 | 0 | 0 | 1 | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XrrcQ(cpu: Z80Cpu, addr: u16): void {
  const q = cpu.opCode & 0x07;
  let rrcVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  const val = rorOpResults[rrcVal];
  if (q !== 6) {
    cpu.setReg8(q, val);
  }
  cpu.writeMemory(addr, val);
  cpu.incTact(3);
  cpu.f = rrcFlags[rrcVal];
}

// rl (ix + D),Q
//
// The contents of the indexed memory address are rotated left 1 bit position. The
// contents of bit 7 are copied to the Carry flag, and the previous contents of the
// Carry flag are copied to bit 0. The result is stored in register Q.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 7 of the source byte.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 0 | 0 | 1 | 0 | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XrlQ(cpu: Z80Cpu, addr: u16): void {
  const q = cpu.opCode & 0x07;
  let rlVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  if (cpu.cFlag) {
    cpu.f = rlCarry1Flags[rlVal];
    rlVal <<= 1;
    rlVal++;
  } else {
    cpu.f = rlCarry0Flags[rlVal];
    rlVal <<= 1;
  }
  if (q !== 6) {
    cpu.setReg8(q, rlVal);
  }
  cpu.writeMemory(addr, rlVal);
  cpu.incTact(3);
}

// rr (ix + D),Q
//
// The contents of the indexed memory address are rotated right 1 bit position. The
// contents of bit 0 are copied to the Carry flag, and the previous contents of the
// Carry flag are copied to bit 7. The result is stored in register Q.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 0 of the source byte.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 0 | 0 | 1 | 1 | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XrrQ(cpu: Z80Cpu, addr: u16): void {
  const q = cpu.opCode & 0x07;
  let rrVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  if (cpu.cFlag) {
    cpu.f = rrCarry1Flags[rrVal];
    rrVal >>= 1;
    rrVal += 0x80;
  } else {
    cpu.f = rrCarry0Flags[rrVal];
    rrVal >>= 1;
  }
  if (q !== 6) {
    cpu.setReg8(q, rrVal);
  }
  cpu.writeMemory(addr, rrVal);
  cpu.incTact(3);
}

// sla (ix + D),Q
//
// An arithmetic shift left 1 bit position is performed on the
// contents of the indexed memory address. The contents of bit 7
// are copied to the Carry flag. The result is stored in register Q.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 7 of the source byte.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 0 | 1 | 0 | 0 | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XSlaQ(cpu: Z80Cpu, addr: u16): void {
  const q = cpu.opCode & 0x07;
  let slaVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  cpu.f = rlCarry0Flags[slaVal];
  slaVal <<= 1;
  if (q !== 6) {
    cpu.setReg8(q, slaVal);
  }
  cpu.writeMemory(addr, slaVal);
  cpu.incTact(3);
}

// sra (ix + D),Q
//
// An arithmetic shift right 1 bit position is performed on the
// contents of the indexed memory address. The contents of bit 0 are
// copied to the Carry flag and the previous contents of bit 7 remain
// unchanged. The result is stored in register Q.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 7 of the source byte.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 0 | 1 | 0 | 1 | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XSraQ(cpu: Z80Cpu, addr: u16): void {
  const q = cpu.opCode & 0x07;
  let sraVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  cpu.f = sraFlags[sraVal];
  sraVal = (sraVal >> 1) + (sraVal & 0x80);
  if (q !== 6) {
    cpu.setReg8(q, sraVal);
  }
  cpu.writeMemory(addr, sraVal);
  cpu.incTact(3);
}

// sll (ix + D),Q
//
// A logic shift left 1 bit position is performed on the
// contents of the indexed memory address. The contents of bit 7
// are copied to the Carry flag and bit 0 is set. The result is
// stored in register Q.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 7 of the source byte.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 0 | 1 | 1 | 0 | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XSllQ(cpu: Z80Cpu, addr: u16): void {
  const q = cpu.opCode & 0x07;
  let sllVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  cpu.f = rlCarry1Flags[sllVal];
  sllVal <<= 1;
  sllVal++;
  if (q !== 6) {
    cpu.setReg8(q, sllVal);
  }
  cpu.writeMemory(addr, sllVal);
  cpu.incTact(3);
}

// srl (ix + D)
//
// The contents of the indexed memory address are shifted right 1
// bit position. The contents of bit 0 are copied to the Carry flag,
// and bit 7 is reset.
//
// S is set if result is negative; otherwise, it is reset.
// Z is set if result is 0; otherwise, it is reset.
// P/V is set if parity even; otherwise, it is reset.
// H, N are reset.
// C is data from bit 0 of the source byte.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 0 | 1 | 1 | 1 | 1 | 1 | 0 |
// =================================
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XSrlQ(cpu: Z80Cpu, addr: u16): void {
  const q = cpu.opCode & 0x07;
  let srlVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  cpu.f = rrCarry0Flags[srlVal];
  srlVal >>= 1;
  if (q !== 6) {
    cpu.setReg8(q, srlVal);
  }
  cpu.writeMemory(addr, srlVal);
  cpu.incTact(3);
}

// bit N,(ix+D)
//
// This instruction tests bit N in the indexed memory location and
// sets the Z flag accordingly.
//
// S Set if N = 7 and tested bit is set.
// Z is set if specified bit is 0; otherwise, it is reset.
// H is set.
// P/V is Set just like ZF flag.
// N is reset.
// C is not affected.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 0 | 1 | N | N | N | ? | ? | ? |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4 (20)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 ×2,ii+n:3,ii+n:1
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4
function XBitN(cpu: Z80Cpu, addr: u16): void {
  const n = (cpu.opCode & 0x38) >> 3;
  const srcVal = cpu.readMemory(addr);
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  const testVal = srcVal & (1 << n);
  var flags =
    FlagsSetMask.H |
    (cpu.f & FlagsSetMask.C) |
    (srcVal & (FlagsSetMask.R3 | FlagsSetMask.R5));
  if (testVal === 0) {
    flags |= FlagsSetMask.Z | FlagsSetMask.PV;
  }
  if (n === 7 && testVal !== 0) {
    flags |= FlagsSetMask.S;
  }
  cpu.f = <u8>flags;
}

// res N,(IX+D),Q
//
// Bit N of the indexed memory location addressed is reset.
// The result is autocopied to register Q.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 1 | 0 | N | N | N | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XResNQ(cpu: Z80Cpu, addr: u16): void {
  let srcVal = cpu.readMemory(addr);
  const n = (cpu.opCode & 0x38) >> 3;
  const q = cpu.opCode & 0x07;
  srcVal &= ~(1 << n);
  if (q !== 6) {
    cpu.setReg8(q, srcVal);
  }
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  cpu.writeMemory(addr, srcVal);
  cpu.incTact(3);
}

// set N,(IX+D),Q
//
// Bit N of the indexed memory location addressed is set.
// The result is autocopied to register Q.
//
// =================================
// | 1 | 1 | X | 1 | 1 | 1 | 0 | 1 | DD/FD prefix
// =================================
// | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | CB prefix
// =================================
// | 1 | 1 | N | N | N | Q | Q | Q |
// =================================
// Q: 000=B, 001=C, 010=D, 011=E
//    100=H, 101=L, 110=N/A, 111=A
// T-States: 4, 4, 3, 5, 4, 3 (23)
// Contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:3,pc+3:1 x 2,ii+n:3,ii+n:1,ii+n(write):3
// Gate array contention breakdown: pc:4,pc+1:4,pc+2:3,pc+3:5,ii+n:4,ii+n(write):3
function XSetNQ(cpu: Z80Cpu, addr: u16): void {
  let srcVal = cpu.readMemory(addr);
  const n = (cpu.opCode & 0x38) >> 3;
  const q = cpu.opCode & 0x07;
  srcVal |= 1 << n;
  if (q !== 6) {
    cpu.setReg8(q, srcVal);
  }
  cpu.incTact(3);
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(addr);
  }
  cpu.incTact(1);
  cpu.writeMemory(addr, srcVal);
  cpu.incTact(3);
}
