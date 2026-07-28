# moonbit-synthetic-vision

Synthetic vision fixtures for MoonBit projects.

`moonbit-synthetic-vision` generates small, deterministic visual assets for
calibration, detection, segmentation, optical-flow smoke tests and image
pipeline benchmarks. The library is intentionally lightweight: it writes plain
PGM/PPM text images and structured annotations that are easy to diff in tests,
store in repositories, or convert later with external tools.

## Why this project

MoonBit's ecosystem is still early in computer-vision tooling. Before choosing
this topic, I checked mooncakes.io with keywords such as `vision`, `image`,
`synthetic`, `ppm`, `calibration`, and `dataset`. The visible results did not
show a mature package that focuses on reproducible synthetic vision test data.

This project therefore avoids competing with a broad image-processing library.
Its scope is narrower than OpenCV-style processing, but broad enough to grow:
more scene recipes, exporters, distortion models, annotation formats, and
benchmark presets can be added without changing the core image model.

## Current Features

- Gray and RGB image buffers with safe bounds checks.
- PGM/PPM export and compact ASCII previews.
- Checkerboards, calibration boards, dot grids and gradients.
- Rectangle, circle and line drawing primitives.
- Seeded synthetic target scenes.
- Uniform noise, salt-and-pepper noise, occlusion, box blur and horizontal
  motion blur.
- Bounding boxes, keypoints, segmentation masks and regular optical-flow
  vectors.
- Dataset manifests for generated assets.
- A runnable CLI preview.

## Quick Start

```bash
moon check --target wasm-gc
moon test --target wasm-gc
moon run --target wasm-gc cmd/main
```

The CLI prints a JSON manifest and an ASCII preview of one generated scene.

## Minimal API Example

```mbt check
test "build a checkerboard fixture" {
  let image = checkerboard(Size::new(width=8, height=8), 2)
  inspect(image.width, content="8")
  inspect(image.get(0, 0).value, content="0")
  inspect(image.get(2, 0).value, content="255")
}
```

```mbt check
test "create a detection suite manifest" {
  let plans = default_suite(size=Size::new(width=64, height=48))
  let manifest = suite_manifest(plans, prefix="fixtures")
  inspect(manifest.assets.length(), content="8")
}
```

## Repository Layout

- `types.mbt`: geometry, color and numeric helpers.
- `image.mbt`: gray/RGB image buffers and pixel operations.
- `draw.mbt`: line, rectangle and circle drawing.
- `patterns.mbt`: calibration and procedural patterns.
- `effects.mbt`: noise, blur and occlusion transforms.
- `annotation.mbt`: boxes, keypoints, masks and flow vectors.
- `manifest.mbt`: dataset manifest serialization.
- `suite.mbt`: reusable scene recipes.
- `cmd/main`: CLI preview.
- `vision_wbtest.mbt`: regression tests.

## Validation

The intended CI gate is:

```bash
moon fmt --check
moon check --target wasm-gc --deny-warn
moon test --target wasm-gc
moon info --target wasm-gc --deny-warn
```

The local toolchain used during development is `moon 0.1.20260713`. It is newer
than the competition note that recommended MoonBit 0.10.3, so the repository is
kept aligned with the latest installed formatter and warning behavior.

## OSC2026 Notes

The project is prepared for the MoonBit Open Source Ecosystem Competition 2026:

- Public repository with a standard OSI license.
- Original MoonBit source by the account owner, without generated or virtual
  contributors.
- Runnable tests and CI workflow.
- Clear source statement and maintainable package boundaries.
- Reusable ecosystem value rather than a one-off demo.

## Source Statement

The MoonBit implementation in this repository is original work for OSC2026. It
is inspired by common computer-vision testing needs such as calibration boards,
synthetic detection scenes and optical-flow fixtures, but it does not copy code
from OpenCV, scikit-image, image libraries, or existing mooncakes packages.

## License

Apache-2.0.
