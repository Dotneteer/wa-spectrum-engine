import { Api } from "./api";
import { TestZ80MachineState } from "../assembly/test-machine/TestZ80MachineState";
import { RunMode } from "./RunMode";
import { ASUtil } from "@assemblyscript/loader";
import { MemoryOp, IoOp, clearIoAccessLog, clearMemoryAccessLog } from "../assembly/test-machine/test-devices";
import { FlagsSetMask } from "./cpu-enums";

/**
 * This class represents a test machine that can be used for testing the WA machine
 */
export class TestMachine {
  private _cpuStateBeforeRun: TestZ80MachineState;
  private _memoryBeforeRun: Uint8Array;

  /**
   * Initializes a test machine
   * @param moduleApi Module API obtained by the loader
   */
  constructor(public moduleApi: ASUtil & Api) {
    this.reset();
  }

  /**
   * Resets the test machine
   */
  reset(): TestZ80MachineState {
    this.moduleApi.initTestMachine();
    return this.cpuState;
  }

  /**
   * Initializes the machine with the specified code
   * @param runMode Machine run mode
   * @param code Intial code
   */
  initCode(code: number[], runMode = RunMode.UntilEnd): TestZ80MachineState {
    const ptr = this.moduleApi.__retain(
      this.moduleApi.__allocArray(this.moduleApi.UINT8ARRAY_ID, code)
    );
    this.moduleApi.initTestMachineCode(runMode, ptr);
    this.moduleApi.__release(ptr);
    return this.cpuState;
  }

  /**
   * Initializes the input for a test machine run
   * @param input List of input byte values
   */
  initInput(input: number[]): void {
    const ptr = this.moduleApi.__retain(
      this.moduleApi.__allocArray(this.moduleApi.UINT8ARRAY_ID, input)
    );
    this.moduleApi.initTestMachineInput(ptr);
    this.moduleApi.__release(ptr);
  }

  /**
   * Runs the injected code in test machine
   */
  run(state: TestZ80MachineState | null = null, memory: number[] | null = null): TestZ80MachineState {
    if (state !== null) {
      this.cpuState = state;
    }
    if (memory !== null) {
      this.memory = memory;
    }
    this._cpuStateBeforeRun = this.cpuState;
    this._memoryBeforeRun = new Uint8Array(this.memory);
    this.moduleApi.resetMemoryAccessLog();
    this.moduleApi.resetIoAccessLog();
    this.moduleApi.runTestMachine();
    return this.cpuState;
  }

  /**
   * Gets the current CPU state of the test machine.
   * @returns Test machine state
   */
  get cpuState(): TestZ80MachineState {
    return (this.moduleApi as any).TestZ80MachineState.wrap(
      this.moduleApi.getTestMachineState()
    ) as TestZ80MachineState;
  }

  /**
   * Sets the current CPU state of the tes machine
   * @param s New state to set
   */
  set cpuState(s: TestZ80MachineState) {
    const module = this.moduleApi as any;
    const n = new module.TestZ80MachineState() as TestZ80MachineState;

    n.a = s.a;
    n.f = s.f;
    n.af = s.af;
    n.b = s.b;
    n.c = s.c;
    n.bc = s.bc;
    n.d = s.d;
    n.e = s.e;
    n.de = s.de;
    n.h = s.h;
    n.l = s.l;
    n.hl = s.hl;
    n._af_ = s._af_;
    n._bc_ = s._bc_;
    n._de_ = s._de_;
    n._hl_ = s._hl_;
    n.i = s.i;
    n.r = s.r;
    n.pc = s.pc;
    n.sp = s.sp;
    n.xh = s.xh;
    n.xl = s.xl;
    n.ix = s.ix;
    n.yh = s.yh;
    n.yl = s.yl;
    n.iy = s.iy;
    n.wh = s.wh;
    n.wl = s.wl;
    n.wz = s.wz;

    n.iff1 = s.iff1;
    n.iff2 = s.iff2;
    n.indexMode = s.indexMode;
    n.interruptMode = s.interruptMode;
    n.isInOpExecution = s.isInOpExecution;
    n.isInterruptBlocked = s.isInterruptBlocked;
    n.maskableInterruptModeEntered = s.maskableInterruptModeEntered;
    n.opCode = s.opCode;
    n.prefixMode = s.prefixMode;
    n.stateFlags = s.stateFlags;
    n.tactsH = s.tactsH;
    n.tactsL = s.tactsL;
    n.useGateArrayContention = s.useGateArrayContention;

    this.moduleApi.updateTestMachineState(n);
    module.__release(n);
  }

  /**
   * Gets the memory of the test machine
   * @returns Test machine memory contents
   */
  get memory(): number[] {
    const memory = this.moduleApi.getTestMachineMemory();
    return this.moduleApi.__getArray(memory);
  }

