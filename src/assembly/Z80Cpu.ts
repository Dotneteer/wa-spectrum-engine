import { MemoryStatusArray } from "./MemoryStatusArray";
import { TestZ80MachineState } from "./test-machine/TestZ80MachineState";

export class Z80Cpu {
  // ==========================================================================
  // Registers
  private _af: u16 = 0xffff;
  private _bc: u16 = 0xffff;
  private _de: u16 = 0xffff;
  private _hl: u16 = 0xffff;

  private _af_sec: u16 = 0xffff;
  private _bc_sec: u16 = 0xffff;
  private _de_sec: u16 = 0xffff;
  private _hl_sec: u16 = 0xffff;

  private _i: u8 = 0xff;
  private _r: u8 = 0xff;

  private _pc: u16 = 0xffff;
  private _sp: u16 = 0xffff;

  private _ix: u16 = 0xff;
  private _iy: u16 = 0xff;
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

  /**
   * The last read operation code
   */
  opCode: u8 = 0xff;

  // ==========================================================================
  // Instantiation

  /**
   * Instantiates the Z80 CPU
   * @param allowExtendedInstructionSet This flag signs if the Z80 extended
   * instruction set (Spectrum Next) is allowed, or NOP instructions should be
   * executed instead of these extended operations.
   */
  constructor(public allowExtendedInstructionSet: bool = false) {
    this.executeReset();
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
    this._pc = 0xffff;
    this._sp = 0xffff;
    this._ix = 0xff;
    this._iy = 0xff;
    this._wz = 0xff;
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
    this.tacts = (<u64>(s.tactsH << 32)) | s.tactsL;
    this.useGateArrayContention = s.useGateArrayContention;
    this.wh = s.wh;
    this.wl = s.wl;
    this.wz = s.wz;
  }

  // ==========================================================================
  // Registers access

  get a(): u8 {
    return <u8>(this._af >> 8);
  }
  set a(v: u8) {
    this._af = <u16>((v << 8) | (<u8>this._af));
  }
  get f(): u8 {
    return <u8>this.af;
  }
  set f(v: u8) {
    this._af = <u16>((this._af & 0xff00) | v);
  }
  get af(): u16 {
    return this._af;
  }
  set af(v: u16) {
    this._af = v;
  }

  get b(): u8 {
    return <u8>(this._bc >> 8);
  }
  set b(v: u8) {
    this._bc = <u16>((v << 8) | (<u8>this._bc));
  }
  get c(): u8 {
    return <u8>this._bc;
  }
  set c(v: u8) {
    this._bc = <u16>((this._bc & 0xff00) | v);
  }
  get bc(): u16 {
    return this._bc;
  }
  set bc(v: u16) {
    this._bc = v;
  }

  get d(): u8 {
    return <u8>(this._de >> 8);
  }
  set d(v: u8) {
    this._de = <u16>((v << 8) | (<u8>this._de));
  }
  get e(): u8 {
    return <u8>this._de;
  }
  set e(v: u8) {
    this._de = <u16>((this._de & 0xff00) | v);
  }
  get de(): u16 {
    return this._de;
  }
  set de(v: u16) {
    this._de = v;
  }

