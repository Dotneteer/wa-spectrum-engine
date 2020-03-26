import { WaTestZ80Cpu, MemoryOp, IoOp } from "./WaTestZ80Cpu";
import { TestZ80MachineState } from "./TestZ80MachineState";
import { Z80StateFlags } from "../Z80Cpu";
import { RunMode } from "../../shared/RunMode"

/**
 * This class represents a simple Z80 machine that can run code, access
 * ports and memory
 */
export class WaTestZ80Machine {
  readonly cpu: WaTestZ80Cpu;
  codeEndsAt: u16 = 0;
  runMode: RunMode = RunMode.UntilEnd;

  constructor() {
    this.cpu = new WaTestZ80Cpu();
  }

  /**
   * Gets the access log of the memory
   */
  get memoryAccessLog(): MemoryOp[] {
    return this.cpu.memoryDevice.log;
  }

  /**
   * Gets the acces log of I/O operations
   */
  get ioAccessLog(): IoOp[] {
    return this.cpu.portDevice.log;
  }

  /**
   * Gets or sets the memory contents
   */
  get memory(): u8[] {
    return this.cpu.memoryDevice.memory;
  }
  set memory(mem: u8[]) {
    this.cpu.memoryDevice.memory = mem;
  }

  get memoryLength(): i32 {
    return this.cpu.memoryDevice.memory.length;
  }

  /**
   * Gets or sets the current state of the test machine
   */
  get machineState(): TestZ80MachineState {
    return this.cpu.getCpuState();
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
    const memory = this.cpu.memoryDevice.memory;
    for (let i = 0; i < programCode.length; i++) {
      memory[codeAddress++] = <u8>programCode[i];
    }
    this.codeEndsAt = 0;
    let ptr: i32 = <i32>codeAddress;
    while (ptr < 0x10000) {
      memory[ptr++] = 0;
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
