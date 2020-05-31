import { MachineApi } from "./api";
import { SpectrumMachineState } from "./machine-state";
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
  resetMachine(): void {
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

    // --- Done.
    return s;
  }

  /**
   * Override this method to represent the appropriate machine state
   */
  abstract createMachineState(): SpectrumMachineState;
}
