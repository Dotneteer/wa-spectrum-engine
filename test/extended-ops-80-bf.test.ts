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
const moduleInst = loader.instantiateSync(wasmBin, {}) as loader.ASUtil & Api;
const testMachine = new TestMachine(moduleInst);

describe("Extended ops 80-bf", () => {
  beforeEach(() => {
    testMachine.reset();
  });
  it("98: jp (c)", () => {
    testMachine.enableExtendedInstructions();
    testMachine.initInput([0xd5]);
    let s = testMachine.initCode([0xed, 0x98]);
    s.bc = 0x10ff;
    s = testMachine.run(s);

    expect(s.pc).toBe(0x3540);
    testMachine.shouldKeepRegisters();
    testMachine.shouldKeepMemory();
    expect(s.tactsL).toBe(13);
  });

  it("98: jp (c) need extset", () => {
    let s = testMachine.initCode([0xed, 0x98]);
    s = testMachine.run(s);
    testMachine.shouldKeepRegisters();
    testMachine.shouldKeepMemory();
    expect(s.pc).toBe(0x0002);
    expect(s.tactsL).toBe(8);
  });
});
