import { MemoryStatusArray } from "./MemoryStatusArray";
import { TestZ80MachineState } from "./test-machine/TestZ80MachineState";
import {
  Z80StateFlags,
  OpPrefixMode,
  OpIndexMode,
  FlagsSetMask,
} from "../shared/cpu-enums";

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
  tacts: u64;

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
  readonly executionFlowStatus: MemoryStatusArray = new MemoryStatusArray();

  // Gets the current memory read status
  readonly memoryReadStatus: MemoryStatusArray = new MemoryStatusArray();

  // Gets the current memory write status
  readonly memoryWriteStatus: MemoryStatusArray = new MemoryStatusArray();

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

    this.tacts = 0;
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

  memoryReader: (addr: u16) => u8;
  memoryWriter: (addr: u16, value: u8) => void;
  portReader: (addr: u16) => u8;
  portWriter: (addr: u16, value: u8) => void;

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
    this.tacts = (<u64>(s.tactsH << 32)) | s.tactsL;
    this.useGateArrayContention = s.useGateArrayContention;
    this.wh = s.wh;
    this.wl = s.wl;
    this.wz = s.wz;
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
    return this.memoryReader(address);
  }

  /**
   * Writes the memory
   * @param address Memory address
   * @param value Datat to write
   */
  writeMemory(address: u16, value: u8): void {
    this.memoryWriter(address, value);
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
   * @param value Datat to write
   */
  writePort(address: u16, value: u8): void {
    this.portWriter(address, value);
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
    this.tacts += ticks;
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
    this.tacts += 3;
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
      this.tacts += 3;
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
    this.tacts = 0;
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
    this.tacts++;
    this.writeMemory(this.sp, <u8>(this.pc >> 8));
    this.tacts += 3;
    this.sp--;
    this.writeMemory(this.sp, <u8>(this.pc & 0xff));
    this.tacts += 3;

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
        this.tacts += 5;
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
        this.tacts += 2;
        let addr = <u16>((((this._i << 8) | this._r) & 0xff00) | 0xff);
        this.tacts += 5;
        let l = this.readMemory(addr);
        this.tacts += 3;
        let h = this.readMemory(++addr);
        this.tacts += 3;
        this.wz = <u16>((h << 8) | l);
        this.tacts += 6;
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
    this.tacts++;
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
    this.tacts++;
    this.writeMemory(this.sp, <u8>(this.pc >> 8));
    this.tacts += 3;
    this.sp--;
    this.writeMemory(this.sp, <u8>(this.pc & 0xff));
    this.tacts += 3;

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
    this.tacts++;
    this.opCode = this.readCodeMemory();
    this.tacts += 3;
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
const rlcFlags = [];
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
const rlCarry0Flags = [];
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
  var flags =
    result & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3);
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
  /* 0x01 */ LdQQNN,
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
  /* 0x23 */ null,
  /* 0x24 */ null,
  /* 0x25 */ null,
  /* 0x26 */ null,
  /* 0x27 */ null,
  /* 0x28 */ null,
  /* 0x29 */ null,
  /* 0x2a */ null,
  /* 0x2b */ null,
  /* 0x2c */ null,
  /* 0x2d */ null,
  /* 0x2e */ null,
  /* 0x2f */ null,
  /* 0x30 */ null,
  /* 0x31 */ null,
  /* 0x32 */ null,
  /* 0x33 */ null,
  /* 0x34 */ null,
  /* 0x35 */ null,
  /* 0x36 */ null,
  /* 0x37 */ null,
  /* 0x38 */ null,
  /* 0x39 */ null,
  /* 0x3a */ null,
  /* 0x3b */ null,
  /* 0x3c */ null,
  /* 0x3d */ null,
  /* 0x3e */ null,
  /* 0x3f */ null,
  /* 0x40 */ null,
  /* 0x41 */ null,
  /* 0x42 */ null,
  /* 0x43 */ null,
  /* 0x44 */ null,
  /* 0x45 */ null,
  /* 0x46 */ null,
  /* 0x47 */ null,
  /* 0x48 */ null,
  /* 0x49 */ null,
  /* 0x4a */ null,
  /* 0x4b */ null,
  /* 0x4c */ null,
  /* 0x4d */ null,
  /* 0x4e */ null,
  /* 0x4f */ null,
  /* 0x50 */ null,
  /* 0x51 */ null,
  /* 0x52 */ null,
  /* 0x53 */ null,
  /* 0x54 */ null,
  /* 0x55 */ null,
  /* 0x56 */ null,
  /* 0x57 */ null,
  /* 0x58 */ null,
  /* 0x59 */ null,
  /* 0x5a */ null,
  /* 0x5b */ null,
  /* 0x5c */ null,
  /* 0x5d */ null,
  /* 0x5e */ null,
  /* 0x5f */ null,
  /* 0x60 */ null,
  /* 0x61 */ null,
  /* 0x62 */ null,
  /* 0x63 */ null,
  /* 0x64 */ null,
  /* 0x65 */ null,
  /* 0x66 */ null,
  /* 0x67 */ null,
  /* 0x68 */ null,
  /* 0x69 */ null,
  /* 0x6a */ null,
  /* 0x6b */ null,
  /* 0x6c */ null,
  /* 0x6d */ null,
  /* 0x6e */ null,
  /* 0x6f */ null,
  /* 0x70 */ null,
  /* 0x71 */ null,
  /* 0x72 */ null,
  /* 0x73 */ null,
  /* 0x74 */ null,
  /* 0x75 */ null,
  /* 0x76 */ null,
  /* 0x77 */ null,
  /* 0x78 */ null,
  /* 0x79 */ null,
  /* 0x7a */ null,
  /* 0x7b */ null,
  /* 0x7c */ null,
  /* 0x7d */ null,
  /* 0x7e */ null,
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
  /* 0x8a */ null,
  /* 0x8b */ null,
  /* 0x8c */ null,
  /* 0x8d */ null,
  /* 0x8e */ null,
  /* 0x8f */ null,
  /* 0x90 */ null,
  /* 0x91 */ null,
  /* 0x92 */ null,
  /* 0x93 */ null,
  /* 0x94 */ null,
  /* 0x95 */ null,
  /* 0x96 */ null,
  /* 0x97 */ null,
  /* 0x98 */ null,
  /* 0x99 */ null,
  /* 0x9a */ null,
  /* 0x9b */ null,
  /* 0x9c */ null,
  /* 0x9d */ null,
  /* 0x9e */ null,
  /* 0x9f */ null,
  /* 0xa0 */ null,
  /* 0xa1 */ null,
  /* 0xa2 */ null,
  /* 0xa3 */ null,
  /* 0xa4 */ null,
  /* 0xa5 */ null,
  /* 0xa6 */ null,
  /* 0xa7 */ null,
  /* 0xa8 */ null,
  /* 0xa9 */ null,
  /* 0xaa */ null,
  /* 0xab */ null,
  /* 0xac */ null,
  /* 0xad */ null,
  /* 0xae */ null,
  /* 0xaf */ null,
  /* 0xb0 */ null,
  /* 0xb1 */ null,
  /* 0xb2 */ null,
  /* 0xb3 */ null,
  /* 0xb4 */ null,
  /* 0xb5 */ null,
  /* 0xb6 */ null,
  /* 0xb7 */ null,
  /* 0xb8 */ null,
  /* 0xb9 */ null,
  /* 0xba */ null,
  /* 0xbb */ null,
  /* 0xbc */ null,
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
  /* 0x23 */ null,
  /* 0x24 */ null,
  /* 0x25 */ null,
  /* 0x26 */ null,
  /* 0x27 */ null,
  /* 0x28 */ null,
  /* 0x29 */ null,
  /* 0x2a */ null,
  /* 0x2b */ null,
  /* 0x2c */ null,
  /* 0x2d */ null,
  /* 0x2e */ null,
  /* 0x2f */ null,
  /* 0x30 */ null,
  /* 0x31 */ null,
  /* 0x32 */ null,
  /* 0x33 */ null,
  /* 0x34 */ null,
  /* 0x35 */ null,
  /* 0x36 */ null,
  /* 0x37 */ null,
  /* 0x38 */ null,
  /* 0x39 */ null,
  /* 0x3a */ null,
  /* 0x3b */ null,
  /* 0x3c */ null,
  /* 0x3d */ null,
  /* 0x3e */ null,
  /* 0x3f */ null,
  /* 0x40 */ null,
  /* 0x41 */ null,
  /* 0x42 */ null,
  /* 0x43 */ null,
  /* 0x44 */ null,
  /* 0x45 */ null,
  /* 0x46 */ null,
  /* 0x47 */ null,
  /* 0x48 */ null,
  /* 0x49 */ null,
  /* 0x4a */ null,
  /* 0x4b */ null,
  /* 0x4c */ null,
  /* 0x4d */ null,
  /* 0x4e */ null,
  /* 0x4f */ null,
  /* 0x50 */ null,
  /* 0x51 */ null,
  /* 0x52 */ null,
  /* 0x53 */ null,
  /* 0x54 */ null,
  /* 0x55 */ null,
  /* 0x56 */ null,
  /* 0x57 */ null,
  /* 0x58 */ null,
  /* 0x59 */ null,
  /* 0x5a */ null,
  /* 0x5b */ null,
  /* 0x5c */ null,
  /* 0x5d */ null,
  /* 0x5e */ null,
  /* 0x5f */ null,
  /* 0x60 */ null,
  /* 0x61 */ null,
  /* 0x62 */ null,
  /* 0x63 */ null,
  /* 0x64 */ null,
  /* 0x65 */ null,
  /* 0x66 */ null,
  /* 0x67 */ null,
  /* 0x68 */ null,
  /* 0x69 */ null,
  /* 0x6a */ null,
  /* 0x6b */ null,
  /* 0x6c */ null,
  /* 0x6d */ null,
  /* 0x6e */ null,
  /* 0x6f */ null,
  /* 0x70 */ null,
  /* 0x71 */ null,
  /* 0x72 */ null,
  /* 0x73 */ null,
  /* 0x74 */ null,
  /* 0x75 */ null,
  /* 0x76 */ null,
  /* 0x77 */ null,
  /* 0x78 */ null,
  /* 0x79 */ null,
  /* 0x7a */ null,
  /* 0x7b */ null,
  /* 0x7c */ null,
  /* 0x7d */ null,
  /* 0x7e */ null,
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
  /* 0x8a */ null,
  /* 0x8b */ null,
  /* 0x8c */ null,
  /* 0x8d */ null,
  /* 0x8e */ null,
  /* 0x8f */ null,
  /* 0x90 */ null,
  /* 0x91 */ null,
  /* 0x92 */ null,
  /* 0x93 */ null,
  /* 0x94 */ null,
  /* 0x95 */ null,
  /* 0x96 */ null,
  /* 0x97 */ null,
  /* 0x98 */ null,
  /* 0x99 */ null,
  /* 0x9a */ null,
  /* 0x9b */ null,
  /* 0x9c */ null,
  /* 0x9d */ null,
  /* 0x9e */ null,
  /* 0x9f */ null,
  /* 0xa0 */ null,
  /* 0xa1 */ null,
  /* 0xa2 */ null,
  /* 0xa3 */ null,
  /* 0xa4 */ null,
  /* 0xa5 */ null,
  /* 0xa6 */ null,
  /* 0xa7 */ null,
  /* 0xa8 */ null,
  /* 0xa9 */ null,
  /* 0xaa */ null,
  /* 0xab */ null,
  /* 0xac */ null,
  /* 0xad */ null,
  /* 0xae */ null,
  /* 0xaf */ null,
  /* 0xb0 */ null,
  /* 0xb1 */ null,
  /* 0xb2 */ null,
  /* 0xb3 */ null,
  /* 0xb4 */ null,
  /* 0xb5 */ null,
  /* 0xb6 */ null,
  /* 0xb7 */ null,
  /* 0xb8 */ null,
  /* 0xb9 */ null,
  /* 0xba */ null,
  /* 0xbb */ null,
  /* 0xbc */ null,
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
 * Indexed bit operations with 0xCDB, 0xDD/0xFD prefix
 */
const indexedBitOperations: (IndexedCpuOp | null)[] = [
  /* 0x00 */ null,
  /* 0x01 */ LdBcNNIdx,
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
  /* 0x23 */ null,
  /* 0x24 */ null,
  /* 0x25 */ null,
  /* 0x26 */ null,
  /* 0x27 */ null,
  /* 0x28 */ null,
  /* 0x29 */ null,
  /* 0x2a */ null,
  /* 0x2b */ null,
  /* 0x2c */ null,
  /* 0x2d */ null,
  /* 0x2e */ null,
  /* 0x2f */ null,
  /* 0x30 */ null,
  /* 0x31 */ null,
  /* 0x32 */ null,
  /* 0x33 */ null,
  /* 0x34 */ null,
  /* 0x35 */ null,
  /* 0x36 */ null,
  /* 0x37 */ null,
  /* 0x38 */ null,
  /* 0x39 */ null,
  /* 0x3a */ null,
  /* 0x3b */ null,
  /* 0x3c */ null,
  /* 0x3d */ null,
  /* 0x3e */ null,
  /* 0x3f */ null,
  /* 0x40 */ null,
  /* 0x41 */ null,
  /* 0x42 */ null,
  /* 0x43 */ null,
  /* 0x44 */ null,
  /* 0x45 */ null,
  /* 0x46 */ null,
  /* 0x47 */ null,
  /* 0x48 */ null,
  /* 0x49 */ null,
  /* 0x4a */ null,
  /* 0x4b */ null,
  /* 0x4c */ null,
  /* 0x4d */ null,
  /* 0x4e */ null,
  /* 0x4f */ null,
  /* 0x50 */ null,
  /* 0x51 */ null,
  /* 0x52 */ null,
  /* 0x53 */ null,
  /* 0x54 */ null,
  /* 0x55 */ null,
  /* 0x56 */ null,
  /* 0x57 */ null,
  /* 0x58 */ null,
  /* 0x59 */ null,
  /* 0x5a */ null,
  /* 0x5b */ null,
  /* 0x5c */ null,
  /* 0x5d */ null,
  /* 0x5e */ null,
  /* 0x5f */ null,
  /* 0x60 */ null,
  /* 0x61 */ null,
  /* 0x62 */ null,
  /* 0x63 */ null,
  /* 0x64 */ null,
  /* 0x65 */ null,
  /* 0x66 */ null,
  /* 0x67 */ null,
  /* 0x68 */ null,
  /* 0x69 */ null,
  /* 0x6a */ null,
  /* 0x6b */ null,
  /* 0x6c */ null,
  /* 0x6d */ null,
  /* 0x6e */ null,
  /* 0x6f */ null,
  /* 0x70 */ null,
  /* 0x71 */ null,
  /* 0x72 */ null,
  /* 0x73 */ null,
  /* 0x74 */ null,
  /* 0x75 */ null,
  /* 0x76 */ null,
  /* 0x77 */ null,
  /* 0x78 */ null,
  /* 0x79 */ null,
  /* 0x7a */ null,
  /* 0x7b */ null,
  /* 0x7c */ null,
  /* 0x7d */ null,
  /* 0x7e */ null,
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
  /* 0x8a */ null,
  /* 0x8b */ null,
  /* 0x8c */ null,
  /* 0x8d */ null,
  /* 0x8e */ null,
  /* 0x8f */ null,
  /* 0x90 */ null,
  /* 0x91 */ null,
  /* 0x92 */ null,
  /* 0x93 */ null,
  /* 0x94 */ null,
  /* 0x95 */ null,
  /* 0x96 */ null,
  /* 0x97 */ null,
  /* 0x98 */ null,
  /* 0x99 */ null,
  /* 0x9a */ null,
  /* 0x9b */ null,
  /* 0x9c */ null,
  /* 0x9d */ null,
  /* 0x9e */ null,
  /* 0x9f */ null,
  /* 0xa0 */ null,
  /* 0xa1 */ null,
  /* 0xa2 */ null,
  /* 0xa3 */ null,
  /* 0xa4 */ null,
  /* 0xa5 */ null,
  /* 0xa6 */ null,
  /* 0xa7 */ null,
  /* 0xa8 */ null,
  /* 0xa9 */ null,
  /* 0xaa */ null,
  /* 0xab */ null,
  /* 0xac */ null,
  /* 0xad */ null,
  /* 0xae */ null,
  /* 0xaf */ null,
  /* 0xb0 */ null,
  /* 0xb1 */ null,
  /* 0xb2 */ null,
  /* 0xb3 */ null,
  /* 0xb4 */ null,
  /* 0xb5 */ null,
  /* 0xb6 */ null,
  /* 0xb7 */ null,
  /* 0xb8 */ null,
  /* 0xb9 */ null,
  /* 0xba */ null,
  /* 0xbb */ null,
  /* 0xbc */ null,
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
  cpu.tacts += 3;

  // pc+2:3
  const high = cpu.readCodeMemory();
  cpu.pc++;
  cpu.setReg16(qq, ((<u16>high) << 8) | low);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 2;
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
  cpu.tacts += 3;
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
  cpu.tacts += 7;
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
  cpu.tacts += 3;
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
  cpu.tacts += 2;
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
  cpu.tacts++;
  const e = cpu.readCodeMemory();
  cpu.tacts += 3;
  cpu.pc++;
  if (--cpu.b === 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz = cpu.pc = cpu.pc + <i8>e;
  cpu.tacts += 5;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) !== 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
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
  cpu.tacts += 3;
  cpu.pc++;

  // pc+2:3
  const addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.tacts += 3;
  cpu.pc++;

  // nn:3
  cpu.wz = addr + 1;
  cpu.writeMemory(addr, cpu.l);
  cpu.tacts += 3;

  // nn+1:3
  cpu.writeMemory(cpu.wz, cpu.h);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) === 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
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
  cpu.tacts += 3;

  // pc+2:3
  addr += (<u16>cpu.readCodeMemory()) << 8;
  cpu.pc++;
  cpu.tacts += 3;

  // nn:3
  cpu.wz = addr + 1;
  let val = <u16>cpu.readMemory(addr);
  cpu.tacts += 3;

  // nn+1:3
  val += (<u16>cpu.readMemory(cpu.wz)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) !== 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
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
  cpu.tacts += 3;

  // pc+2:3
  let addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.pc++;
  cpu.tacts += 3;

  // nn:3
  cpu.wz = <u8>(addr + 1) + ((<u16>cpu.a) << 8);
  cpu.writeMemory(addr, cpu.a);
  cpu.wh = cpu.a;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) === 0) {
    return;
  }

  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
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
    cpu.tacts += 4;
  } else {
    cpu.tacts += 3;
    cpu.readMemory(cpu.hl);
    cpu.tacts++;
  }
  value = cpu.aluIncByte(value);
  cpu.writeMemory(cpu.hl, value);
  cpu.tacts += 3;
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
    cpu.tacts += 4;
  } else {
    cpu.tacts += 3;
    cpu.readMemory(cpu.hl);
    cpu.tacts++;
  }
  value = cpu.aluDecByte(value);
  cpu.writeMemory(cpu.hl, value);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.writeMemory(cpu.hl, val);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  addr += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz = addr + 1;
  cpu.a = cpu.readMemory(addr);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.a |= src;
  cpu.f = aluLogOpFlags[cpu.a];
}

