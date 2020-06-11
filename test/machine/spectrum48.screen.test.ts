import "mocha";
import * as expect from "expect";
import * as fs from "fs";
import { MachineApi } from "../../src/native/api";
import { ZxSpectrum48 } from "../../src/native/ZxSpectrum48";
import {
  ExecuteCycleOptions,
  EmulationMode,
} from "../../src/native/machine-state";
import { MemoryHelper } from "../../src/native/memory-helpers";

const buffer = fs.readFileSync("./build/spectrum.wasm");
let api: MachineApi;
let machine: ZxSpectrum48;

const PIXEL_BUFFER = 0x07_7600;

describe("ZX Spectrum 48 - Screen", () => {
  before(async () => {
    const wasm = await WebAssembly.instantiate(buffer, {
      imports: { trace: (arg: number) => console.log(arg) },
    });
    api = (wasm.instance.exports as unknown) as MachineApi;
    machine = new ZxSpectrum48(api);
  });

  beforeEach(() => {
    machine.reset();
  });

  it("ULA frame tact is OK", () => {
    const s = machine.getMachineState();
    expect(s.tactsInFrame).toBe(69888);
  });

  it("Flash toggle rate is OK", () => {
    const s = machine.getMachineState();
    expect(s.flashFrames).toBe(25);
  });

  it("Setting border value does not change invisibla area", () => {
    machine.injectCode([
      0xf3, // DI
      0x3e,
      0x05, // LD A,$05
      0xd3,
      0xfe, // OUT ($FE),A
      0x01,
      0x10,
      0x00, // LD BC,$0010
      0x0b, // DECLB: DEC BC
      0x78, // LD A,B
      0xb1, // OR C
      0x20,
      0xfb, // JR NZ,DECLB
      0xfb, // EI
      0x76, // HALT
    ]);

    fillPixelBuffer(0xff);
    machine.executeCycle(new ExecuteCycleOptions(EmulationMode.UntilHalt));
    const s = machine.getMachineState();
    console.log(s.tacts);
  });
});

/**
 * 
 * @param data Pixel buffer data
 */
function fillPixelBuffer(data: number): void {
  const s = machine.getMachineState();
  const mh = new MemoryHelper(api, PIXEL_BUFFER);
  const visibleLines =
    s.screenLines - s.nonVisibleBorderTopLines - s.nonVisibleBorderTopLines;
  const visibleColumns = (s.screenLineTime - s.nonVisibleBorderRightTime) * 2;
  const pixels = visibleLines * visibleColumns;
  for (let i = 0; i < pixels; i++) {
    mh.writeByte(i, data);
  }
}
