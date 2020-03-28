import {
  Z80StateFlags,
  OpPrefixMode,
  OpIndexMode
} from "../../shared/cpu-enums";

/**
 * Represents the internal state of the Z80CPU
 */
export class TestZ80MachineState {
  private _af: u16;
  private _bc: u16;
  private _de: u16;
  private _hl: u16;

  private _af_sec: u16;
  private _bc_sec: u16;
  private _de_sec: u16;
  private _hl_sec: u16;

  private _i: u8;
  private _r: u8;

  private _pc: u16;
  private _sp: u16;

  private _ix: u16;
  private _iy: u16;
  private _wz: u16;

  get a(): u8 {
    return <u8>(this._af >> 8);
  }
  set a(v: u8) {
    this._af = ((<u16>v) << 8) | (<u8>this._af);
  }
  get f(): u8 {
    return <u8>this.af;
  }
  set f(v: u8) {
    this._af = <u16>((this._af & 0xff00) | v);
  }
  get af(): u16 {
    return this._af;
  }
  set af(v: u16) {
    this._af = v;
  }

  get b(): u8 {
    return <u8>(this._bc >> 8);
  }
  set b(v: u8) {
    this._bc = ((<u16>v) << 8) | (<u8>this._bc);
  }
  get c(): u8 {
    return <u8>this._bc;
  }
  set c(v: u8) {
    this._bc = <u16>((this._bc & 0xff00) | v);
  }
  get bc(): u16 {
    return this._bc;
  }
  set bc(v: u16) {
    this._bc = v;
  }

  get d(): u8 {
    return <u8>(this._de >> 8);
  }
  set d(v: u8) {
    this._de = ((<u16>v) << 8) | (<u8>this._de);
  }
  get e(): u8 {
    return <u8>this._de;
  }
  set e(v: u8) {
    this._de = <u16>((this._de & 0xff00) | v);
  }
  get de(): u16 {
    return this._de;
  }
  set de(v: u16) {
    this._de = v;
  }

  get h(): u8 {
    return <u8>(this._hl >> 8);
  }
  set h(v: u8) {
    this._hl = ((<u16>v) << 8) | (<u8>this._hl);
  }
  get l(): u8 {
    return <u8>this._hl;
  }
  set l(v: u8) {
    this._hl = <u16>((this._hl & 0xff00) | v);
  }
  get hl(): u16 {
    return this._hl;
  }
  set hl(v: u16) {
    this._hl = v;
  }

  get _af_(): u16 {
    return this._af_sec;
  }
  set _af_(v: u16) {
    this._af_sec = v;
  }
  get _bc_(): u16 {
    return this._bc_sec;
  }
  set _bc_(v: u16) {
    this._bc_sec = v;
  }
  get _de_(): u16 {
    return this._de_sec;
  }
  set _de_(v: u16) {
    this._de_sec = v;
  }
  get _hl_(): u16 {
    return this._hl_sec;
  }
  set _hl_(v: u16) {
    this._hl_sec = v;
  }

  get i(): u8 {
    return this._i;
  }
  set i(v: u8) {
    this._i = v;
  }
  get r(): u8 {
    return this._r;
  }
  set r(v: u8) {
    this._r = v;
  }

  get pc(): u16 {
    return this._pc;
  }
  set pc(v: u16) {
    this._pc = v;
  }
  get sp(): u16 {
    return this._sp;
  }
  set sp(v: u16) {
    this._sp = v;
  }

  get xh(): u8 {
    return <u8>(this._ix >> 8);
  }
  set xh(v: u8) {
    this._ix = ((<u16>v) << 8) | (<u8>this._ix);
  }
  get xl(): u8 {
    return <u8>this._ix;
  }
  set xl(v: u8) {
    this._ix = <u16>((this._ix & 0xff00) | v);
  }
  get ix(): u16 {
    return this._ix;
  }
  set ix(v: u16) {
    this._ix = v;
  }

  get yh(): u8 {
    return <u8>(this._iy >> 8);
  }
  set yh(v: u8) {
    this._iy = ((<u16>v) << 8) | (<u8>this._iy);
  }
  get yl(): u8 {
    return <u8>this._iy;
  }
  set yl(v: u8) {
    this._iy = <u16>((this._iy & 0xff00) | v);
  }
  get iy(): u16 {
    return this._iy;
  }
  set iy(v: u16) {
    this._iy = v;
  }

  get wh(): u8 {
    return <u8>(this._wz >> 8);
  }
  set wh(v: u8) {
    this._wz = ((<u16>v) << 8) | (<u8>this._wz);
  }
  get wl(): u8 {
    return <u8>this._wz;
  }
  set wl(v: u8) {
    this._wz = <u16>((this._wz & 0xff00) | v);
  }
  get wz(): u16 {
    return this._wz;
  }
  set wz(v: u16) {
    this._wz = v;
  }

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
