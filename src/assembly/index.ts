import { TestZ80MachineState } from "./test-machine/TestZ80MachineState";
import { RunMode } from "../shared/RunMode";
import { waTestZ80Machine } from "./test-machine/WaTestZ80Machine";
import {
  clearMemoryAccessLog,
  clearIoAccessLog,
  clearTbBlueAccessLog,
} from "./test-machine/test-devices";
import { ZxSpectrumType } from "../shared/ZxSpectrumType";
import { ExecuteCycleOptions } from "../shared/ExecuteCycleOptions";
import {
  initSpectrumMachine as _initSpectrumMachine,
  getCurrentMachineType as _getCurrentMachineType,
  turnOnSpectrumMachine as _turnOnSpectrumMachine,
  resetSpectrumMachine as _resetSpectrumMachine,
  executeCycle as _executeCycle,
} from "./spectrum/machine/spectrum-machine";
import { SpectrumKeyCode } from "../shared/SpectrumKeyCode";
import { TapeFormat } from "../shared/TapeFormat";

export { Z80Cpu } from "./Z80Cpu";
export { TestZ80MachineState } from "./test-machine/TestZ80MachineState";

// ============================================================================
// Module initialization

export const UINT8ARRAY_ID = idof<Uint8Array>();
export const UINT32ARRAY_ID = idof<Uint32Array>();

// ============================================================================
// Z80TestMachine API

export function initTestMachine(): void {
  waTestZ80Machine.reset();
}

/**
 * Gets the state of the test machine
 * @returns Test machine state
 */
export function getTestMachineState(): TestZ80MachineState {
  return waTestZ80Machine.machineState;
}

/**
 * Updates the state of the test machine
 * @param state New machine state
 */
export function updateTestMachineState(state: TestZ80MachineState): void {
  waTestZ80Machine.machineState = state;
}

/**
 * Gets the memory contents of the test machine
 * @returns Test machine memory contents
 */
export function getTestMachineMemory(): Uint8Array {
  return waTestZ80Machine.memory;
}

/**
 * Updates the state of the test machine
 * @param handle Test machine handle
 * @param mem Memory contents
 */
export function updateTestMachineMemory(mem: Uint8Array): void {
  waTestZ80Machine.memory = mem;
}

/**
 * Initializes the machine with the code to run
 * @param runMode Run mode of the machine
 * @param code Initial code
 */
export function initTestMachineCode(runMode: RunMode, code: Uint8Array): void {
  waTestZ80Machine.runMode = runMode;
  waTestZ80Machine.initCode(code);
}

/**
 * Initializes the I/O input for the test machine run
 * @param input Input bytes to read
 */
export function initTestMachineInput(input: Uint8Array): void {
  waTestZ80Machine.initInput(input);
}

/**
 * Runs the test machine with the specified code
 * @param handle Test machine state after run
 */
export function runTestMachine(): void {
  waTestZ80Machine.run();
}

/**
 * Clears the memory access log
 */
export function resetMemoryAccessLog(): void {
  clearMemoryAccessLog();
}

/**
 * Clears the I/O access log
 */
export function resetIoAccessLog(): void {
  clearIoAccessLog();
}

/**
 * Clears the TBBLUE access log
 */
export function resetTbBlueAccessLog(): void {
  clearTbBlueAccessLog();
}

/**
 * Gets the I/O access log of the test machine
 */
export function getTestMachineIoAccessLog(): Uint32Array {
  return waTestZ80Machine.ioAccessLog;
}

/**
 * Gets the memory access log of the test machine
 */
export function getTestMachineMemoryAccessLog(): Uint32Array {
  return waTestZ80Machine.memoryAccessLog;
}

/**
 * Gets the TBBLUE access log of the test machine
 */
export function getTestMachineTbBlueAccessLog(): Uint16Array {
  return waTestZ80Machine.tbBlueAccessLog;
}

/**
 * Enables/disables extended instruction set.
 * @param allow True, if extended instruction set should be allowed.
 */
export function enableExtendedInstructions(allow: bool): void {
  waTestZ80Machine.allowExtendedInstructionSet = allow;
}

// ============================================================================
// ZX Spectrum machine API

/**
 * Creates a new ZX Spectrum model
 * @param type Type of ZX Spectrum machine to create
 */
export function initSpectrumMachine(type: ZxSpectrumType): void {
  _initSpectrumMachine(type);
}

/**
 * Gets the type of the current machine;
 */
export function getCurrentMachineType(): ZxSpectrumType {
  return _getCurrentMachineType();
}

/**
 * Turns on the ZX Spectrum machine instance
 */
export function turnOnSpectrumMachine(): void {
  _turnOnSpectrumMachine();
}

/**
 * Issues a RESET signal to the ZX Spectrum machine
 */
export function resetSpectrumMachine(): void {
  _resetSpectrumMachine();
}

/**
 * Executes a single machine cycle
 * @param mode Execution mode options
 */
export function executeCycle(options: ExecuteCycleOptions): void {
  _executeCycle(options);
}

/**
 * Sends key press information to the ZX Spectrum machine
 * @param keycode Code of the key pressed
 * @param isDown Signs if the key is pressed down
 */
export function sendKeyAction(keycode: SpectrumKeyCode, isDown: bool): void {
  // TODO: Implement this method
}

/**
 * Sets the data stream to use as tape input.
 * @param format Stream format
 * @param data Binary data
 */
export function setTapeStream(format: TapeFormat, data: Uint8Array): void {
  // TODO: Implement this method
}