// cp Q
//
// The contents of B are compared with the contents of A.
// If there is a true compare, the Z flag is set. The execution of
// Q: B, C, D, E, H, L, A
// this instruction does not affect A.
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
  cpu.tacts += 3;
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
  cpu.tacts++;
  if ((cpu.f & FlagsSetMask.Z) !== 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.sp++;
  cpu.bc = ((<u16>cpu.readMemory(cpu.sp)) << 8) | val;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) !== 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts++;
  cpu.writeMemory(cpu.sp, <u8>(val >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>val);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
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
  cpu.tacts++;
  if ((cpu.f & FlagsSetMask.Z) === 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.Z) === 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts++;
  if ((cpu.f & FlagsSetMask.C) !== 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.sp++;
  cpu.de = ((<u16>cpu.readMemory(cpu.sp)) << 8) | val;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;

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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) !== 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts++;
  cpu.writeMemory(cpu.sp, <u8>(val >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>val);
  cpu.tacts += 3;
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
  cpu.tacts++;
  if ((cpu.f & FlagsSetMask.C) === 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;

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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.C) === 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts++;
  if ((cpu.f & FlagsSetMask.PV) !== 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.sp++;
  cpu.hl = ((<u16>cpu.readMemory(cpu.sp)) << 8) | val;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  tmpSp++;
  cpu.wz += (<u16>cpu.readMemory(tmpSp)) << 8;
  if (cpu.useGateArrayContention) {
    cpu.tacts += 4;
  } else {
    cpu.tacts += 3;
    cpu.readMemory(tmpSp);
    cpu.tacts++;
  }
  cpu.writeMemory(tmpSp, cpu.h);
  tmpSp--;
  cpu.tacts += 3;
  cpu.writeMemory(tmpSp, cpu.l);
  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.tacts += 3;
    cpu.writeMemory(tmpSp, cpu.l);
    cpu.tacts++;
    cpu.writeMemory(tmpSp, cpu.l);
    cpu.tacts++;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.PV) !== 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts++;
  cpu.writeMemory(cpu.sp, <u8>(val >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>val);
  cpu.tacts += 3;
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
  cpu.tacts++;
  if ((cpu.f & FlagsSetMask.PV) === 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.PV) === 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts++;
  if ((cpu.f & FlagsSetMask.S) !== 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.sp++;
  cpu.af = ((<u16>cpu.readMemory(cpu.sp)) << 8) | val;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.S) !== 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts++;
  cpu.writeMemory(cpu.sp, <u8>(val >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>val);
  cpu.tacts += 3;
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
  cpu.tacts++;
  if ((cpu.f & FlagsSetMask.S) === 0) {
    return;
  }
  cpu.wz = cpu.readMemory(cpu.sp);
  cpu.tacts += 3;
  cpu.sp++;
  cpu.wz += (<u16>cpu.readMemory(cpu.sp)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 2;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz += (<u16>cpu.readCodeMemory()) << 8;
  cpu.tacts += 3;
  cpu.pc++;
  if ((cpu.f & FlagsSetMask.S) === 0) {
    return;
  }
  if (!cpu.useGateArrayContention) {
    cpu.readMemory(cpu.pc);
  }
  cpu.tacts++;

  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;
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
  cpu.tacts++;

  cpu.writeMemory(cpu.sp, <u8>(cpu.pc >> 8));
  cpu.tacts += 3;
  cpu.sp--;
  cpu.writeMemory(cpu.sp, <u8>cpu.pc);
  cpu.tacts += 3;

  cpu.wz = cpu.opCode & 0x38;
  cpu.pc = cpu.wz;
}

// ============================================================================
// Indexed instrcutions

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
  cpu.tacts += 7;
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
  cpu.tacts += 3;

  // pc+2:3
  const high = cpu.readCodeMemory();
  cpu.pc++;
  cpu.setIndexReg(((<u16>high) << 8) | low);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;

  // pc+2:3
  const addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.tacts += 3;
  cpu.pc++;

  // nn:3
  cpu.wz = addr + 1;
  cpu.writeMemory(addr, <u8>ixVal);
  cpu.tacts += 3;

  // nn+1:3
  cpu.writeMemory(cpu.wz, <u8>(ixVal >> 8));
  cpu.tacts += 3;
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
  cpu.tacts += 2;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  const addr = ((<u16>cpu.readCodeMemory()) << 8) | l;
  cpu.tacts += 3;
  cpu.pc++;
  cpu.wz = addr + 1;
  let val = <u16>cpu.readMemory(addr);
  cpu.tacts += 3;
  val += (<u16>cpu.readMemory(cpu.wz)) << 8;
  cpu.tacts += 3;
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
  cpu.tacts += 2;
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
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  let memVal = cpu.readMemory(addr);
  cpu.tacts += 3;
  memVal = cpu.aluIncByte(memVal);
  cpu.tacts++;
  cpu.writeMemory(addr, memVal);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  let memVal = cpu.readMemory(addr);
  cpu.tacts += 3;
  memVal = cpu.aluDecByte(memVal);
  cpu.tacts++;
  cpu.writeMemory(addr, memVal);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  cpu.pc++;
  const val = cpu.readCodeMemory();
  cpu.tacts += 3;
  if (cpu.useGateArrayContention) {
    cpu.tacts += 2;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  cpu.writeMemory(addr, val);
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  cpu.setReg8(q, cpu.readMemory(addr));
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  cpu.writeMemory(addr, cpu.getReg8(q));
  cpu.tacts += 3;
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
  cpu.tacts += 3;
  if (cpu.useGateArrayContention) {
    cpu.tacts += 5;
  } else {
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
    cpu.readMemory(cpu.pc);
    cpu.tacts++;
  }
  cpu.pc++;
  const addr = ixVal + <u16>(<i8>offset);
  const op = (cpu.opCode & 0x38) >> 3;
  const alg = aluAlgorithms[op];
  alg(cpu, cpu.readMemory(addr), cpu.cFlag);
  cpu.tacts += 3;
}

function LdBcNNIdx(cpu: Z80Cpu, addr: u16): void {}
