import { TestZ80MachineState } from "../assembly";
import { RunMode } from "./RunMode";
import { ZxSpectrumType } from "./ZxSpectrumType";
import { ExecuteCycleOptions } from "./ExecuteCycleOptions";

export interface Api {
  // ==========================================================================
  // Array types

  UINT8ARRAY_ID: number;
  UINT32ARRAY_ID: number;

  // ==========================================================================
  // Z80 Test machine operations
  initTestMachine(): void;
  getTestMachineState(): TestZ80MachineState;
  updateTestMachineState(state: TestZ80MachineState): void;
  getTestMachineMemory(): number; // PTR
  updateTestMachineMemory(mem: number /* PTR */): void;
  initTestMachineCode(runMode: RunMode, code: number /* PTR */): void;
  initTestMachineInput(input: number /* PTR */): void;
  runTestMachine(): void;
  resetMemoryAccessLog(): void;
  resetIoAccessLog(): void;
  resetTbBlueAccessLog(): void;
  getTestMachineIoAccessLog(): number; // PTR
  getTestMachineMemoryAccessLog(): number; // PTR
  getTestMachineTbBlueAccessLog(): number; //PTR
  enableExtendedInstructions(allow: boolean): void;

  // ==========================================================================
  // ZX Spectrum machine operations
  initSpectrumMachine(type: ZxSpectrumType): void;
  getCurrentMachineType(): ZxSpectrumType;
  turnOnSpectrumMachine(): void;
  resetSpectrumMachine(): void;
  executeCycle(options: ExecuteCycleOptions): void;
}
