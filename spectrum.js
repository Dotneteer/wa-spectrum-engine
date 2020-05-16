const fs = require("fs");
const buffer = fs.readFileSync("./build/spectrum.wasm");
WebAssembly.instantiate(buffer)
  .then((results) => {
    instance = results.instance;
    console.log(instance.exports.getA());
    instance.exports.setA(123);
    console.log(instance.exports.getF());
    console.log(instance.exports.getAF());
    instance.exports.setF(6);
    console.log(instance.exports.getAF());
  })
  .catch(console.error);
