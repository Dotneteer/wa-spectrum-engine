import { BinaryWriter } from "../../utils/BinaryWriter";
import { BinaryReader } from "../../utils/BinaryReader";
import { ScreenConfigurationEx } from "../screen/ScreenConfigurationEx";

/**
 * This interface defines the configuration data for Z80 CPU
 */
export class CpuConfiguration {
  /**
   * The clock frequency of the CPU
   */
  baseClockFrequency: u32;

  /**
   * This value allows to multiply clock frequency. Accepted values are:
   * 1, 2, 4, 8
   */
  clockMultiplier: u8;

  /**
   * Reserved for future use
   */
  supportsNextOperations: bool;
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

/**
 * This interface defines the memory configuration data the virtual machine
 */
export class MemoryConfiguration {
  /**
   * The contents of ROM banks
   */
  romContents: u8[];

  /**
   * The index of the Spectrum 48K BASIC ROM
   */
  spectrum48RomIndex: u8;

  /**
   * Number of RAM banks with the size of slots.
   * Accepted values are: 4 ... 256
   * 0, if banking is not supported.
   */
  ramBanks: u8;

  /**
   * Type of memory contention
   */
  contentionType: MemoryContentionType;

  /**
   * Size of ZX Spectrum Next in MBytes.
   * 0 - Legacy models that do not support Next memory mapping
   * 512 - 512KBytes
   * 1024 - 1024 KBytes
   * 1536 - 1.5MBytes
   * 2048 - 2 MBytes
   */
  nextMemorySize: u8;
}

/**
 * This class can be used to describe a Spectrum model's screen data
 * for configuration
 */
export class ScreenConfiguration {
  /**
   * The tact index of the interrupt relative to the top-left
   * screen pixel
   */
  interruptTact: u32 = 0;

  /**
   * Number of lines used for vertical synch
   */
  verticalSyncLines: u32 = 0;

  /**
   * The number of top border lines that are not visible
   * when rendering the screen
   */
  nonVisibleBorderTopLines: u32 = 0;

  /**
   * The number of border lines before the display
   */
  borderTopLines: u32 = 0;

  /**
   * Number of display lines
   */
  displayLines: u32 = 0;

  /**
   * The number of border lines after the display
   */
  borderBottomLines: u32 = 0;

  /**
   * The number of bottom border lines that are not visible
   * when rendering the screen
   */
  nonVisibleBorderBottomLines: u32 = 0;

  /**
   * Horizontal blanking time (HSync+blanking).
   * Given in Z80 clock cycles.
   */
  horizontalBlankingTime: u32 = 0;

  /**
   * The time of displaying left part of the border.
   * Given in Z80 clock cycles.
   */
  borderLeftTime: u32 = 0;

  /**
   * The time of displaying a pixel row.
   * Given in Z80 clock cycles.
   */
  displayLineTime: u32 = 0;

  /**
   * The time of displaying right part of the border.
   * Given in Z80 clock cycles.
   */
  borderRightTime: u32 = 0;

  /**
   * The time used to render the nonvisible right part of the border.
   * Given in Z80 clock cycles.
   */
  nonVisibleBorderRightTime: u32 = 0;

  /**
   * The time the data of a particular pixel should be prefetched
   * before displaying it.
   * Given in Z80 clock cycles.
   */
  pixelDataPrefetchTime: u32 = 0;

  /**
   * The time the data of a particular pixel attribute should be prefetched
   * before displaying it.
   * Given in Z80 clock cycles.
   */
  attributeDataPrefetchTime: u32 = 0;
}

/**
 * Serializes the screen configuration
 * @param s Screen configuration
 * @param w Output binary stream
 */
export function serializeScreenConfiguration(
  s: ScreenConfigurationEx,
  w: BinaryWriter
): void {
  w.writeUint32(s.interruptTact);
  w.writeUint32(s.verticalSyncLines);
  w.writeUint32(s.nonVisibleBorderTopLines);
  w.writeUint32(s.borderTopLines);
  w.writeUint32(s.displayLines);
  w.writeUint32(s.borderBottomLines);
  w.writeUint32(s.nonVisibleBorderBottomLines);
  w.writeUint32(s.horizontalBlankingTime);
  w.writeUint32(s.borderLeftTime);
  w.writeUint32(s.displayLineTime);
  w.writeUint32(s.borderRightTime);
  w.writeUint32(s.nonVisibleBorderRightTime);
  w.writeUint32(s.pixelDataPrefetchTime);
  w.writeUint32(s.attributeDataPrefetchTime);
}

/**
 * Restores the screen configuration from the specified stream
 * @param s Screen configuration
 * @param r Input binary stream
 */
export function restoreScreenConfiguration(s: ScreenConfiguration, r: BinaryReader): void {
  s.interruptTact = r.readUint32();
  s.verticalSyncLines = r.readUint32();
  s.nonVisibleBorderTopLines = r.readUint32();
  s.borderTopLines = r.readUint32();
  s.displayLines = r.readUint32();
  s.borderBottomLines = r.readUint32();
  s.nonVisibleBorderBottomLines = r.readUint32();
  s.horizontalBlankingTime = r.readUint32();
  s.borderLeftTime = r.readUint32();
  s.displayLineTime = r.readUint32();
  s.borderRightTime = r.readUint32();
  s.nonVisibleBorderRightTime = r.readUint32();
  s.pixelDataPrefetchTime = r.readUint32();
  s.attributeDataPrefetchTime = r.readUint32();
}