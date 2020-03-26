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

  // Run until the whole injected code is executed
  UntilEnd
}
