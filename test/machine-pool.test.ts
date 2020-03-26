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
    // wasm.resetTestMachinePool();
  });

  it("Gets test machine", async () => {
    // const machine = wasm.createTestMachine();
    // const state = (module as any).TestZ80MachineState.wrap(
    //   (module as unknown as Api).getTestMachineState(machine)
    // ) as TestZ80MachineState;
    // expect(state.sp).toBe(0xffff);
  });

  it("Gets test machine memory", async () => {
    // const machine = wasm.createTestMachine();
    // const memptr = wasm.getTestMachineMemory(machine) as number;
    // const memory = module.__getArray(memptr);
    // console.log(memory);
  });

  it("Initializes code", async () => {
    // const machine = new TestMachine(module);
    // machine.initCode(RunMode.UntilEnd,
    //   [
    //     0x00,
    //     0x01,
    //     0x02,
    //     0x03
    //   ]);
    // let memory = machine.memory;
    // console.log(memory);
    // const state = machine.run();
    // memory = machine.memory;
    // console.log(memory);
    // machine.release();
  });

});
