import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import { CpuApi } from "../../src/native/api";
import { Z80StateFlags, FlagsSetMask } from "../../src/native/cpu-helpers";

const buffer = fs.readFileSync("./build/spectrum.wasm");
let api: CpuApi;

describe("Z80 CPU register access", () => {
  before(async () => {
    const wasm = await WebAssembly.instantiate(buffer, {
        imports: { trace: (arg: number) => console.log(arg) }
    });
    api = (wasm.instance.exports as unknown) as CpuApi;
  });

  beforeEach(() => {
    api.turnOnCpu();
  });

  it("setA", () => {
    api.setA(0x3c);

    expect(api.getA()).toBe(0x3c);
    expect(api.getAF()).toBe(0x3cff);
  });

  it("setF", () => {
    api.setF(0x3c);

    expect(api.getF()).toBe(0x3c);
    expect(api.getAF()).toBe(0xff3c);
  });

  it("setB", () => {
    api.setB(0x3c);

    expect(api.getB()).toBe(0x3c);
    expect(api.getBC()).toBe(0x3cff);
  });

  it("setC", () => {
    api.setC(0x3c);

    expect(api.getC()).toBe(0x3c);
    expect(api.getBC()).toBe(0xff3c);
  });

  it("setBC", () => {
    api.setBC(0x3cae);

    expect(api.getB()).toBe(0x3c);
    expect(api.getC()).toBe(0xae);
    expect(api.getBC()).toBe(0x3cae);
  });

  it("setD", () => {
    api.setD(0x3c);

    expect(api.getD()).toBe(0x3c);
    expect(api.getDE()).toBe(0x3cff);
  });

  it("setE", () => {
    api.setE(0x3c);

    expect(api.getE()).toBe(0x3c);
    expect(api.getDE()).toBe(0xff3c);
  });

  it("setDE", () => {
    api.setDE(0x3cae);

    expect(api.getD()).toBe(0x3c);
    expect(api.getE()).toBe(0xae);
    expect(api.getDE()).toBe(0x3cae);
  });

  it("setH", () => {
    api.setH(0x3c);

    expect(api.getH()).toBe(0x3c);
    expect(api.getHL()).toBe(0x3cff);
  });

  it("setL", () => {
    api.setL(0x3c);

    expect(api.getL()).toBe(0x3c);
    expect(api.getHL()).toBe(0xff3c);
  });

  it("setHL", () => {
    api.setHL(0x3cae);

    expect(api.getH()).toBe(0x3c);
    expect(api.getL()).toBe(0xae);
    expect(api.getHL()).toBe(0x3cae);
  });

  it("setI", () => {
    api.setI(0x3c);

    expect(api.getI()).toBe(0x3c);
  });

  it("setR", () => {
    api.setR(0x3c);

    expect(api.getR()).toBe(0x3c);
  });

  it("setPC", () => {
    api.setPC(0x123cde);

    expect(api.getPC()).toBe(0x3cde);
  });

  it("setSP", () => {
    api.setSP(0x123cde);

    expect(api.getSP()).toBe(0x3cde);
  });

  it("setXH", () => {
    api.setXH(0x3c);

    expect(api.getXH()).toBe(0x3c);
    expect(api.getIX()).toBe(0x3cff);
  });

  it("setXL", () => {
    api.setXL(0x3c);

    expect(api.getXL()).toBe(0x3c);
    expect(api.getIX()).toBe(0xff3c);
  });

  it("setIX", () => {
    api.setIX(0x3cae);

    expect(api.getXH()).toBe(0x3c);
    expect(api.getXL()).toBe(0xae);
    expect(api.getIX()).toBe(0x3cae);
  });

  it("setYH", () => {
    api.setYH(0x3c);

    expect(api.getYH()).toBe(0x3c);
    expect(api.getIY()).toBe(0x3cff);
  });

  it("setYL", () => {
    api.setYL(0x3c);

    expect(api.getYL()).toBe(0x3c);
    expect(api.getIY()).toBe(0xff3c);
  });

  it("setIY", () => {
    api.setIY(0x3cae);

    expect(api.getYH()).toBe(0x3c);
    expect(api.getYL()).toBe(0xae);
    expect(api.getIY()).toBe(0x3cae);
  });

  it("setWH", () => {
    api.setWH(0x3c);

    expect(api.getWH()).toBe(0x3c);
    expect(api.getWZ()).toBe(0x3cff);
  });

  it("setWL", () => {
    api.setWL(0x3c);

    expect(api.getWL()).toBe(0x3c);
    expect(api.getWZ()).toBe(0xff3c);
  });

  it("setWZ", () => {
    api.setWZ(0x3cae);

    expect(api.getWH()).toBe(0x3c);
    expect(api.getWL()).toBe(0xae);
    expect(api.getWZ()).toBe(0x3cae);
  });

  it("setReg8/getReg8", () => {
    for (let i = 0; i < 8; i++) {
      api.setReg8(i, 0x40 + i);
    }
    for (let i = 0; i < 8; i++) {
      expect(api.getReg8(i)).toBe(0x40 + i);
    }
  });

  it("setReg16/getReg16", () => {
    for (let i = 0; i < 4; i++) {
      api.setReg16(i, 0x23ac + i);
    }
    for (let i = 0; i < 4; i++) {
      expect(api.getReg16(i)).toBe(0x23ac + i);
    }
  });

  it("getIndexReg #1", () => {
    api.setIX(0x1234);
    api.setIY(0x9abc);
    api.setIndexMode(1);

    expect(api.getIndexReg()).toBe(api.getIX());
  });

  it("getIndexReg #2", () => {
    api.setIX(0x1234);
    api.setIY(0x9abc);
    api.setIndexMode(2);

    expect(api.getIndexReg()).toBe(api.getIY());
  });

  it("setIndexReg #1", () => {
    api.setIndexMode(1);
    api.setIndexReg(0x1234);
    expect(api.getIndexReg()).toBe(0x1234);
    expect(api.getIY()).toBe(0xffff);
  });

  it("setIndexReg #2", () => {
    api.setIndexMode(2);
    api.setIndexReg(0x1234);
    expect(api.getIndexReg()).toBe(0x1234);
    expect(api.getIX()).toBe(0xffff);
  });

  it("incTacts #1", () => {
    api.incTacts(3);
    expect(api.getFrameCount()).toBe(0);
    expect(api.getFrameTacts()).toBe(3);
  });

  it("incTacts #2", () => {
    api.incTacts(3);
    api.incTacts(100_008);
    expect(api.getFrameCount()).toBe(0);
    expect(api.getFrameTacts()).toBe(100_011);
  });

  it("incTacts #3", () => {
    api.incTacts(980_000);
    expect(api.getFrameCount()).toBe(0);
    expect(api.getFrameTacts()).toBe(980_000);
    api.incTacts(20_000);
    expect(api.getFrameCount()).toBe(1);
    expect(api.getFrameTacts()).toBe(0);
  });

  it("incTacts #4", () => {
    api.incTacts(980_000);
    expect(api.getFrameCount()).toBe(0);
    expect(api.getFrameTacts()).toBe(980_000);
    api.incTacts(20_003);
    expect(api.getFrameCount()).toBe(1);
    expect(api.getFrameTacts()).toBe(3);
  });

  it("resetMemory", () => {
    api.resetMemory();
    const mem = new Uint8Array(api.memory.buffer, 0, 0x10000);
    let sum = 0;
    for (let i = 0; i < mem.length; i++) {
      sum += mem[i];
    }
    expect(sum).toBe(0x00);
  });

  it("processCpuSignals (none)", () => {
    api.setCpuSignals(0x00);
    expect(api.processCpuSignals()).toBeFalsy();
  });

  it("processCpuSignals (INT #1)", () => {
    api.setCpuSignals(Z80StateFlags.Int);
    api.setInterruptBlocked(0);
    api.setIff1(1);
    expect(api.processCpuSignals()).toBeTruthy();
  });

  it("processCpuSignals (INT #2)", () => {
    api.setCpuSignals(Z80StateFlags.Int);
    api.setInterruptBlocked(1);
    api.setIff1(1);
    expect(api.processCpuSignals()).toBeFalsy();
  });

  it("processCpuSignals (INT #3)", () => {
    api.setCpuSignals(Z80StateFlags.Int);
    api.setInterruptBlocked(0);
    api.setIff1(0);
    expect(api.processCpuSignals()).toBeFalsy();
  });

  it("processCpuSignals (HLT #1)", () => {
    api.setCpuSignals(Z80StateFlags.Halted);
    expect(api.processCpuSignals()).toBeTruthy();
    expect(api.getFrameTacts()).toBe(4);
    expect(api.getR()).toBe(0x80);
  });

  it("processCpuSignals (HLT #2)", () => {
    api.setCpuSignals(Z80StateFlags.Halted);
    api.setR(6);
    expect(api.processCpuSignals()).toBeTruthy();
    expect(api.getFrameTacts()).toBe(4);
    expect(api.getR()).toBe(0x07);
  });

  it("processCpuSignals (RST)", () => {
    api.setCpuSignals(Z80StateFlags.Reset);
    expect(api.processCpuSignals()).toBeTruthy();
    expect(api.getPC()).toBe(0);
  });

  it("processCpuSignals (NMI)", () => {
    api.resetCpu();
    api.setPC(0x1234);
    api.setCpuSignals(Z80StateFlags.Nmi);
    expect(api.processCpuSignals()).toBeTruthy();
    expect(api.getSP()).toBe(0xfffd);
    const mem = new Uint8Array(api.memory.buffer, 0, 0x10000);
    expect(mem[0xfffd]).toBe(0x34);
    expect(mem[0xfffe]).toBe(0x12);
    expect(api.getPC()).toBe(0x0066);
  });

  it("processCpuSignals (INT mode #0)", () => {
    api.resetCpu();
    api.setPC(0x1234);
    api.setIndexReg(0);
    api.setCpuSignals(Z80StateFlags.Int);
    api.setInterruptBlocked(0);
    api.setIff1(1);
    api.setInterruptMode(0);
    expect(api.processCpuSignals()).toBeTruthy();
    expect(api.getSP()).toBe(0xfffd);
    const mem = new Uint8Array(api.memory.buffer, 0, 0x10000);
    expect(mem[0xfffd]).toBe(0x34);
    expect(mem[0xfffe]).toBe(0x12);
    expect(api.getPC()).toBe(0x0038);
    expect(api.getWZ()).toBe(0x0038);
  });

  it("processCpuSignals (INT mode #1)", () => {
    api.resetCpu();
    api.setPC(0x1234);
    api.setIndexReg(0);
    api.setCpuSignals(Z80StateFlags.Int);
    api.setInterruptBlocked(0);
    api.setIff1(1);
    api.setInterruptMode(1);
    expect(api.processCpuSignals()).toBeTruthy();
    expect(api.getSP()).toBe(0xfffd);
    const mem = new Uint8Array(api.memory.buffer, 0, 0x10000);
    expect(mem[0xfffd]).toBe(0x34);
    expect(mem[0xfffe]).toBe(0x12);
    expect(api.getPC()).toBe(0x0038);
    expect(api.getWZ()).toBe(0x0038);
  });

  it("processCpuSignals (INT mode #2)", () => {
    const mem = new Uint8Array(api.memory.buffer, 0, 0x10000);
    api.resetCpu();
    api.setPC(0x1234);
    api.setIndexReg(0);
    api.setCpuSignals(Z80StateFlags.Int);
    api.setInterruptBlocked(0);
    api.setIff1(1);
    api.setInterruptMode(2);
    api.setI(0x5f);
    mem[0x5ffe] = 0x12;
    mem[0x5fff] = 0xac;
    expect(api.processCpuSignals()).toBeTruthy();
    expect(api.getSP()).toBe(0xfffd);
    expect(mem[0xfffd]).toBe(0x34);
    expect(mem[0xfffe]).toBe(0x12);
    expect(api.getPC()).toBe(0xac12);
    expect(api.getWZ()).toBe(0xac12);
  });

  it("Generate aluLogOpFlags table", () => {
    const aluLogOpFlags: number[] = [];
    for (let b = 0; b < 0x100; b++) {
      const fl = b & (FlagsSetMask.R3 | FlagsSetMask.R5 | FlagsSetMask.S);
      let p = FlagsSetMask.PV;
      for (let i = 0x80; i !== 0; i /= 2) {
        if ((b & i) !== 0) {
          p ^= FlagsSetMask.PV;
        }
      }
      aluLogOpFlags[b] = (fl | p) & 0xff;
    }
    aluLogOpFlags[0] |= FlagsSetMask.Z;
    console.log(aluLogOpFlags)
    let vals = "";
    for (let i=0; i < aluLogOpFlags.length; i++) {
      const val = aluLogOpFlags[i]
      vals += `\\${(val < 16 ? "0" : "") + val.toString(16)}`;
    }
    let result = `(data (i32.const 0x1_0d00) "${vals}")`
    console.log(result);
  });


});
