/**
 * This enumeration tells the reason why the execution cycle
 * of the SpectrumEngine completed.
 */
export enum ExecutionCompletionReason {
  /**
   * The machine is still executing
   */
  None,

  /**
   * Execution cancelled by the user
   */
  Cancelled,

  /**
   * Execution timed out
   */
  Timeout,

  /**
   * CPU reached the specified termination point
   */
  TerminationPointReached,

  /**
   * CPU reached any of the specified breakpoints
   */
  BreakpointReached,

  /**
   * CPU reached a HALT instrution
   */
  Halted,

  /**
   * The current CPU frame has been completed
   */
  CpuFrameCompleted,

  /**
   * The current screen rendering frame has been completed
   */
  UlaFrameCompleted,

  /**
   * There was an internal exception that has stopped the machine.
   */
  Exception,
}
