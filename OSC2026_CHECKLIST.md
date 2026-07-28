# OSC2026 Checklist

This checklist is based on the public OSC2026 site source and community CI
guidance checked during project setup.

- Public repository: ready for GitHub and GitLink.
- Default branch: intended to be `main`.
- License: Apache-2.0.
- README: includes project goal, usage, validation, scope and source statement.
- CI: `.github/workflows/test.yml`.
- Tests: `moon test --target wasm-gc`.
- Formatting: `moon fmt --check`.
- Warning gate: `moon check --target wasm-gc --deny-warn`.
- Interface generation: `moon info --target wasm-gc` plus committed
  `pkg.generated.mbti`.
- Contributors: real account owner only; no virtual contributor names.
- MoonBit source scale: core package is split across focused `.mbt` files and
  can grow through scene recipes/exporters without changing the public model.
- Ecosystem overlap check: mooncakes.io keyword checks did not reveal a mature
  synthetic vision fixture package with the same focus.
