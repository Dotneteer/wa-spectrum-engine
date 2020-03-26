import { Z80StateFlags, OpPrefixMode, OpIndexMode } from "../Z80Cpu";

/**
 * Represents the internal state of the Z80CPU
 */
export class TestZ80MachineState {
  a: u8;
  f: u8;
  af: u16;
  b: u8;
  c: u8;
  bc: u16;
  d: u8;
  e: u8;
  de: u16;
  h: u8;
  l: u8;
  hl: u16;
  af_sec: u16;
  bc_sec: u16;
  de_sec: u16;
  hl_sec: u16;
  i: u8;
  r: u8;
  pc: u16;
  sp: u16;
  xh: u8;
  xl: u8;
  ix: u16;
  yh: u8;
  yl: u8;
  iy: u16;
  wh: u8;
  wl: u8;
  wz: u16;

  tactsL: u32;
  tactsH: u32;
  stateFlags: Z80StateFlags;
  useGateArrayContention: bool;
  iff1: bool;
  iff2: bool;
  interruptMode: u8;
  isInterruptBlocked: bool;
  isInOpExecution: bool;
  prefixMode: OpPrefixMode;
  indexMode: OpIndexMode;
  maskableInterruptModeEntered: bool;
  opCode: u8;
}
