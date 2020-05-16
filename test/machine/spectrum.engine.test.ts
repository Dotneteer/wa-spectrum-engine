import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import * as path from "path";

import { Api } from "../../src/shared/api";
import * as loader from "@assemblyscript/loader";
import { TestSpectrum } from "../../src/shared/test-spectrum";
import { ZxSpectrumType } from "../../src/shared/ZxSpectrumType";
import { ExecuteCycleOptions } from "../../src/assembly/spectrum/machine/ExecuteCycleOptions";
import { EmulationMode } from "../../src/assembly/spectrum/machine/EmulationMode";
import { DebugStepMode } from "../../src/assembly/spectrum/machine/DebugStepMode";

const wasmBin = fs.readFileSync(
  path.join(__dirname, "../../build/optimized.wasm")
);
const moduleInst = loader.instantiateSync(wasmBin, {}) as loader.ASUtil & Api;
const spectrumMachine = new TestSpectrum(moduleInst);


describe("Execution cycle", () => {
  beforeEach(() => {
    spectrumMachine.init();
  });

  it("Turn on", () => {
    spectrumMachine.init();
    spectrumMachine.turnOn();
  });

  it("Init", () => {
    spectrumMachine.init();
  });

  it("Get machine type", () => {
    const type = spectrumMachine.getMachineType();
    expect(type).toBe(ZxSpectrumType.Spectrum48);
  });

  it("Get machine state", () => {
    const state = spectrumMachine.getMachineState();
    state.screenState.screenPixelBuffer = new Uint8Array(0);
    console.log(JSON.stringify(state, null, 2));
    expect(state.type).toBe("48");
  });

  it("ExecuteCycle", () => {
    const options: ExecuteCycleOptions = {
      emulationMode: EmulationMode.UntilUlaFrameEnds,
      debugStepMode: DebugStepMode.StopAtBreakpoint,
      fastTapeMode: false,
      fastVmMode: false,
      disableScreenRendering: false,
      terminationRom: 0,
      terminationPoint: 0,
      timeoutTacts: 0
    };
    const start = Date.now().valueOf();
    for (let i = 0; i < 200; i++) {
      spectrumMachine.executeCycle(options);
    }
    console.log(Date.now().valueOf() - start);
    const state = spectrumMachine.getMachineState();
    state.screenState.screenPixelBuffer = new Uint8Array(0);
    console.log(JSON.stringify(state, null, 2));
  });
});
