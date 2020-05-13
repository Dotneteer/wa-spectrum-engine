import { Api } from "./api";
import { ASUtil } from "@assemblyscript/loader";
import { ZxSpectrumType } from "./ZxSpectrumType";

export class TestSpectrum {
  /**
   * Initializes a test ZX Spectrum machine
   * @param moduleApi Module API obtained by the loader
   */
  constructor(
    public moduleApi: ASUtil & Api,
    public type: ZxSpectrumType = ZxSpectrumType.Spectrum48
  ) {
    this.init();
  }

  /**
   * Resets the test machine
   */
  init(): void {
    this.moduleApi.initSpectrumMachine(this.type);
  }

  /**
   * Resets the test machine
   */
  turnOn(): void {
    this.moduleApi.turnOnSpectrumMachine();
  }

  /**
   * Gets the current machine type
   */
  getMachineType(): ZxSpectrumType {
      return this.moduleApi.getCurrentMachineType();
  }
}
