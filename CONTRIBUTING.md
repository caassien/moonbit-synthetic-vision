# Contributing

This repository is developed as a MoonBit OSC2026 entry. Contributions should
keep the package small, deterministic and easy to validate.

## Development Checks

Run these commands before submitting changes:

```bash
moon fmt --check
moon check --target wasm-gc --deny-warn
moon test --target wasm-gc
moon info --target wasm-gc
git diff --exit-code
```

## Scope

Good additions:

- New deterministic scene recipes.
- Exporters for simple, documented annotation formats.
- Tests for image geometry, seeding and serialization.
- Documentation that shows real commands and expected output shape.

Out of scope for now:

- Full image-processing frameworks.
- Native-only APIs.
- Heavy dependencies that make CI or mooncakes use harder.
- Generated assets checked into the repository without a clear purpose.

## Authorship

The project should keep real authorship only. Do not add placeholder,
bot-named, or virtual contributors.
