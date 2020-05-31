import { Z80CpuState } from "./cpu-helpers";
import { ZxSpectrumBase } from "./ZxSpectrumBase";

/**
 * Represents the state of the ZX Spectrum machine
 */
export abstract class SpectrumMachineStateBase extends Z80CpuState {
  // --- Type discriminator
  type: SpectrumMachineState["type"];
  
}

/**
 * This type represents ZX Spectrum machine states
 */
export type SpectrumMachineState = Spectrum48MachineState;

/**
 * Represents the state of a ZX Spectrum 48 machine
 */
export class Spectrum48MachineState extends SpectrumMachineStateBase {
  type: "48";
}
