import { MachineApi } from "./api";
import { SpectrumMachineState, MemoryContentionType } from "./machine-state";
import { MemoryHelper } from "./memory-helpers";

/**
 * Start of the register are in the memory
 */
const REG_AREA_INDEX = 0x1_0000;

/**
 * Start of the CPU state transfer area in the memory
 */
const STATE_TRANSFER_BUFF = 0x1_0040;

/**
 * This class is intended to be the base class of all ZX Spectrum
 * machine types
 */
export abstract class ZxSpectrumBase {
  /**
   * Creates a new instance of the ZX Spectrum machine
   * @param api Machine API to access WA
   * @param type Machine type
   */
  constructor(public api: MachineApi, public type: number) {
    api.initZxSpectrum(type);
  }

  /**
   * Turns on the machine
   */
  turnOnMachine(): void {
    this.api.turnOnMachine();
  }

  /**
   * Resets the machine
   */
  reset(): void {
    this.api.resetMachine();
  }

  /**
   * Gets the current state of the ZX Spectrum machine
   */
  getMachineState(): SpectrumMachineState {
    const s = this.createMachineState();
    this.api.getMachineState();

    // --- Get register data from the memory
    let mh = new MemoryHelper(this.api, REG_AREA_INDEX);
    s.af = mh.readUint16(0);
    s.bc = mh.readUint16(2);
    s.de = mh.readUint16(4);
    s.hl = mh.readUint16(6);
    s._af_ = mh.readUint16(8);
    s._bc_ = mh.readUint16(10);
    s._de_ = mh.readUint16(12);
    s._hl_ = mh.readUint16(14);
    s.i = mh.readByte(16);
    s.r = mh.readByte(17);
    s.pc = mh.readUint16(18);
    s.sp = mh.readUint16(20);
    s.ix = mh.readUint16(22);
    s.iy = mh.readUint16(24);
    s.wz = mh.readUint16(26);

    // --- Get state data
    mh = new MemoryHelper(this.api, STATE_TRANSFER_BUFF);
    s.tactsInFrame = mh.readUint32(0);
    s.allowExtendedSet = mh.readBool(4);
    s.tactsH = mh.readUint32(5);
    s.tactsL = mh.readUint32(9);
    s.stateFlags = mh.readByte(13);
    s.useGateArrayContention = mh.readBool(14);
    s.iff1 = mh.readBool(15);
    s.iff2 = mh.readBool(16);
    s.interruptMode = mh.readByte(17);
    s.isInterruptBlocked = mh.readBool(18);
    s.isInOpExecution = mh.readBool(19);
    s.prefixMode = mh.readByte(20);
    s.indexMode = mh.readByte(21);
    s.maskableInterruptModeEntered = mh.readBool(22);
    s.opCode = mh.readByte(23);

    // --- Get CPU configuration data
    s.baseClockFrequency = mh.readUint32(24);
    s.clockMultiplier = mh.readByte(28);
    s.supportsNextOperations = mh.readBool(29);
    
    // --- Get memory configuration data
    s.numberOfRoms = mh.readByte(30);
    s.romContentsAddress = mh.readUint32(31);
    s.spectrum48RomIndex = mh.readByte(35);
    s.contentionType = mh.readByte(36) as MemoryContentionType;
    s.ramBanks = mh.readByte(37);
    s.nextMemorySize = mh.readByte(38);

    // --- Get screen frame configuration data
    s.interruptTact = mh.readUint16(39);
    s.verticalSyncLines = mh.readUint16(41);
    s.nonVisibleBorderTopLines = mh.readUint16(43);
    s.borderTopLines = mh.readUint16(45);
    s.displayLines = mh.readUint16(47);
    s.borderBottomLines = mh.readUint16(49);
    s.nonVisibleBorderBottomLines = mh.readUint16(51);
    s.horizontalBlankingTime = mh.readUint16(53);
    s.borderLeftTime = mh.readUint16(55);
    s.displayLineTime = mh.readUint16(57);
    s.borderRightTime = mh.readUint16(59);
    s.nonVisibleBorderRightTime = mh.readUint16(61);
    s.pixelDataPrefetchTime = mh.readUint16(63);
    s.attributeDataPrefetchTime = mh.readUint16(65);

    // --- Get calculated frame attributes
    s.screenLines = mh.readUint32(67);
    s.firstDisplayLine = mh.readUint32(71);
    s.borderLeftPixels = mh.readUint32(75);
    s.borderRightPixels = mh.readUint32(79);
    s.displayWidth = mh.readUint32(83);
    s.screenWidth = mh.readUint32(87);
    s.screenLineTime = mh.readUint32(91);
    s.rasterLines = mh.readUint32(95);
    s.firstDisplayPixelTact = mh.readUint32(99);
    s.firstScreenPixelTact = mh.readUint32(103);

    // --- Done.
    return s;
  }

  /**
   * Override this method to represent the appropriate machine state
   */
  abstract createMachineState(): SpectrumMachineState;
}
