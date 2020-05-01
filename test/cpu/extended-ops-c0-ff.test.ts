import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import * as path from "path";

import { Api } from "../../src/shared/api";
import * as loader from "@assemblyscript/loader";
import { TestMachine } from "../../src/shared/test-machine";

const wasmBin = fs.readFileSync(
  path.join(__dirname, "../../build/optimized.wasm")
);
const moduleInst = loader.instantiateSync(wasmBin, {}) as loader.ASUtil & Api;
const testMachine = new TestMachine(moduleInst);

describe("Extended ops c0-ff", () => {
  beforeEach(() => {
    testMachine.reset();
  });

  for (let i = 0xc0; i <= 0xff; i++) {
    it(`${i.toString(16)}: nop`, () => {
      let s = testMachine.initCode([0xed, i]);

      s = testMachine.run();

      testMachine.shouldKeepRegisters();
      testMachine.shouldKeepMemory();
      expect(s.pc).toBe(0x0002);
      expect(s.tactsL).toBe(8);
    });
  }
});
