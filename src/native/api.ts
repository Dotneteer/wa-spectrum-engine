/**
 * Represents the CPU API
 */
export interface CpuApi {
  turnOnCpu(): void;
  resetMemory(): void;
  memory: any;
  getA(): number;
  setA(val: number): void;
  getF(): number;
  setF(val: number): void;
  getAF(): number;
  getB(): number;
  setB(val: number): void;
  getC(): number;
  setC(val: number): void;
  getBC(): number;
  setBC(val: number): number;
  getD(): number;
  setD(val: number): void;
  getE(): number;
  setE(val: number): void;
  getDE(): number;
  setDE(val: number): number;
  getH(): number;
  setH(val: number): void;
  getL(): number;
  setL(val: number): void;
  getHL(): number;
  setHL(val: number): number;
  getI(): number;
  setI(val: number): void;
  getR(): number;
  setR(val: number): void;
  getPC(): number;
  setPC(val: number): void;
  getSP(): number;
  setSP(val: number): void;
  getXH(): number;
  setXH(val: number): void;
  getXL(): number;
  setXL(val: number): void;
  getIX(): number;
  setIX(val: number): number;
  getYH(): number;
  setYH(val: number): void;
  getYL(): number;
  setYL(val: number): void;
  getIY(): number;
  setIY(val: number): number;
  getWH(): number;
  setWH(val: number): void;
  getWL(): number;
  setWL(val: number): void;
  getWZ(): number;
  setWZ(val: number): number;
}
