import * as fs from "fs";
import * as loader from "@assemblyscript/loader";

export const wasmBin = fs.readFileSync(__dirname + "/build/optimized.wasm");
export const module = loader.instantiateSync(wasmBin, { /* imports */ });



