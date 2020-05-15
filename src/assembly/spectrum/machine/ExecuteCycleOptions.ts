import { EmulationMode } from "./EmulationMode";
import { DebugStepMode } from "./DebugStepMode";

/**
 * This class provides options for the ExecuteCycle function.
 */
export class ExecuteCycleOptions {
  /**
   * The emulation mode to use
   */
  emulationMode: EmulationMode;

  /**
   * The debug mode to use
   */
  debugStepMode: DebugStepMode;

  /**
   * Indicates if fast tape mode is allowed
   */
  fastTapeMode: bool;

  /**
   * The index of the ROM when a termination point is defined
   */
  terminationRom: u8;

  /**
   * The value of the PC register to reach when EmulationMode is
   * set to UntilExecutionPoint
   */
  terminationPoint: u16;

  /**
   * This flag shows that the virtual machine should run in hidden mode
   * (no screen, no sound, no delays)
   */
  fastVmMode: bool;

  /**
   * This flag shows whether the virtual machine should render the screen.
   * True, renders the screen; false, does not render the screen.
   * This flag overrides the FastVmMode setting.
   */
  disableScreenRendering: boolean;
  
  /**
   * Timeout in CPU tacts
   */
  timeoutTacts: u32;
}
