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

  it("Generate paper table", () => {
    const colors: number[] = [];
    for (let b = 0; b < 0x100; b++) {
      const paper = (b & 0x78) >> 3;
      const ink = (b & 0x07) | ((b & 0x40) >> 3);
      colors[b] = b & 0x80 ? paper : ink
    }
                        
    console.log(colors)
    let vals = "";
    for (let i=0; i < colors.length; i++) {
      const val = colors[i]
      vals += `\\${(val < 16 ? "0" : "") + val.toString(16)}`;
    }
    let result = `(data (i32.const 0x07_6000) "${vals}")`
    console.log(result);
  });
});
