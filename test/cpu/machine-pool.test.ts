import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import * as path from "path";

import { Api } from "../../src/shared/api";
import * as loader from "@assemblyscript/loader";
import { TestMachine } from "../../src/shared/test-machine";
import { RunMode } from "../../src/shared/RunMode";

const wasmBin = fs.readFileSync(
  path.join(__dirname, "../../build/optimized.wasm")
);
const moduleInst = loader.instantiateSync(wasmBin, {
  /* imports */
}) as (loader.ASUtil  & Api);
const testMachine = new TestMachine(moduleInst);

describe("Test machine", () => {

  it("Init test machine", async () => {
    const state = testMachine.reset();
    expect(state.sp).toBe(0xffff);
    expect(state.af).toBe(0xffff);
  });

  it("Update test machine state works with A", async () => {
    let state = testMachine.cpuState;
    state.a = 0x12;
    state.bc = 0x34ac;
    testMachine.cpuState = state;
    let state1 = testMachine.cpuState;
    expect(state1.a).toBe(0x12);
    expect(state1.bc).toBe(0x34ac);
    const memory = testMachine.memory;
    console.log(memory);
    memory[2] = 100;
    testMachine.memory = memory;
    console.log(testMachine.memory);
  });

  it("Initializes code", async () => {
    testMachine.initCode(
      [
        0x00,
        0x01,
        0x02,
        0x03
      ]);
    let memory = testMachine.memory;
    const state = testMachine.run();
    console.log(memory)
  });

  it("creates jump table", () => {
    let str = "";
    for (let i = 0; i < 0x100; i++) {
      str += `  /* 0x${i < 16 ? "0" : ""}${i.toString(16)} */ null,\r\n`;
    }
    console.log(str);
  });


});
