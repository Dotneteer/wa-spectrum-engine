/**
 * This interface defines the configuration data for Z80 CPU
 */
export class CpuConfiguration {
  /**
   * The clock frequency of the CPU
   */
  baseClockFrequency: number;

  /**
   * This value allows to multiply clock frequency. Accepted values are:
   * 1, 2, 4, 8
   */
  clockMultiplier: number;

  /**
   * Reserved for future use
   */
  supportsNextOperations: boolean;
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
  romContents: u8[][];

  /**
   * The index of the Spectrum 48K BASIC ROM
   */
  spectrum48RomIndex: number;

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
  interruptTact: number = 0;

  /**
   * Number of lines used for vertical synch
   */
  verticalSyncLines: number = 0;

  /**
   * The number of top border lines that are not visible
   * when rendering the screen
   */
  nonVisibleBorderTopLines: number = 0;

  /**
   * The number of border lines before the display
   */
  borderTopLines: number = 0;

  /**
   * Number of display lines
   */
  displayLines: number = 0;

  /**
   * The number of border lines after the display
   */
  borderBottomLines: number = 0;

  /**
   * The number of bottom border lines that are not visible
   * when rendering the screen
   */
  nonVisibleBorderBottomLines: number = 0;

  /**
   * Horizontal blanking time (HSync+blanking).
   * Given in Z80 clock cycles.
   */
  horizontalBlankingTime: number = 0;

  /**
   * The time of displaying left part of the border.
   * Given in Z80 clock cycles.
   */
  borderLeftTime: number = 0;

  /**
   * The time of displaying a pixel row.
   * Given in Z80 clock cycles.
   */
  displayLineTime: number = 0;

  /**
   * The time of displaying right part of the border.
   * Given in Z80 clock cycles.
   */
  borderRightTime: number = 0;

  /**
   * The time used to render the nonvisible right part of the border.
   * Given in Z80 clock cycles.
   */
  nonVisibleBorderRightTime: number = 0;

  /**
   * The time the data of a particular pixel should be prefetched
   * before displaying it.
   * Given in Z80 clock cycles.
   */
  pixelDataPrefetchTime: number = 0;

  /**
   * The time the data of a particular pixel attribute should be prefetched
   * before displaying it.
   * Given in Z80 clock cycles.
   */
  attributeDataPrefetchTime: number = 0;
}
