import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import * as path from "path";

import { Api } from "../../src/shared/api";
import * as loader from "@assemblyscript/loader";
import { TestMachine } from "../../src/shared/test-machine";
import { TestZ80MachineState } from "../../src/assembly";

const wasmBin = fs.readFileSync(
  path.join(__dirname, "../../build/optimized.wasm")
);
const moduleInst = loader.instantiateSync(wasmBin, {}) as loader.ASUtil & Api;
const testMachine = new TestMachine(moduleInst);

describe("Indexed bit ops 80-bf (ix)", () => {
  beforeEach(() => {
    testMachine.reset();
  });

  const reg8 = ["b", "c", "d", "e", "h", "l", "(hl)", "a"];

  for (let q = 0; q <= 7; q++) {
    for (let n = 0; n <= 7; n++) {
      const opCode = 0x80 + n * 8 + q;
      it(`${opCode.toString(16)}: res ${n},(ix+D) #1`, () => {
        const OFFS = 0x32;
        let s = testMachine.initCode([0xdd, 0xcb, OFFS, opCode]);
        let m = testMachine.memory;
        s.ix = 0x1000;
        m[s.ix + OFFS] = 0xff;
        s.f &= 0xfe;
  
        s = testMachine.run(s, m);
        m = testMachine.memory;
  
        expect(m[s.ix + OFFS]).toBe(0xff & ~(1 << n));
        if (q !== 6) {
          expect(getReg8(s, q)).toBe(m[s.ix + OFFS]);
        }
        testMachine.shouldKeepRegisters(`F, ${reg8[q]}`);
        testMachine.shouldKeepMemory("1032");

        expect(s.pc).toBe(0x0004);
        expect(s.tactsL).toBe(23);
      });

      it(`${opCode.toString(16)}: res ${n},(ix+D) #2`, () => {
        const OFFS = 0x32;
        let s = testMachine.initCode([0xdd, 0xcb, OFFS, opCode]);
        let m = testMachine.memory;
        s.ix = 0x1000;
        m[s.ix + OFFS] = 0xaa;
        s.f &= 0xfe;
  
        s = testMachine.run(s, m);
        m = testMachine.memory;
  
        expect(m[s.ix + OFFS]).toBe(0xaa & ~(1 << n));
        if (q !== 6) {
          expect(getReg8(s, q)).toBe(m[s.ix + OFFS]);
        }
        testMachine.shouldKeepRegisters(`F, ${reg8[q]}`);
        testMachine.shouldKeepMemory("1032");

        expect(s.pc).toBe(0x0004);
        expect(s.tactsL).toBe(23);
      });
    }
  }
});

function getReg8(s: TestZ80MachineState, q: number): number {
  switch (q) {
    case 0:
      return s.b;
    case 1:
      return s.c;
    case 2:
      return s.d;
    case 3:
      return s.e;
    case 4:
      return s.h;
    case 5:
      return s.l;
    case 7:
      return s.a;
  }
  return 0;
}