  /**
   * Updates the memory contents of the test machine
   */
  set memory(mem: number[]) {
    const ptr = this.moduleApi.__retain(
      this.moduleApi.__allocArray(this.moduleApi.UINT8ARRAY_ID, mem)
    );
    this.moduleApi.updateTestMachineMemory(ptr);
    this.moduleApi.__release(ptr);
  }

  /**
   * Gets the memory access log of the test machine
   */
  get memoryAccessLog(): MemoryOp[] {
    const memoryAccess = this.moduleApi.getTestMachineMemoryAccessLog();
    const log = this.moduleApi.__getArray(memoryAccess);
    const result: MemoryOp[] = [];
    for (let i = 0; i < log.length; i++) {
      const l = log[i];
      result.push({
        address: (l >> 16) & 0xffff,
        value: (l >> 8) & 0xff,
        isWrite: (l & 0xff) !== 0
      });
    }
    return result;
  }

  /**
   * Gets the memory access log of the test machine
   */
  get ioAccessLog(): IoOp[] {
    const ioAccess = this.moduleApi.getTestMachineIoAccessLog();
    const log = this.moduleApi.__getArray(ioAccess);
    const result: IoOp[] = [];
    for (let i = 0; i < log.length; i++) {
      const l = log[i];
      result.push({
        address: (l >> 16) & 0xffff,
        value: (l >> 8) & 0xff,
        isOutput: (l & 0xff) !== 0
      });
    }
    return result;
  }

  // ==========================================================================
  // Unit test helper methods

  /**
   * Checks if all registers keep their original values, except the ones
   * listed in `except`
   * @param except Names of registers that may change
   */
  shouldKeepRegisters(except?: string): void {
    const before = this._cpuStateBeforeRun;
    const after = this.cpuState;
    let exclude = except === undefined ? [] : except.split(",");
    exclude = exclude.map(reg => reg.toUpperCase().trim());
    let differs: string[] = [];

    if (before._af_ !== after._af_ && exclude.indexOf("AF'") < 0) {
      differs.push("AF'");
    }
    if (before._bc_ !== after._bc_ && exclude.indexOf("BC'") < 0) {
      differs.push("BC'");
    }
    if (before._de_ !== after._de_ && exclude.indexOf("DE'") < 0) {
      differs.push("DE'");
    }
    if (before._hl_ !== after._hl_ && exclude.indexOf("HL'") < 0) {
      differs.push("HL'");
    }
    if (
      before.af !== after.af &&
      !(
        exclude.indexOf("AF") > -1 ||
        exclude.indexOf("A") > -1 ||
        exclude.indexOf("F") > -1
      )
    ) {
      differs.push("AF");
    }
    if (
      before.bc !== after.bc &&
      !(
        exclude.indexOf("BC") > -1 ||
        exclude.indexOf("B") > -1 ||
        exclude.indexOf("C") > -1
      )
    ) {
      differs.push("BC");
    }
    if (
      before.de !== after.de &&
      !(
        exclude.indexOf("DE") > -1 ||
        exclude.indexOf("D") > -1 ||
        exclude.indexOf("E") > -1
      )
    ) {
      differs.push("DE");
    }
    if (
      before.hl !== after.hl &&
      !(
        exclude.indexOf("HL") > -1 ||
        exclude.indexOf("H") > -1 ||
        exclude.indexOf("L") > -1
      )
    ) {
      differs.push("HL");
    }
    if (before.sp !== after.sp && exclude.indexOf("SP") < 0) {
      differs.push("SP");
    }
    if (before.ix !== after.ix && exclude.indexOf("IX") < 0) {
      differs.push("IX");
    }
    if (before.iy !== after.iy && exclude.indexOf("IY") < 0) {
      differs.push("IY");
    }
    if (
      before.a !== after.a &&
      exclude.indexOf("A") < 0 &&
      exclude.indexOf("AF") < 0
    ) {
      differs.push("A");
    }
    if (
      before.f !== after.f &&
      exclude.indexOf("F") < 0 &&
      exclude.indexOf("AF") < 0
    ) {
      differs.push("F");
    }
    if (
      before.b !== after.b &&
      exclude.indexOf("B") < 0 &&
      exclude.indexOf("BC") < 0
    ) {
      differs.push("B");
    }
    if (
      before.c !== after.c &&
      exclude.indexOf("C") < 0 &&
      exclude.indexOf("BC") < 0
    ) {
      differs.push("C");
    }
    if (
      before.d !== after.d &&
      exclude.indexOf("D") < 0 &&
      exclude.indexOf("DE") < 0
    ) {
      differs.push("D");
    }
    if (
      before.e !== after.e &&
      exclude.indexOf("E") < 0 &&
      exclude.indexOf("DE") < 0
    ) {
      differs.push("E");
    }
    if (
      before.h !== after.h &&
      exclude.indexOf("H") < 0 &&
      exclude.indexOf("HL") < 0
    ) {
      differs.push("H");
    }
    if (
      before.l !== after.l &&
      exclude.indexOf("L") < 0 &&
      exclude.indexOf("HL") < 0
    ) {
      differs.push("L");
    }
    if (differs.length === 0) {
      return;
    }
    throw new Error(
      "The following registers are expected to remain intact, " +
        `but their values have been changed: ${differs.join(", ")}`
    );
  }

