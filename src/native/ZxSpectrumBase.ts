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
    //s.af = mh.readUint16(0);
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
    s.tactsL = mh.readUint32(33);
    s.tactsH = mh.readUint32(37);
    s.stateFlags = mh.readByte(41);
    s.useGateArrayContention = mh.readBool(42);
    s.iff1 = mh.readBool(43);
    s.iff2 = mh.readBool(44);
    s.interruptMode = mh.readByte(45);
    s.isInterruptBlocked = mh.readBool(46);
    s.isInOpExecution = mh.readBool(47);
    s.prefixMode = mh.readByte(48);
    s.indexMode = mh.readByte(49);
    s.maskableInterruptModeEntered = mh.readBool(50);
    s.opCode = mh.readByte(51);

    // --- Get CPU configuration data
    s.baseClockFrequency = mh.readUint32(52);
    s.clockMultiplier = mh.readByte(56);
    s.supportsNextOperations = mh.readBool(57);
    
    // --- Get memory configuration data
    s.numberOfRoms = mh.readByte(58);
    s.romContentsAddress = mh.readUint32(59);
    s.spectrum48RomIndex = mh.readByte(63);
    s.contentionType = mh.readByte(64) as MemoryContentionType;
    s.ramBanks = mh.readByte(65);
    s.nextMemorySize = mh.readByte(66);

    // --- Get screen frame configuration data
    s.interruptTact = mh.readUint16(67);
    s.verticalSyncLines = mh.readUint16(69);
    s.nonVisibleBorderTopLines = mh.readUint16(71);
    s.borderTopLines = mh.readUint16(73);
    s.displayLines = mh.readUint16(75);
    s.borderBottomLines = mh.readUint16(77);
    s.nonVisibleBorderBottomLines = mh.readUint16(79);
    s.horizontalBlankingTime = mh.readUint16(81);
    s.borderLeftTime = mh.readUint16(83);
    s.displayLineTime = mh.readUint16(85);
    s.borderRightTime = mh.readUint16(87);
    s.nonVisibleBorderRightTime = mh.readUint16(89);
    s.pixelDataPrefetchTime = mh.readUint16(91);
    s.attributeDataPrefetchTime = mh.readUint16(93);

    // --- Get calculated frame attributes
    s.screenLines = mh.readUint32(95);
    s.firstDisplayLine = mh.readUint32(99);
    s.borderLeftPixels = mh.readUint32(103);
    s.borderRightPixels = mh.readUint32(107);
    s.displayWidth = mh.readUint32(111);
    s.screenWidth = mh.readUint32(115);
    s.screenLineTime = mh.readUint32(119);
    s.rasterLines = mh.readUint32(123);
    s.firstDisplayPixelTact = mh.readUint32(127);
    s.firstScreenPixelTact = mh.readUint32(131);

    // --- Get engine state
    s.ulaIssue = mh.readByte(135);
    s.lastRenderedUlaTact = mh.readUint32(136);
    s.lastExecutionStartFrameTactsL = mh.readUint32(140);
    s.lastExecutionStartFrameTactsH = mh.readUint32(144);
    s.lastFrameStartTactsL = mh.readUint32(148);
    s.lastFrameStartTactsH = mh.readUint32(152);
    s.frameCompleted = mh.readBool(156);
    s.frameOverflow = mh.readUint32(157);
    s.contentionAccummulated = mh.readUint32(161);
    s.lastExecutionContentionValue = mh.readUint32(165);
    s.emulationMode = mh.readByte(169) as EmulationMode;
    s.debugStepMode = mh.readByte(170) as DebugStepMode;
    s.fastTapeMode = mh.readBool(171);
    s.terminationRom = mh.readByte(172);
    s.terminationPoint = mh.readUint16(173);
    s.fastVmMode = mh.readBool(175);
    s.disableScreenRendering = mh.readBool(176);
    s.executionCompletionReason = mh.readByte(177) as ExecutionCompletionReason;

    // --- Get keyboard state
    s.keyboardLines = [];
    for (let i = 0; i < 8; i++) {
      s.keyboardLines[i] = mh.readByte(178 + i);
    }

    // --- Get port state
    s.portBit3LastValue = mh.readBool(186);
    s.portBit4LastValue = mh.readBool(187);
    s.portBit4ChangedFrom0TactsL = mh.readUint32(188);
    s.portBit4ChangedFrom0TactsH = mh.readUint32(192);
    s.portBit4ChangedFrom1TactsL = mh.readUint32(196);
    s.portBit4ChangedFrom1TactsH = mh.readUint32(200);

    // --- Get interrupt state
    s.interruptRaised = mh.readBool(204);
    s.interruptRevoked = mh.readBool(205);

    // --- Get screen state
    s.borderColor = mh.readByte(206);
    s.flashPhase = mh.readBool(207);
    s.pixelByte1 = mh.readByte(208);
    s.pixelByte2 = mh.readByte(209);
    s.attrByte1 = mh.readByte(210);
    s.attrByte2 = mh.readByte(211);
    s.flashFrames = mh.readByte(212);

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
