import { TestZ80Cpu, MemoryOp, IoOp } from "./TestZ80Cpu";

/**
 * This class represents a simple Z80 machine that can run code, access
 * ports and memory
 */
export class TestZ80Machine {
  readonly cpu: TestZ80Cpu;

  constructor() {
    this.cpu = new TestZ80Cpu();
  }

  get memoryAccessLog(): MemoryOp[] {
    return this.cpu.memoryDevice.log;
  }

  get ioAccessLog(): IoOp[] {
    return this.cpu.portDevice.log;
  }

  get memory(): Uint8Array {
    return this.cpu.memoryDevice.memory;
  }
}

// This enum defines the run modes the Z80TestMachine allows
export enum RunMode {
  // Run while the machine is disposed or a break signal arrives.
  Normal,

  // Run a single CPU Execution cycle, even if an operation
  // contains multiple bytes
  OneCycle,

  // Pause when the next single instruction is executed.
  OneInstruction,

  // Run until a HALT instruction is reached.
  UntilHalt,

  // Run until a break signal arrives.
  UntilBreak,

  // Run until the whole injected code is executed
  UntilEnd
}
