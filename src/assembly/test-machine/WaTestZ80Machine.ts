import { TestZ80MachineState } from "./TestZ80MachineState";
import { Z80Cpu } from "../Z80Cpu";
import { RunMode } from "../../shared/RunMode"
import { readSimpleMemory, writeSimpleMemory, MemoryOp, memoryAccessLog, IoOp, ioAccessLog, simpleMemory, resetMemory, readSimpleIo, writeSimpleIo, setTestInput, setHostCpu } from "./test-devices";
import { Z80StateFlags } from "../../shared/cpu-enums";

/**
 * This class represents a simple Z80 machine that can run code, access
 * ports and memory
 */
class WaTestZ80Machine {
  readonly cpu: Z80Cpu;
  codeEndsAt: u16;
  runMode: RunMode;

  constructor() {
    this.cpu = new Z80Cpu();
    this.reset();
    this.cpu.memoryReader = readSimpleMemory;
    this.cpu.memoryWriter = writeSimpleMemory;
    this.cpu.portWriter = writeSimpleIo;
    this.cpu.portReader = readSimpleIo;
    setHostCpu(this.cpu);
  }

  /**
   * Resets the test machine
   */
  reset(): void {
    this.codeEndsAt = 0;
    this.runMode = RunMode.UntilEnd;
    this.cpu.turnOn();
    resetMemory();
  }

  /**
   * Gets or sets the extended instruction set flag
   */
  get allowExtendedInstructionSet(): bool {
    return this.cpu.allowExtendedInstructionSet;
  }
  set allowExtendedInstructionSet(flag: bool) {
    this.cpu.allowExtendedInstructionSet = flag;
  }

  /**
   * Gets the access log of the memory
   */
  get memoryAccessLog(): Uint32Array {
    const log = new Uint32Array(memoryAccessLog.length);
    for (let i = 0; i < memoryAccessLog.length; i++) {
      const l = memoryAccessLog[i];
      log[i] = (<u32>l.address << 16) | (<u16>l.value << 8) | (l.isWrite ? 1 : 0);
    }
    return log;
  }

  /**
   * Gets the acces log of I/O operations
   */
  get ioAccessLog(): Uint32Array {
    const log = new Uint32Array(ioAccessLog.length);
    for (let i = 0; i < ioAccessLog.length; i++) {
      const l = ioAccessLog[i];
      log[i] = (<u32>l.address << 16) | (<u16>l.value << 8) | (l.isOutput ? 1 : 0);
    }
    return log;
  }

  /**
   * Gets or sets the memory contents
   */
  get memory(): Uint8Array {
    return simpleMemory;
  }
  set memory(mem: Uint8Array) {
    for (let i = 0; i < simpleMemory.length; i++) {
      simpleMemory[i] = mem[i];
    }
  }

  /**
   * Gets or sets the current state of the test machine
   */
  get machineState(): TestZ80MachineState {
    const state = this.cpu.getCpuState();
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

  public initInput(input: Uint8Array): void {
    setTestInput(input);
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