  get h(): u8 {
    return <u8>(this._hl >> 8);
  }
  set h(v: u8) {
    this._hl = <u16>((v << 8) | (<u8>this._hl));
  }
  get l(): u8 {
    return <u8>this._hl;
  }
  set l(v: u8) {
    this._hl = <u16>((this._hl & 0xff00) | v);
  }
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
    return <u8>(this._ix >> 8);
  }
  set xh(v: u8) {
    this._ix = <u16>((v << 8) | (<u8>this._ix));
  }
  get xl(): u8 {
    return <u8>this._ix;
  }
  set xl(v: u8) {
    this._ix = <u16>((this._ix & 0xff00) | v);
  }
  get ix(): u16 {
    return this._ix;
  }
  set ix(v: u16) {
    this._ix = v;
  }

  get yh(): u8 {
    return <u8>(this._iy >> 8);
  }
  set yh(v: u8) {
    this._iy = <u16>((v << 8) | (<u8>this._iy));
  }
  get yl(): u8 {
    return <u8>this._iy;
  }
  set yl(v: u8) {
    this._iy = <u16>((this._iy & 0xffff) | v);
  }
  get iy(): u16 {
    return this._iy;
  }
  set iy(v: u16) {
    this._iy = v;
  }

  get wh(): u8 {
    return <u8>(this._wz >> 8);
  }
  set wh(v: u8) {
    this._wz = <u16>((v << 8) | (<u8>this._wz));
  }
  get wl(): u8 {
    return <u8>this._wz;
  }
  set wl(v: u8) {
    this._wz = <u16>((this._wz & 0xff00) | v);
  }
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
        return this._sp;
      default:
        return 0xffff;
    }
  }

  /**
   * Set 16-bit register value by its index
   * @param index Register index
   * @param value Register value
   */
  setReg16(index: u8, value: u8): void {
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
    this.writeMemory(80, 100);
    this.tacts += 3;
    this._pc++;
    this.refreshMemory();
    return;

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
          //this.processStandardOrIndexedOperations();
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
      this._pc++;
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
      this._pc++;
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
        : standardOperations[this.opCode];
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

export enum FlagsSetMask {
  S = 0x80,
  Z = 0x40,
  R5 = 0x20,
  H = 0x10,
  R3 = 0x08,
  PV = 0x04,
  N = 0x02,
  C = 0x01,
  SZPV = S | Z | PV,
  NH = N | H,
  R3R5 = R3 | R5
}

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
const daaResults: u8[] = [];
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
        daaResults[idx] = <u8>result;
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
      let ri = <i8>X + <i8>Y + C;
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
      let ri = <i8>X - <i8>Y - C;
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
  AluCP
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
  const result = cpu.a + right + c;
  const signed = <i8>cpu.a + <i8>right + c;
  const lNibble = ((cpu.a & 0x0f) + (right & 0x0f) + c) & 0x10;

  var flags =
    result & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3) & 0xff;
  if ((result & 0xff) === 0) {
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
  const result = cpu.a - right - c;
  const signed = <i8>cpu.a - <i8>right - c;
  const lNibble = ((cpu.a & 0x0f) - (right & 0x0f) - c) & 0x10;

  var flags =
    result & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3) & 0x0f;
  flags |= FlagsSetMask.N;
  if ((result & 0xff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  if ((result & 0x10000) !== 0) {
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
  const result = cpu.a - right;
  const signed = <i8>cpu.a - <i8>right;
  const lNibble = ((cpu.a & 0x0f) - (right & 0x0f)) & 0x10;
  var flags =
    result & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3) & 0xff;
  flags |= FlagsSetMask.N;
  if ((result & 0xff) === 0) {
    flags |= FlagsSetMask.Z;
  }
  if ((result & 0x10000) !== 0) {
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
const standardOperations: (CpuOp | null)[] = [null, LdBcNN];

/**
 * Extended operations with 0xED prefix
 */
const extendedOperations: (CpuOp | null)[] = [null, LdBcNN];

/**
 * Bit operations with 0xCB prefix
 */
const bitOperations: (CpuOp | null)[] = [null, LdBcNN];

/**
 * Indexed operations with 0xDD/0xFD prefix
 */
const indexedOperations: (CpuOp | null)[] = [null, LdBcNN];

/**
 * Indexed bit operations with 0xCDB, 0xDD/0xFD prefix
 */
const indexedBitOperations: (IndexedCpuOp | null)[] = [null, LdBcNNIdx];

// ==========================================================================
// Standard operations

function LdBcNN(cpu: Z80Cpu): void {}

function LdBcNNIdx(cpu: Z80Cpu, addr: u16): void {}
