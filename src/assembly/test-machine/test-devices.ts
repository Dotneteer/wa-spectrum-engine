// ============================================================================
// Memory device used for testing

import { Z80Cpu } from "../Z80Cpu";

/**
 * The 64K memory addressed by Z80 CPU
 */
export const simpleMemory: Uint8Array = new Uint8Array(0x10000);

/**
 * Memory access operation log
 */
export let memoryAccessLog: MemoryOp[] = [];

/**
 * Fills the entire memory with 0xff
 */
export function resetMemory(): void {
  for (let i = 0; i < 0x10000; i++) {
    simpleMemory[i] = 0xff;
  }
  clearMemoryAccessLog();
}

let cpu: Z80Cpu;

/**
 * Sets the host CPU
 * @param hostCpu Host CPU instance
 */
export function setHostCpu(hostCpu: Z80Cpu): void {
  cpu = hostCpu;
}

/**
 * Clears the memory access log.
 */
export function clearMemoryAccessLog(): void {
  memoryAccessLog = [];
}

/**
 * Memory write operation
 * @param address Memory address
 * @param value Value to write
 */
export function writeSimpleMemory(address: u16, value: u8, suppress: bool): void {
  simpleMemory[address] = value;
  memoryAccessLog.push({
    address,
    value,
    isWrite: true,
  });
}

/**
 * Memory read operation
 * @param address Memory address
 * @returns Memory contents
 */
export function readSimpleMemory(address: u16, suppress: bool): u8 {
  const value = simpleMemory[address];
  memoryAccessLog.push({
    address,
    value,
    isWrite: false,
  });
  return value;
}

/**
 * Represents data in a particular memory operation
 */
export class MemoryOp {
  address: u16;
  value: u8;
  isWrite: bool;
}

// ============================================================================
// I/O device used for testing

let fakeInput: Uint8Array = new Uint8Array(0);
let inputIndex = -1;

/**
 * I/O access operation log
 */
export let ioAccessLog: IoOp[] = [];

/**
 * Clears the I/O access log
 */
export function clearIoAccessLog(): void {
  ioAccessLog = [];
}

/**
 * Sets the I/O input to use in the test machine
 * @param input Array of input bytes to use
 */
export function setTestInput(input: Uint8Array): void {
  if (input.length > 0) {
    fakeInput = input;
    inputIndex = 0;
  }
}

/**
 * Writes an I/O port
 * @param address I/O address
 * @param value Output value
 */
export function writeSimpleIo(address: u16, value: u8): void {
  ioAccessLog.push({
    address,
    value,
    isOutput: true,
  });
  cpu.delay(4);
}

/**
 * Reads an I/O port
 * @param address I/O address
 */
export function readSimpleIo(address: u16): u8 {
  const value =
    inputIndex < 0 || inputIndex >= fakeInput.length
      ? <u8>0xff
      : <u8>fakeInput[inputIndex++];
  cpu.delay(4);
  ioAccessLog.push({
    address,
    value,
    isOutput: false,
  });
  return value;
}

/**
 * Represents data in a particular I/O operation
 */
export class IoOp {
  address: u16;
  value: u8;
  isOutput: bool;
}

// ============================================================================
// TBBlue device used for testing

/**
 * The TBBlue access log
 */
export let tbBlueAccessLog: TbBlueOp[] = [];

/**
 * Clears the TBBLUE access log
 */
export function clearTbBlueAccessLog(): void {
  tbBlueAccessLog = [];
}

/**
 * Sets the index of a TBBLUE register
 * @param index Index to write out
 */
export function simpleWriteTbBlueIndex(index: u8): void {
  tbBlueAccessLog.push({
    isIndex: true,
    data: index
  });
}

/**
 * Sets the value of a TBBLUE register
 * @param value Value to write out
 */
export function simpleWriteTbBlueValue(value: u8): void {
  tbBlueAccessLog.push({
    isIndex: false,
    data: value
  });
}

/**
 * Represents information for a TBBlue operation
 */
export class TbBlueOp {
  isIndex: bool;
  data: u8;  
}

