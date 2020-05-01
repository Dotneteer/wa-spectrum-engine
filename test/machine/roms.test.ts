import "mocha";
import * as fs from "fs";
import * as path from "path";

describe("ROM", () => {
  it("Create ROM", () => {
    const romFile = path.join(__dirname, "../../roms/ZxSpectrum48/ZxSpectrum48.rom");
    const contents = fs.readFileSync(romFile);
    let result = "export const ZX_SPECTRUM_48_ROM: u8[] = [";
    for (let i = 0; i < contents.length; i++) {
        result += toHexa(contents[i]);
    }
    result += "]";
    console.log(result);
  });
});

function toHexa(n: number): string {
    return `0x${n < 16 ? "0" + n.toString(16) : n.toString(16)},`
}