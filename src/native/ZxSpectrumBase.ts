import { MachineApi } from "./api";
import { SpectrumMachineState, MemoryContentionType, EmulationMode, DebugStepMode, ExecutionCompletionReason, ExecuteCycleOptions, SpectrumMachineStateBase } from "./machine-state";
import { MemoryHelper } from "./memory-helpers";
import { SpectrumKeyCode } from "./SpectrumKeyCode";

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
   * Sets the ULA issue used by the machine
   * @param ula ULA issue of the machine
   */
  setUlaIssue(ula: number): void {
    this.api.setUlaIssue(ula);
  }

  /**
   * Gets the current state of the ZX Spectrum machine
   */
  getMachineState(): SpectrumMachineState {
    const s = this.createMachineState();
    this.api.getMachineState();

    // --- Get register data from the memory
    let mh = new MemoryHelper(this.api, REG_AREA_INDEX);

    s.bc = mh.readUint16(2);
    s.de = mh.readUint16(4);
    s.hl = mh.readUint16(6);
    s._af_ = mh.readUint16(8);
    s._bc_ = mh.readUint16(10);
    s._de_ = mh.readUint16(12);
    s._hl_ = mh.readUint16(14);
    s.i = mh.readByte(16);
    s.r = mh.readByte(17);
    s.ix = mh.readUint16(22);
    s.iy = mh.readUint16(24);
    s.wz = mh.readUint16(26);

    // --- Get state data
    mh = new MemoryHelper(this.api, STATE_TRANSFER_BUFF);

    s.af = mh.readUint16(0);
    s.pc = mh.readUint16(18);
    s.sp = mh.readUint16(20);

    s.tactsInFrame = mh.readUint32(28);
    s.allowExtendedSet = mh.readBool(32);
    s.tacts = mh.readUint32(33);
    s.stateFlags = mh.readByte(37);
    s.useGateArrayContention = mh.readBool(38);
    s.iff1 = mh.readBool(39);
    s.iff2 = mh.readBool(40);
    s.interruptMode = mh.readByte(41);
    s.isInterruptBlocked = mh.readBool(42);
    s.isInOpExecution = mh.readBool(43);
    s.prefixMode = mh.readByte(44);
    s.indexMode = mh.readByte(45);
    s.maskableInterruptModeEntered = mh.readBool(46);
    s.opCode = mh.readByte(47);

    // --- Get CPU configuration data
    s.baseClockFrequency = mh.readUint32(48);
    s.clockMultiplier = mh.readByte(52);
    s.supportsNextOperations = mh.readBool(53);
    
    // --- Get memory configuration data
    s.numberOfRoms = mh.readByte(54);
    s.romContentsAddress = mh.readUint32(55);
    s.spectrum48RomIndex = mh.readByte(59);
    s.contentionType = mh.readByte(60) as MemoryContentionType;
    s.ramBanks = mh.readByte(61);
    s.nextMemorySize = mh.readByte(62);

    // --- Get screen frame configuration data
    s.interruptTact = mh.readUint16(63);
    s.verticalSyncLines = mh.readUint16(65);
    s.nonVisibleBorderTopLines = mh.readUint16(67);
    s.borderTopLines = mh.readUint16(69);
    s.displayLines = mh.readUint16(71);
    s.borderBottomLines = mh.readUint16(73);
    s.nonVisibleBorderBottomLines = mh.readUint16(75);
    s.horizontalBlankingTime = mh.readUint16(77);
    s.borderLeftTime = mh.readUint16(79);
    s.displayLineTime = mh.readUint16(81);
    s.borderRightTime = mh.readUint16(83);
    s.nonVisibleBorderRightTime = mh.readUint16(85);
    s.pixelDataPrefetchTime = mh.readUint16(87);
    s.attributeDataPrefetchTime = mh.readUint16(89);

    // --- Get calculated frame attributes
    s.screenLines = mh.readUint32(91);
    s.firstDisplayLine = mh.readUint32(95);
    s.borderLeftPixels = mh.readUint32(99);
    s.borderRightPixels = mh.readUint32(103);
    s.displayWidth = mh.readUint32(107);
    s.screenWidth = mh.readUint32(111);
    s.screenLineTime = mh.readUint32(115);
    s.rasterLines = mh.readUint32(119);
    s.firstDisplayPixelTact = mh.readUint32(123);
    s.firstScreenPixelTact = mh.readUint32(127);

    // --- Get engine state
    s.ulaIssue = mh.readByte(131);
    s.lastRenderedUlaTact = mh.readUint32(132);
    s.lastExecutionStartFrameTacts = mh.readUint32(136);
    s.lastFrameStartTacts = mh.readUint32(140);
    s.frameCompleted = mh.readBool(144);
    s.frameOverflow = mh.readUint32(145);
    s.contentionAccummulated = mh.readUint32(149);
    s.lastExecutionContentionValue = mh.readUint32(153);
    s.emulationMode = mh.readByte(157) as EmulationMode;
    s.debugStepMode = mh.readByte(158) as DebugStepMode;
    s.fastTapeMode = mh.readBool(159);
    s.terminationRom = mh.readByte(160);
    s.terminationPoint = mh.readUint16(161);
    s.fastVmMode = mh.readBool(163);
    s.disableScreenRendering = mh.readBool(164);
    s.executionCompletionReason = mh.readByte(165) as ExecutionCompletionReason;

    // --- Get keyboard state
    s.keyboardLines = [];
    for (let i = 0; i < 8; i++) {
      s.keyboardLines[i] = mh.readByte(166 + i);
    }

    // --- Get port state
    s.portBit3LastValue = mh.readBool(174);
    s.portBit4LastValue = mh.readBool(175);
    s.portBit4ChangedFrom0Tacts = mh.readUint32(176);
    s.portBit4ChangedFrom1Tacts = mh.readUint32(180);

    // --- Get interrupt state
    s.interruptRaised = mh.readBool(184);
    s.interruptRevoked = mh.readBool(185);

    // --- Get screen state
    s.borderColor = mh.readByte(186);
    s.flashPhase = mh.readBool(187);
    s.pixelByte1 = mh.readByte(188);
    s.pixelByte2 = mh.readByte(189);
    s.attrByte1 = mh.readByte(190);
    s.attrByte2 = mh.readByte(191);
    s.flashFrames = mh.readByte(1922);

    // --- Done.
    return s;
  }

  /**
   * Override this method to represent the appropriate machine state
   */
  abstract createMachineState(): SpectrumMachineState;

  /**
   * Executes the machine cycle
   * @param options Execution options
   */
  executeCycle(options: ExecuteCycleOptions) {
    // --- Copy execution options
    const mh = new MemoryHelper(this.api, STATE_TRANSFER_BUFF);
    mh.writeByte(0, options.emulationMode);
    mh.writeByte(1, options.debugStepMode);
    mh.writeBool(2, options.fastTapeMode);
    mh.writeByte(3, options.terminationRom);
    mh.writeUint16(4, options.terminationPoint);
    mh.writeBool(6, options.fastVmMode);
    mh.writeBool(7, options.disableScreenRendering);
    this.api.setExecutionOptions();

    // --- Run the cycle and retrieve state
    this.api.executeMachineCycle();
  }

  /**
   * Sets the status of the specified key
   * @param key Key to set
   * @param isDown Status value
   */
  setKeyStatus(key: SpectrumKeyCode, isDown: boolean): void {
    this.api.setKeyStatus(key, isDown);
  }

  /**
   * Gets the status of the specified key
   * @param key Key to get
   * @returns True, if key is pressed; otherwise, false
   */
  getKeyStatus(key: SpectrumKeyCode): boolean {
    return this.api.getKeyStatus(key) !== 0;
  }

    /**
   * Initializes the machine with the specified code
   * @param runMode Machine run mode
   * @param code Intial code
   */
  injectCode(code: number[], codeAddress = 0x8000, startAddress = 0x8000): void {
    const mem = new Uint8Array(this.api.memory.buffer, 0, 0x1_0000);
    for (let i = 0; i < code.length; i++) {
      mem[codeAddress++] = code[i];
    }

    let ptr = codeAddress;
    while (ptr < 0x10000) {
      mem[ptr++] = 0;
    }

    // --- Init code execution
    this.reset();
    this.api.setPC(startAddress);
  }
}
