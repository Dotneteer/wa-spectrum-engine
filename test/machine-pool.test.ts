import { before } from "mocha";
import * as expect from "expect";
import * as fs from "fs";
import * as path from "path";

import { Api } from "../src/shared/api";
import * as loader from "@assemblyscript/loader";
import { TestZ80MachineState } from "../src/assembly";
import { TestMachine } from "../src/shared/test-machine"
import { RunMode } from "../src/shared/RunMode";

const wasmBin = fs.readFileSync(
  path.join(__dirname, "../build/optimized.wasm")
);
const module = loader.instantiateSync(wasmBin, { /* imports */ });
let wasm: Api;

describe("Test machine pool", () => {
  before(async () => {
    wasm = module as unknown as Api;
  });
  beforeEach(() => {
    wasm.resetTestMachinePool();
  });

  it("Creates the first test machine", () => {
    const machine = wasm.createTestMachine();
    expect(machine).toBe(0);
  });

  it("Can create all test machines", () => {
    const maxMachines = wasm.getTestMachinePoolMaxSize();
    for (let i = 0; i < maxMachines; i++) {
      const machine = wasm.createTestMachine();
      expect(machine).toBe(i);
    }
  });

  it("Cannot create more test machines when all allocated", () => {
    const maxMachines = wasm.getTestMachinePoolMaxSize();
    for (let i = 0; i < maxMachines; i++) {
      const machine = wasm.createTestMachine();
      expect(machine).toBe(i);
    }
    const machine = wasm.createTestMachine();
    expect(machine).toBe(-1);
  });

  it("Can release test machines", () => {
    const maxMachines = wasm.getTestMachinePoolMaxSize();
    for (let i = 0; i < maxMachines; i++) {
      const machine = wasm.createTestMachine();
      expect(machine).toBe(i);
    }
    const machine1 = Math.floor(maxMachines / 2);
    const machine2 = machine1 + 1;
    const release1 = wasm.releaseTestMachine(machine1);
    const release2 = wasm.releaseTestMachine(machine2);

    expect(release1).toBe(1);
    expect(release2).toBe(1);
  });

  it("Can reallocate test machines", () => {
    const maxMachines = wasm.getTestMachinePoolMaxSize();
    for (let i = 0; i < maxMachines; i++) {
      const machine = wasm.createTestMachine();
      expect(machine).toBe(i);
    }
    const machine1 = Math.floor(maxMachines / 2);
    const machine2 = machine1 + 1;
    wasm.releaseCpu(machine1);
    wasm.releaseCpu(machine2);
    const newMachine1 = Math.floor(maxMachines / 2);
    const newMachine2 = newMachine1 + 1;

    expect(newMachine1).toBe(machine1);
    expect(newMachine2).toBe(machine2);
  });

  it("Gets test machine", async () => {
    const machine = wasm.createTestMachine();
    const state = (module as any).TestZ80MachineState.wrap(
      (module as unknown as Api).getTestMachineState(machine)
    ) as TestZ80MachineState;
    expect(state.sp).toBe(0xffff);
  });

  it("Gets test machine memory", async () => {
    const machine = wasm.createTestMachine();
    const memptr = wasm.getTestMachineMemory(machine) as number;
    const memory = module.__getArray(memptr);
    console.log(memory);
  });

  it("Initializes code", async () => {
    const machine = new TestMachine(module);
    machine.initCode(RunMode.UntilEnd,
      [
        0x00,
        0x01,
        0x02,
        0x03
      ]);
    const memory = machine.memory;
    console.log(memory);
    machine.run();
    machine.release();
  });

});
