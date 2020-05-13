import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import * as path from "path";

import { Api } from "../../src/shared/api";
import * as loader from "@assemblyscript/loader";
import { TestSpectrum } from "../../src/shared/test-spectrum";
import { ZxSpectrumType } from "../../src/shared/ZxSpectrumType";

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
});
