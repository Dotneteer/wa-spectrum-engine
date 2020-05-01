import { ZxSpectrumType } from "../../../shared/ZxSpectrumType";
import { SpectrumEngine } from "./SpectrumEngine";
import { ExecuteCycleOptions } from "../../../shared/ExecuteCycleOptions";

let machineType: ZxSpectrumType = ZxSpectrumType.None;

/**
 * The single instance of ZX Spectrum engine
 */
let spectrum: SpectrumEngine | null = null;

/**
 * Creates a new ZX Spectrum model
 * @param type Type of ZX Spectrum machine to create
 */
export function initSpectrumMachine(type: ZxSpectrumType): void {
  if (type === ZxSpectrumType.None) {
    type = ZxSpectrumType.Spectrum48;
  }
  machineType = type;
  spectrum = new SpectrumEngine();

  switch (type) {
    default:
      break;
  }
}

/**
 * Gets the type of the current machine;
 */
export function getCurrentMachineType(): ZxSpectrumType {
    return machineType;
}

/**
 * Turns on the ZX Spectrum machine instance
 */
export function turnOnSpectrumMachine(): void {
  checkMachineInitialized();
  // TODO: Implement this method
}

/**
 * Issues a RESET signal to the ZX Spectrum machine
 */
export function resetSpectrumMachine(): void {
  checkMachineInitialized();
  // TODO: Implement this method
}

/**
 * Executes a single machine cycle
 * @param mode Execution mode options
 */
export function executeCycle(options: ExecuteCycleOptions): void {
  checkMachineInitialized();
  // TODO: Implement this method
}

/**
 * Aborts, if there's no ZX Spectrum machine intialized
 */
function checkMachineInitialized(): void {
  if (!spectrum) {
    throw new Error("ZX Spectrum instance is not initialized");
  }
}
