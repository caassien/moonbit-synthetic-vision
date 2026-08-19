// Learn more about moon.mod configuration:
// https://docs.moonbitlang.com/en/latest/toolchain/moon/module.html
//
// To add a dependency, run this command in your terminal:
//   moon add moonbitlang/x
//
// Or manually declare it in `import`, for example:
// import {
//   "moonbitlang/x@0.4.6",
// }

name = "caassien/moonbit-synthetic-vision"

version = "0.2.0"

readme = "README.mbt.md"

repository = "https://github.com/caassien/moonbit-synthetic-vision"

license = "Apache-2.0"

keywords = [
  "vision",
  "synthetic-data",
  "testing",
  "calibration",
  "image",
  "benchmark",
]

preferred_target = "wasm-gc"

description = "Deterministic synthetic vision fixtures, annotations, and benchmarks for MoonBit."
