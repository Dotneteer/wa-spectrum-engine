import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import * as path from "path";

import { Api } from "../src/shared/api";
import * as loader from "@assemblyscript/loader";
import { TestMachine } from "../src/shared/test-machine";

const wasmBin = fs.readFileSync(
  path.join(__dirname, "../build/optimized.wasm")
);
const module = loader.instantiateSync(wasmBin, {}) as loader.ASUtil & Api;
const testMachine = new TestMachine(module);

describe("CPU state", () => {
  beforeEach(() => {
    testMachine.reset();
  });

  it("a", () => {
    let state = testMachine.cpuState;
    state.a = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.a).toBe(0x12);
    expect(stateBack.af).toBe(0x12ff);
  });

  it("f", () => {
    let state = testMachine.cpuState;
    state.f = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.f).toBe(0x12);
    expect(stateBack.af).toBe(0xff12);
  });

  it("af", () => {
    let state = testMachine.cpuState;
    state.af = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.a).toBe(0x12);
    expect(stateBack.f).toBe(0xac);
    expect(stateBack.af).toBe(0x12ac);
  });

  it("b", () => {
    let state = testMachine.cpuState;
    state.b = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.b).toBe(0x12);
    expect(stateBack.bc).toBe(0x12ff);
  });

  it("c", () => {
    let state = testMachine.cpuState;
    state.c = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.c).toBe(0x12);
    expect(stateBack.bc).toBe(0xff12);
  });

  it("bc", () => {
    let state = testMachine.cpuState;
    state.bc = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.b).toBe(0x12);
    expect(stateBack.c).toBe(0xac);
    expect(stateBack.bc).toBe(0x12ac);
  });

  it("d", () => {
    let state = testMachine.cpuState;
    state.d = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.d).toBe(0x12);
    expect(stateBack.de).toBe(0x12ff);
  });

  it("e", () => {
    let state = testMachine.cpuState;
    state.e = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.e).toBe(0x12);
    expect(stateBack.de).toBe(0xff12);
  });

  it("de", () => {
    let state = testMachine.cpuState;
    state.de = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.d).toBe(0x12);
    expect(stateBack.e).toBe(0xac);
    expect(stateBack.de).toBe(0x12ac);
  });

  it("h", () => {
    let state = testMachine.cpuState;
    state.h = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.h).toBe(0x12);
    expect(stateBack.hl).toBe(0x12ff);
  });

  it("l", () => {
    let state = testMachine.cpuState;
    state.l = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.l).toBe(0x12);
    expect(stateBack.hl).toBe(0xff12);
  });

  it("hl", () => {
    let state = testMachine.cpuState;
    state.hl = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.h).toBe(0x12);
    expect(stateBack.l).toBe(0xac);
    expect(stateBack.hl).toBe(0x12ac);
  });

  it("i", () => {
    let state = testMachine.cpuState;
    state.i = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.i).toBe(0x12);
  });

  it("r", () => {
    let state = testMachine.cpuState;
    state.r = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.r).toBe(0x12);
  });

  it("_af_", () => {
    let state = testMachine.cpuState;
    state._af_ = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack._af_).toBe(0x12ac);
  });

  it("_bc_", () => {
    let state = testMachine.cpuState;
    state._bc_ = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack._bc_).toBe(0x12ac);
  });

  it("_de_", () => {
    let state = testMachine.cpuState;
    state._de_ = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack._de_).toBe(0x12ac);
  });

  it("_hl_", () => {
    let state = testMachine.cpuState;
    state._hl_ = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack._hl_).toBe(0x12ac);
  });

  it("sp", () => {
    let state = testMachine.cpuState;
    state.sp = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.sp).toBe(0x12ac);
  });

  it("pc", () => {
    let state = testMachine.cpuState;
    state.pc = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.pc).toBe(0x12ac);
  });

  it("xh", () => {
    let state = testMachine.cpuState;
    state.xh = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.xh).toBe(0x12);
    expect(stateBack.ix).toBe(0x12ff);
  });

  it("xl", () => {
    let state = testMachine.cpuState;
    state.xl = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.xl).toBe(0x12);
    expect(stateBack.ix).toBe(0xff12);
  });

  it("ix", () => {
    let state = testMachine.cpuState;
    state.ix = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.xh).toBe(0x12);
    expect(stateBack.xl).toBe(0xac);
    expect(stateBack.ix).toBe(0x12ac);
  });

  it("yh", () => {
    let state = testMachine.cpuState;
    state.yh = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.yh).toBe(0x12);
    expect(stateBack.iy).toBe(0x12ff);
  });

  it("yl", () => {
    let state = testMachine.cpuState;
    state.yl = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.yl).toBe(0x12);
    expect(stateBack.iy).toBe(0xff12);
  });

  it("iy", () => {
    let state = testMachine.cpuState;
    state.iy = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.yh).toBe(0x12);
    expect(stateBack.yl).toBe(0xac);
    expect(stateBack.iy).toBe(0x12ac);
  });

  it("wh", () => {
    let state = testMachine.cpuState;
    state.wh = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.wh).toBe(0x12);
    expect(stateBack.wz).toBe(0x12ff);
  });

  it("wl", () => {
    let state = testMachine.cpuState;
    state.wl = 0x12;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.wl).toBe(0x12);
    expect(stateBack.wz).toBe(0xff12);
  });

  it("wz", () => {
    let state = testMachine.cpuState;
    state.wz = 0x12ac;
    testMachine.cpuState = state;
    let stateBack = testMachine.cpuState;
    expect(stateBack.wh).toBe(0x12);
    expect(stateBack.wl).toBe(0xac);
    expect(stateBack.wz).toBe(0x12ac);
  });
});