  /**
   * Tests if S flag keeps its value while running a test.
   */
  shouldKeepSFlag(): void {
    const before = (this._cpuStateBeforeRun.f & FlagsSetMask.S) !== 0;
    const after = (this.cpuState.f & FlagsSetMask.S) !== 0;
    if (after === before) {
      return;
    }
    throw new Error(
      `S flag expected to keep its value, but it changed from ${before} to ${after}`
    );
  }

  /**
   * Tests if Z flag keeps its value while running a test.
   */
  shouldKeepZFlag(): void {
    const before = (this._cpuStateBeforeRun.f & FlagsSetMask.Z) !== 0;
    const after = (this.cpuState.f & FlagsSetMask.Z) !== 0;
    if (after === before) {
      return;
    }
    throw new Error(
      `Z flag expected to keep its value, but it changed from ${before} to ${after}`
    );
  }

  /**
   * Tests if N flag keeps its value while running a test.
   */
  shouldKeepNFlag(): void {
    const before = (this._cpuStateBeforeRun.f & FlagsSetMask.N) !== 0;
    const after = (this.cpuState.f & FlagsSetMask.N) !== 0;
    if (after === before) {
      return;
    }
    throw new Error(
      `N flag expected to keep its value, but it changed from ${before} to ${after}`
    );
  }

  /**
   * Tests if PV flag keeps its value while running a test.
   */
  shouldKeepPVFlag(): void {
    const before = (this._cpuStateBeforeRun.f & FlagsSetMask.PV) !== 0;
    const after = (this.cpuState.f & FlagsSetMask.PV) !== 0;
    if (after === before) {
      return;
    }
    throw new Error(
      `PV flag expected to keep its value, but it changed from ${before} to ${after}`
    );
  }

  /**
   * Tests if H flag keeps its value while running a test.
   */
  shouldKeepHFlag(): void {
    const before = (this._cpuStateBeforeRun.f & FlagsSetMask.H) !== 0;
    const after = (this.cpuState.f & FlagsSetMask.H) !== 0;
    if (after === before) {
      return;
    }
    throw new Error(
      `PV flag expected to keep its value, but it changed from {before} to {after}`
    );
  }

  /**
   * Tests if C flag keeps its value while running a test.
   */
  shouldKeepCFlag(): void {
    const before = (this._cpuStateBeforeRun.f & FlagsSetMask.C) !== 0;
    const after = (this.cpuState.f & FlagsSetMask.C) !== 0;
    if (after === before) {
      return;
    }
    throw new Error(
      `C flag expected to keep its value, but it changed from ${before} to ${after}`
    );
  }

  // Check if the machine's memory keeps its previous values, except
  // the addresses and address ranges specified in <paramref name="except"/>
  shouldKeepMemory(except?: string): void {
    const cpu = this.cpuState;
    const MAX_DEVS = 10;
    const ranges: { From: number; To: number }[] = [];
    const deviations: number[] = [];

    // --- Parse ranges
    let strRanges = except === undefined ? [] : except.split(",");
    for (let i = 0; i < strRanges.length; i++) {
      const range = strRanges[i];
      const blocks = range.split("-");
      let lower = 0xffff;
      let upper = 0xffff;
      if (blocks.length >= 1) {
        lower = parseInt(blocks[0], 16);
        upper = lower;
      }
      if (blocks.length >= 2) {
        upper = parseInt(blocks[1], 16);
      }
      ranges.push({ From: lower, To: upper });
    }

    // --- Check each byte of memory, ignoring the stack
    let upperMemoryBound = cpu.sp;
    if (upperMemoryBound === 0) {
      upperMemoryBound = 0x10000;
    }
    const memoryAfter = this.memory;
    for (let idx = 0; idx < upperMemoryBound; idx++) {
      if (memoryAfter[idx] === this._memoryBeforeRun[idx]) {
        continue;
      }

      // --- Test allowed deviations
      let found = ranges.some(range => idx >= range.From && idx <= range.To);
      if (found) {
        continue;
      }

      // --- Report deviation
      deviations.push(idx);
      if (deviations.length >= MAX_DEVS) {
        break;
      }
    }

    if (deviations.length > 0) {
      throw new Error(
        "The following memory locations are expected to remain intact, " +
          "but their values have been changed: " +
          deviations.map(d => d.toString(16)).join(", ")
      );
    }
  }
}
