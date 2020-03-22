import { before } from "mocha";
import * as expect from "expect";
import * as fs from "fs";
import * as path from "path";

import { Api } from "../src/shared/api";
import { AsBind }  from "as-bind";

const wasmBin = fs.readFileSync(path.join(__dirname, "../build/optimized.wasm"));
let wasm: Api;

describe("test machine pool", () => {
  before(async () => {
    const asBindInstance = await AsBind.instantiate(wasmBin);
    wasm = asBindInstance.exports as Api;
  })
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
    const memory = wasm.getMemory(machine);
  });
});
