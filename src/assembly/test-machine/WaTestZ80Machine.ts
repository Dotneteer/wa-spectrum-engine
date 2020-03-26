import { TestZ80MachineState } from "./TestZ80MachineState";
import { Z80StateFlags, Z80Cpu } from "../Z80Cpu";
import { RunMode } from "../../shared/RunMode"
import { readSimpleMemory, writeSimpleMemory, MemoryOp, memoryAccessLog, IoOp, ioAccessLog, simpleMemory, resetMemory } from "./test-devices";

/**
 * This class represents a simple Z80 machine that can run code, access
 * ports and memory
 */
class WaTestZ80Machine {
  readonly cpu: Z80Cpu;
  codeEndsAt: u16 = 0;
  runMode: RunMode = RunMode.UntilEnd;

  constructor() {
    this.cpu = new Z80Cpu();
    this.cpu.memoryReader = readSimpleMemory;
    this.cpu.memoryWriter = writeSimpleMemory;
  }

  /**
   * Resets the test machine
   */
  reset(): void {
    resetMemory();
    this.cpu.reset();
  }
  /**
   * Gets the access log of the memory
   */
  get memoryAccessLog(): MemoryOp[] {
    return memoryAccessLog;
  }

  /**
   * Gets the acces log of I/O operations
   */
  get ioAccessLog(): IoOp[] {
    return ioAccessLog;
  }

  // /**
  //  * Gets or sets the memory contents
  //  */
  // get memory(): u8[] {
  //   return simpleMemory
  // }
  // set memory(mem: u8[]) {
  //   this.memoryDevice.memory = mem;
  // }

  // get memoryLength(): i32 {
  //   return this.memoryDevice.memory.length;
  // }

  /**
   * Gets or sets the current state of the test machine
   */
  get machineState(): TestZ80MachineState {
    const state = this.cpu.getCpuState();
    state.runMode = this.runMode;
    return state;
  }
  set machineState(state: TestZ80MachineState) {
    this.cpu.updateCpuState(state);
  }

  /**
   * Initializes the code passed in `programCode`. This code is put into
   * the memory from `codeAddress` and code execution starts at
   * `startAddress`.
   * @param programCode Program code to pass
   */
  public initCode(
    programCode: Uint8Array,
    codeAddress: u16 = 0,
    startAt: u16 = 0
  ): void {
    // --- Initialize the code
    for (let i = 0; i < programCode.length; i++) {
      writeSimpleMemory(codeAddress++, <u8>programCode[i]);
    }
    this.codeEndsAt = codeAddress;
    let ptr: i32 = <i32>codeAddress;
    while (ptr < 0x10000) {
      writeSimpleMemory(<u16>(ptr++), 0);
    }
    
    // --- Init code execution
    this.cpu.reset();
    this.cpu.pc = startAt;
  }

  /**
   * Runs the injected code
   */
  run(): void {
    let stopped = false;
    while (!stopped) {
      this.cpu.executeCpuCycle();
      switch (this.runMode) {
        case RunMode.Normal:
        case RunMode.OneCycle:
          stopped = true;
          break;
        case RunMode.OneInstruction:
          stopped = !this.cpu.isInOpExecution;
          break;
        case RunMode.UntilHalt:
          stopped = (this.cpu.stateFlags & Z80StateFlags.Halted) !== 0;
          break;
        default:
          stopped = this.cpu.pc >= this.codeEndsAt;
          break;
      }
    }
  }
}

/**
 * The test machine instance
 */
export const waTestZ80Machine = new WaTestZ80Machine();