import "mocha";
import * as expect from "expect";
import * as mod from "../main";
import { Api } from "../src/shared/api";
import { Z80CpuEngine } from "../src/shared/Z80CpuEngine";

const wasm = mod as Api;

describe("CPU pool", () => {
  beforeEach(() => {
    wasm.resetCpuPool();
  })

  it("Creates the first CPU", () => {
    const z80 = wasm.createCpu();
    expect(z80).toBe(0);
  });

  it("Can create all CPUs", () => {
    const maxCpus = wasm.getCpuPoolMaxSize();
    for (let i = 0; i < maxCpus; i++) {
      const cpu = wasm.createCpu();
      expect(cpu).toBe(i);
    }
  });

  it("Cannot create more CPUs when all allocated", () => {
    const maxCpus = wasm.getCpuPoolMaxSize();
    for (let i = 0; i < maxCpus; i++) {
      const cpu = wasm.createCpu();
      expect(cpu).toBe(i);
    }
    const cpu = wasm.createCpu();
    expect(cpu).toBe(-1);
  });

  it("Can release CPUs", () => {
    const maxCpus = wasm.getCpuPoolMaxSize();
    for (let i = 0; i < maxCpus; i++) {
      const cpu = wasm.createCpu();
      expect(cpu).toBe(i);
    }
    const cpu1 = Math.floor(maxCpus / 2);
    const cpu2 = cpu1 + 1;
    const release1 = wasm.releaseCpu(cpu1);
    const release2 = wasm.releaseCpu(cpu2);

    expect(release1).toBe(1);
    expect(release2).toBe(1);
  });

  it("Can reallocate CPUs", () => {
    const maxCpus = wasm.getCpuPoolMaxSize();
    for (let i = 0; i < maxCpus; i++) {
      const cpu = wasm.createCpu();
      expect(cpu).toBe(i);
    }
    const cpu1 = Math.floor(maxCpus / 2);
    const cpu2 = cpu1 + 1;
    wasm.releaseCpu(cpu1);
    wasm.releaseCpu(cpu2);
    const newCpu1 = wasm.createCpu();
    const newCpu2 = wasm.createCpu();

    expect(newCpu1).toBe(cpu1);
    expect(newCpu2).toBe(cpu2);
  });

  it("Gets CPU", () => {
    const z80 = wasm.createCpu();
    const cpu = (mod as any).Z80CpuEngine.wrap((mod as any).getCpu(z80)) as Z80CpuEngine;

    expect(cpu.a).toBe(0xff);
  });

  it("Long operation", () => {
    const z80 = wasm.createCpu();
    const start = new Date().valueOf();
    wasm.longOp(z80);
    console.log(`Time: ${new Date().valueOf() - start}ms`);
  });


});
