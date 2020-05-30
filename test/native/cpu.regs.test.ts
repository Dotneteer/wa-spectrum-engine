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

  it("Generate flags table", () => {
    const sraFlags: number[] = [];
    for (let b = 0; b < 0x100; b++) {
      let sraVal = b;
      let cf = (sraVal & 0x01) !== 0 ? FlagsSetMask.C : 0;
      sraVal = (sraVal >> 1) + (sraVal & 0x80);
      let p = FlagsSetMask.PV;
      for (let i = 0x80; i !== 0; i /= 2) {
        if ((sraVal & i) !== 0) {
          p ^= FlagsSetMask.PV;
        }
      }
      let flags =
        ((sraVal & (FlagsSetMask.S | FlagsSetMask.R5 | FlagsSetMask.R3)) | p | cf) &
        0xff;
      if ((sraVal & 0xff) === 0) {
        flags |= FlagsSetMask.Z;
      }
      sraFlags[b] = flags & 0xff;
    }
                        
    console.log(sraFlags)
    let vals = "";
    for (let i=0; i < sraFlags.length; i++) {
      const val = sraFlags[i]
      vals += `\\${(val < 16 ? "0" : "") + val.toString(16)}`;
    }
    let result = `(data (i32.const 0x1_1400) "${vals}")`
    console.log(result);
  });
});
