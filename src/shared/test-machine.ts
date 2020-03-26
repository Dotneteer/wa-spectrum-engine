import { Api } from "./api";
import { TestZ80MachineState } from "../assembly/test-machine/TestZ80MachineState";
import { RunMode } from "./RunMode";
import { ASUtil } from "@assemblyscript/loader";

/**
 * This class represents a test machine that can be used for testing the WA machine
 */
export class TestMachine {
  private _api: Api;
  private _handle: number;
  /**
   * Initializes a test machine
   * @param moduleApi Module API obtained by the loader
   */
  constructor(public moduleApi: ASUtil) {
    // this._api = moduleApi as unknown as Api;
    // this._handle = this._api.createTestMachine();
    // if (this._handle === -1) {
    //   throw new Error("Test machine cannot be created.");
    // }
  }

  /**
   * Releases the test machine
   */
  release(): void {
    // if (this._handle !== -1) {
    //   this._api.releaseTestMachine(this._handle);
    // }
  }

  /**
   * Initializes the machine with the specified code
   * @param runMode Machine run mode
   * @param code Intial code
   */
  initCode(runMode: RunMode, code: number[]): TestZ80MachineState {
    // if (this._handle === -1) {
    //   throw new Error("No test machine to use.");
    // }

    // const ptr = this.moduleApi.__retain(this.moduleApi.__allocArray(this._api.UINT8ARRAY_ID, code));
    // this._api.initTestMachineCode(this._handle, runMode, ptr);
    // this.moduleApi.__release(ptr);
    return this.cpuState;
  }

  /**
   * Runs the injected code in test machine
   */
  run(): TestZ80MachineState {
    // const state = this._api.runTestMachine(this._handle);
    // if (!state) {
    //   throw new Error("No test machine to use.");
    // }
    return this.cpuState;
  }

  /**
   * Gets the current CPU state of the test machine.
   * @returns Test machine state
   */
  get cpuState(): TestZ80MachineState {
    // if (this._handle === -1) {
    //   throw new Error("No test machine to use.");
    // }
    // const state = (this.moduleApi as any).TestZ80MachineState.wrap(
    //   this._api.getTestMachineState(this._handle)
    // ) as TestZ80MachineState;
    throw new Error();
  }

  /**
   * Sets the current CPU state of the tes machine
   * @param s New state to set
   */
  set cpuState(s: TestZ80MachineState) {
    if (this._handle === -1) {
      throw new Error("No test machine to use.");
    }
    const module = this.moduleApi as any;
    var n = module.TestZ80MachineState() as TestZ80MachineState;

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
    n.af_sec = s.af_sec;
    n.bc_sec = s.bc_sec;
    n.de_sec = s.de_sec;
    n.hl_sec = s.hl_sec;
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

    module.TestZ80MachineState.wrap(
      this._api.updateTestMachineState(n)
    );
    module.__release(n);
  }

  /**
   * Gets the memory of the test machine
   * @returns Test machine memory contents
   */
  get memory(): number[] {
    // if (this._handle === -1) {
    //   throw new Error("No test machine to use.");
    // }
    // const memory = this._api.getTestMachineMemory(this._handle);
    // if (memory === 0) {
    //   throw new Error("Cannot access test machine memory");
    // }
    // return this.moduleApi.__getArray(memory);
    throw new Error();
  }

  /**
   * Updates the memory contents of the test machine
   */
  set memory(mem: number[]) {
    // if (this._handle === -1) {
    //   throw new Error("No test machine to use.");
    // }
    // const ptr = this.moduleApi.__retain(this.moduleApi.__allocArray(this._api.UINT8ARRAY_ID, mem));
    // const result = this._api.updateTestMachineMemory(this._handle, ptr);
    // this.moduleApi.__release(ptr);
    // if (! result) {
    //   throw new Error("Cannot access test machine memory");
    // }
    throw new Error();
  }
}
