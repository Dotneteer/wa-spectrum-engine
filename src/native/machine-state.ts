import { Z80CpuState } from "./cpu-helpers";

/**
 * Represents the state of the ZX Spectrum machine
 */
export abstract class SpectrumMachineStateBase extends Z80CpuState {
  // --- Type discriminator
  type: SpectrumMachineState["type"];

  // --- CPU configuration
  baseClockFrequency: number;
  clockMultiplier: number;
  supportsNextOperations: boolean;

  // --- Memory configuration
  numberOfRoms: number;
  romContentsAddress: number;
  spectrum48RomIndex: number;
  ramBanks: number;
  contentionType: MemoryContentionType;
  nextMemorySize: number;

  // --- Screen frame configuration
  interruptTact: number;
  verticalSyncLines: number;
  nonVisibleBorderTopLines: number;
  borderTopLines: number;
  displayLines: number;
  borderBottomLines: number;
  nonVisibleBorderBottomLines: number;
  horizontalBlankingTime: number;
  borderLeftTime: number;
  displayLineTime: number;
  borderRightTime: number;
  nonVisibleBorderRightTime: number;
  pixelDataPrefetchTime: number;
  attributeDataPrefetchTime: number;
  screenLines: number;
  firstDisplayLine: number;
  lastDisplayLine: number;
  borderLeftPixels: number;
  displayWidth: number;
  borderRightPixels: number;
  screenWidth: number;
  screenLineTime: number;
  firstDisplayPixelTact: number;
  firstScreenPixelTact: number;
  rasterLines: number;
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

/**
 * This enumeration represents the contention type of memory
 */
export enum MemoryContentionType {
  /**
   * No contended memory
   */
  None,

  /**
   * ULA-type memory contention
   */
  Ula,

  /**
   * Gate-array-type memory contention
   */
  GateArray,

  /**
   * Spectrum Next type memory contention
   */
  Next,
}

