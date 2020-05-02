import { ZxSpectrumType } from "../../../shared/ZxSpectrumType";
import { SpectrumEngine } from "./SpectrumEngine";
import { ExecuteCycleOptions } from "../../../shared/ExecuteCycleOptions";
import {
  sp48SetInstance,
  sp48GetCpuConfiguration,
  sp48GetMemoryConfiguration,
  sp48GetScreenConfiguration,
  sp48GetKnownRomAddress,
  sp48ResetMemory,
  sp48Read,
  sp48Write,
  sp48CloneMemory,
  sp48GetRamBank,
  tapeEvent,
} from "./spectrum-48";

const NOT_INITIALIZED = "ZX Spectrum instance is not initialized";

let machineType: ZxSpectrumType = ZxSpectrumType.None;

/**
 * The single instance of ZX Spectrum engine
 */
let spectrum: SpectrumEngine;

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
      sp48SetInstance(spectrum);

      // --- Engine configuration
      spectrum.getCpuConfiguration = sp48GetCpuConfiguration;
      spectrum.getMemoryConfiguration = sp48GetMemoryConfiguration;
      spectrum.getScreenConfiguration = sp48GetScreenConfiguration;

      // --- Memory device
      spectrum.resetMemory = sp48ResetMemory;
      spectrum.getKnownRomAddress = sp48GetKnownRomAddress;
      spectrum.read = sp48Read;
      spectrum.write = sp48Write;
      spectrum.cloneMemory = sp48CloneMemory;
      spectrum.selectRom = () => {};
      spectrum.getSelectedRomIndex = () => 0;
      spectrum.pageIn = () => {};
      spectrum.getSelectedRomIndex = () => 0;
      spectrum.usesShadowScreen = () => false;
      spectrum.isInAllRamMode = () => false;
      spectrum.isIn8KMode = () => false;
      spectrum.getRamBank = sp48GetRamBank;
      spectrum.getAddressLocation = (addr) =>
        addr < 0x4000
          ? { isInRom: true, index: 0, address: addr }
          : { isInRom: false, index: 0, address: addr - 0x4000 };
      spectrum.isRamBankPagedIn = () => ({
        isPagedIn: false,
        baseAddress: 0x4000,
      });

      // --- Port device

      // --- Screen device


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
  if (!spectrum) {
    throw new Error(NOT_INITIALIZED);
  }
  spectrum.cpu.turnOn();
}

/**
 * Issues a RESET signal to the ZX Spectrum machine
 */
export function resetSpectrumMachine(): void {
  if (!spectrum) {
    throw new Error(NOT_INITIALIZED);
  }
  // TODO: Implement this method
}

/**
 * Executes a single machine cycle
 * @param mode Execution mode options
 */
export function executeCycle(options: ExecuteCycleOptions): void {
  if (!spectrum) {
    throw new Error(NOT_INITIALIZED);
  }
  // TODO: Implement this method
}
