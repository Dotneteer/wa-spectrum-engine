import * as fs from "fs";
import * as loader from "@assemblyscript/loader";
module.exports = loader.instantiateSync(fs.readFileSync(__dirname + "/build/optimized.wasm"), { /* imports */ });

