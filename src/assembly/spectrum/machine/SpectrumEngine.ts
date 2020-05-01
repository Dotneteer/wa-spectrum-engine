import { Z80Cpu } from "../../Z80Cpu";

/**
 * This class represents a ZX Spectrum engine
 */
export class SpectrumEngine {
  private _cpu: Z80Cpu;

  constructor() {
    this._cpu = new Z80Cpu();
  }
}
