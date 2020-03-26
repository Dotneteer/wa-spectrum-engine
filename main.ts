import * as fs from "fs";
import * as loader from "@assemblyscript/loader";

const importObject = { env: { abort: () => console.log("Abort!") }};
export const wasmBin = fs.readFileSync(__dirname + "/build/optimized.wasm");
export const module = loader.instantiateSync(wasmBin, importObject);
