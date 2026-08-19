# moonbit-synthetic-vision

Deterministic synthetic vision fixtures for MoonBit.

The library generates small, reviewable image assets and ground-truth
annotations for computer-vision algorithms, image pipelines, calibration
examples, tutorials, and continuous-integration regression tests. It is
deliberately focused on reproducible fixtures rather than a general-purpose
image-processing framework.

## Core capabilities

- Gray and RGB image buffers with safe access, cropping, padding, tiling,
  resizing, rotation, channel conversion, and PGM/PPM export.
- Procedural calibration boards, checkerboards, dot grids, gradients, target
  scenes, and deterministic noise/blur/occlusion effects.
- Drawing primitives, thresholding, morphology, Sobel edge maps, contrast
  transforms, and integer translation.
- Bounding boxes, labels, keypoints, masks, optical-flow vectors, YOLO text,
  and scene-level annotation summaries.
- Dataset manifests, tag filtering, deterministic train/validation/holdout
  splitting, and a runnable suite renderer.
- Image statistics and comparison metrics including MAE, MSE, PSNR, histogram,
  dynamic range, and constant-image checks.

## Quick start

~~~bash
moon check --target wasm-gc --deny-warn
moon test --target wasm-gc
moon run --target wasm-gc cmd/main
~~~

The preview command prints a JSON manifest and an ASCII rendering. The
benchmark command exercises the complete default suite:

~~~bash
moon run --target native cmd/bench
~~~

## CLI

cmd/main is a human-readable preview for smoke testing. cmd/bench renders the
eight default scene recipes at 160×120 and prints deterministic workload
counters and a pixel checksum. These commands do not require external image
libraries or network access.

## API example

~~~mbt nocheck
///|
test "build a checkerboard fixture" {
  let image = checkerboard(Size::new(width=8, height=8), 2)
  inspect(image.width, content="8")
  inspect(image.get(0, 0).value, content="0")
  inspect(image.get(2, 0).value, content="255")
}
~~~

## Architecture

The root package is intentionally dependency-light and split by responsibility:

| File | Responsibility |
| --- | --- |
| types.mbt | geometry, colors, sizes, and numeric helpers |
| image.mbt / export.mbt | image buffers and text exporters |
| draw.mbt / patterns.mbt | drawing and procedural scenes |
| effects.mbt / transform.mbt | noise, blur, morphology, and transforms |
| annotation.mbt / geometry_extra.mbt | annotations, masks, boxes, and flow |
| manifest.mbt / dataset_ops.mbt | manifests, splits, and dataset operations |
| analytics.mbt | image statistics and comparison metrics |
| suite.mbt | reusable recipes and rendering |
| cmd/main / cmd/bench | preview and benchmark executables |

## Benchmarks

Run the benchmark on the same toolchain and machine when comparing changes:

~~~text
suite=8
pixels=149987
boxes=5
checksum=22085168
mean=127
~~~

The counters and checksum are deterministic correctness signals. Wall-clock
time is environment-dependent; record it separately when publishing results.

## Testing and CI

Local validation:

~~~bash
moon fmt --check
moon check --target wasm-gc --deny-warn
moon check --target native --deny-warn
moon test --target wasm-gc --deny-warn
moon test --target native --deny-warn
moon info
git diff --exit-code
~~~

GitHub Actions runs formatting, warning denial, interface regeneration, tests
and coverage on the supported WebAssembly and native targets. Generated
pkg.generated.mbti files are checked so public API drift is visible in code
review.

## Development

See CONTRIBUTING.md for formatting, testing, package boundaries, and
pull-request expectations. CHANGELOG.md records user-visible changes and
ROADMAP.md tracks future fixture formats and integrations.

## License

Apache-2.0. See LICENSE.
