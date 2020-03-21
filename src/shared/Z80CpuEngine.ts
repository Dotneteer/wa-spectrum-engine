export class Z80CpuEngine {
  // ==========================================================================
  // Registers
  private _a: u8 = 0xff;
  private _f: u8 = 0xff;
  private _af: u16 = 0xffff;

  private _b: u8 = 0xff;
  private _c: u8 = 0xff;
  private _bc: u16 = 0xffff;

  private _d: u8 = 0xff;
  private _e: u8 = 0xff;
  private _de: u16 = 0xffff;

  private _h: u8 = 0xff;
  private _l: u8 = 0xff;
  private _hl: u16 = 0xffff;

  private _af_sec: u16 = 0xffff;
  private _bc_sec: u16 = 0xffff;
  private _de_sec: u16 = 0xffff;
  private _hl_sec: u16 = 0xffff;

  private _i: u8 = 0xff;
  private _r: u8 = 0xff;

  private _pc: u16 = 0xffff;
  private _sp: u16 = 0xffff;

  // ==========================================================================
  // Registers access

  get a(): u8 {
    return this._a;
  }
  set a(v: u8) {
    this._a = v;
    this._af = (this._a << 8) | this._f;
  }

  get f(): u8 {
    return this._f;
  }
  set f(v: u8) {
    this._f = v;
    this._af = (this._a << 8) | this._f;
  }

  get af(): u16 {
    return this._af;
  }
  set af(v: u16) {
    this._af = v;
    this._a = <u8>(v >> 8);
    this._f = <u8>v;
  }

  get b(): u8 {
    return this._b;
  }
  set b(v: u8) {
    this._b = v;
    this._bc = (this._b << 8) | this._c;
  }

  get c(): u8 {
    return this._c;
  }
  set c(v: u8) {
    this._c = v;
    this._bc = (this._b << 8) | this._b;
  }

  get bc(): u16 {
    return this._bc;
  }
  set bc(v: u16) {
    this._bc = v;
    this._b = <u8>(v >> 8);
    this._c = <u8>v;
  }

  get d(): u8 {
    return this._d;
  }
  set d(v: u8) {
    this._d = v;
    this._de = (this._d << 8) | this._e;
  }

  get e(): u8 {
    return this._e;
  }
  set e(v: u8) {
    this._e = v;
    this._de = (this._d << 8) | this._e;
  }

  get de(): u16 {
    return this._de;
  }
  set de(v: u16) {
    this._de = v;
    this._d = <u8>(v >> 8);
    this._e = <u8>v;
  }

  get h(): u8 {
    return this._h;
  }
  set h(v: u8) {
    this._h = v;
    this._hl = (this._h << 8) | this._l;
  }

  get l(): u8 {
    return this._l;
  }
  set l(v: u8) {
    this._l = v;
    this._hl = (this._h << 8) | this._l;
  }

  get hl(): u16 {
    return this._hl;
  }
  set hl(v: u16) {
    this._hl = v;
    this._h = <u8>(v >> 8);
    this._l = <u8>v;
  }

  get _af_(): u16 {
    return this._af_sec;
  }
  get _bc_(): u16 {
    return this._bc_sec;
  }
  get _de_(): u16 {
    return this._de_sec;
  }
  get _hl_(): u16 {
    return this._hl_sec;
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

  // ==========================================================================
  // Temporary test API

  longOp(): void {
    for (let i = 0; i < 100000000; i++) {
      this._af = <u16>i;
    }
  }
}
