import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import { CpuApi } from "../../src/native/api";

const buffer = fs.readFileSync("./build/spectrum.wasm");
let api: CpuApi;

describe("Z80 CPU register access", () => {
  before(async () => {
    const wasm = await WebAssembly.instantiate(buffer);
    api = (wasm.instance.exports as unknown) as CpuApi;
  });

  beforeEach(() => {
    api.turnOnCpu();
  })

  it("setA", () => {
    api.setA(0x3c);

    expect(api.getA()).toBe(0x3c);
    expect(api.getAF()).toBe(0x3cff);
  })

  it("setF", () => {
    api.setF(0x3c);

    expect(api.getF()).toBe(0x3c);
    expect(api.getAF()).toBe(0xff3c);
  })

  it("setB", () => {
    api.setB(0x3c);

    expect(api.getB()).toBe(0x3c);
    expect(api.getBC()).toBe(0x3cff);
  })

  it("setC", () => {
    api.setC(0x3c);

    expect(api.getC()).toBe(0x3c);
    expect(api.getBC()).toBe(0xff3c);
  })

  it("setBC", () => {
    api.setBC(0x3cae);

    expect(api.getB()).toBe(0x3c);
    expect(api.getC()).toBe(0xae);
    expect(api.getBC()).toBe(0x3cae);
  })

  it("setD", () => {
    api.setD(0x3c);

    expect(api.getD()).toBe(0x3c);
    expect(api.getDE()).toBe(0x3cff);
  })

  it("setE", () => {
    api.setE(0x3c);

    expect(api.getE()).toBe(0x3c);
    expect(api.getDE()).toBe(0xff3c);
  })

  it("setDE", () => {
    api.setDE(0x3cae);

    expect(api.getD()).toBe(0x3c);
    expect(api.getE()).toBe(0xae);
    expect(api.getDE()).toBe(0x3cae);
  })

  it("setH", () => {
    api.setH(0x3c);

    expect(api.getH()).toBe(0x3c);
    expect(api.getHL()).toBe(0x3cff);
  })

  it("setL", () => {
    api.setL(0x3c);

    expect(api.getL()).toBe(0x3c);
    expect(api.getHL()).toBe(0xff3c);
  })

  it("setHL", () => {
    api.setHL(0x3cae);

    expect(api.getH()).toBe(0x3c);
    expect(api.getL()).toBe(0xae);
    expect(api.getHL()).toBe(0x3cae);
  })

  it("setI", () => {
    api.setI(0x3c);

    expect(api.getI()).toBe(0x3c);
  })

  it("setR", () => {
    api.setR(0x3c);

    expect(api.getR()).toBe(0x3c);
  })

  it("setPC", () => {
    api.setPC(0x123cde);

    expect(api.getPC()).toBe(0x3cde);
  })

  it("setSP", () => {
    api.setSP(0x123cde);

    expect(api.getSP()).toBe(0x3cde);
  })

  it("setXH", () => {
    api.setXH(0x3c);

    expect(api.getXH()).toBe(0x3c);
    expect(api.getIX()).toBe(0x3cff);
  })

  it("setXL", () => {
    api.setXL(0x3c);

    expect(api.getXL()).toBe(0x3c);
    expect(api.getIX()).toBe(0xff3c);
  })

  it("setIX", () => {
    api.setIX(0x3cae);

    expect(api.getXH()).toBe(0x3c);
    expect(api.getXL()).toBe(0xae);
    expect(api.getIX()).toBe(0x3cae);
  })

  it("setYH", () => {
    api.setYH(0x3c);

    expect(api.getYH()).toBe(0x3c);
    expect(api.getIY()).toBe(0x3cff);
  })

  it("setYL", () => {
    api.setYL(0x3c);

    expect(api.getYL()).toBe(0x3c);
    expect(api.getIY()).toBe(0xff3c);
  })

  it("setIY", () => {
    api.setIY(0x3cae);

    expect(api.getYH()).toBe(0x3c);
    expect(api.getYL()).toBe(0xae);
    expect(api.getIY()).toBe(0x3cae);
  })

  it("setWH", () => {
    api.setWH(0x3c);

    expect(api.getWH()).toBe(0x3c);
    expect(api.getWZ()).toBe(0x3cff);
  })

  it("setWL", () => {
    api.setWL(0x3c);

    expect(api.getWL()).toBe(0x3c);
    expect(api.getWZ()).toBe(0xff3c);
  })

  it("setWZ", () => {
    api.setWZ(0x3cae);

    expect(api.getWH()).toBe(0x3c);
    expect(api.getWL()).toBe(0xae);
    expect(api.getWZ()).toBe(0x3cae);
  })

  it("resetMemory", () => {
    api.resetMemory();
    const buff = api.memory.buffer;
    const mem = new Uint8Array(buff, 0, 0x10000);
    let sum = 0;
    for (let i = 0; i < mem.length; i++) {
      sum += mem[i];
    }
    expect(sum).toBe(0x00);
  })
});
