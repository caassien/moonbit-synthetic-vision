///|
test "checkerboard is deterministic" {
  let size = Size::new(width=4, height=4)
  let image = checkerboard(size, 2)
  inspect(image.get(0, 0).value, content="0")
  inspect(image.get(2, 0).value, content="255")
  inspect(image.get(0, 2).value, content="255")
  inspect(image.get(3, 3).value, content="0")
}

///|
test "calibration board keeps requested margin" {
  let image = calibration_board(cols=3, rows=2, cell=4, margin=2)
  inspect(image.width, content="16")
  inspect(image.height, content="12")
  inspect(image.get(0, 0).value, content="220")
  inspect(image.get(2, 2).value, content="0")
}

///|
test "pgm export contains stable header and pixels" {
  let image = GrayImage::new(width=2, height=1)
  image.set(0, 0, Gray::new(7))
  image.set(1, 0, Gray::new(250))
  inspect(image.to_pgm(), content="P2\n2 1\n255\n7 250\n")
}

///|
test "rgb conversion exports ppm triples" {
  let image = GrayImage::new(width=1, height=1, fill=Gray::new(42))
  inspect(
    RgbImage::from_gray(image).to_ppm(),
    content="P3\n1 1\n255\n42 42 42\n",
  )
}

///|
test "noise is seeded and preserves dimensions" {
  let image = gradient(Size::new(width=8, height=4))
  let a = add_uniform_noise(image, seed=123, magnitude=9)
  let b = add_uniform_noise(image, seed=123, magnitude=9)
  inspect(a.width, content="8")
  inspect(a.height, content="4")
  inspect(a.pixels == b.pixels, content="true")
}

///|
test "motion blur preserves total shape" {
  let image = checkerboard(Size::new(width=6, height=3), 1)
  let blurred = motion_blur_x(image, 1)
  inspect(blurred.width, content="6")
  inspect(blurred.height, content="3")
  inspect(blurred.pixels.length(), content="18")
}

///|
test "mask fills clipped rectangles" {
  let mask = Mask::new(width=4, height=3)
  mask.fill_rect(Rect::new(x=1, y=1, width=5, height=5), 9)
  debug_inspect(mask.values, content="[0, 0, 0, 0, 0, 9, 9, 9, 0, 9, 9, 9]")
}

///|
test "yolo export is normalized to thousandths" {
  let label = Label::new(id=2, name="box")
  let box = Box2D::new(label~, rect=Rect::new(x=10, y=20, width=30, height=40))
  inspect(
    box.to_yolo(Size::new(width=100, height=200)),
    content="2 0.250 0.200 0.300 0.200",
  )
}

///|
test "default suite has broad coverage" {
  let plans = default_suite(size=Size::new(width=64, height=48))
  inspect(plans.length(), content="8")
  inspect(asset_kind_name(plans[5].kind), content="noise")
}

///|
test "manifest escapes json strings" {
  let manifest = DatasetManifest::new(name="demo \"set\"")
  manifest.add(
    Asset::new(
      name="sample",
      image_path="out/a.pgm",
      annotation_path="out/a.json",
      tags=["a", "b"],
    ),
  )
  inspect(manifest.to_json().contains("demo \\\"set\\\""), content="true")
}

///|
test "render plan returns annotations for detection" {
  let plan = ScenePlan::new(
    name="det",
    kind=Detection,
    size=Size::new(width=80, height=60),
  )
  let out = render_plan(plan)
  inspect(out.boxes.length(), content="2")
  inspect(out.image.width, content="80")
}

///|
test "constant flow samples a regular grid" {
  let flow = constant_flow(Size::new(width=5, height=5), 2, dx=1, dy=-1)
  inspect(flow.length(), content="9")
  debug_inspect(flow[0], content="{ x: 0, y: 0, dx: 1, dy: -1 }")
}

///|
test "geometry and dataset operations are deterministic" {
  let left = Rect::new(x=0, y=0, width=10, height=10)
  let right = Rect::new(x=5, y=5, width=10, height=10)
  inspect(left.iou(right), content="142")
  let manifest = suite_manifest(
    default_suite(size=Size::new(width=32, height=24)),
  )
  let split = split_manifest(manifest, 700, 150)
  inspect(split.total(), content="8")
  assert_true(manifest.has_unique_names())
}

///|
test "statistics and RGB channels preserve useful signals" {
  let image = GrayImage::new(width=2, height=2, fill=Gray::new(10))
  image.set(1, 1, Gray::new(250))
  inspect(image.stats().min, content="10")
  inspect(image.stats().max, content="250")
  inspect(image.mean_abs_error(image), content="0")
  let rgb = RgbImage::from_gray(image).replace_channel(0, 200)
  inspect(rgb.grayscale().get(0, 0).value, content="66")
  inspect(rgb.channel_histogram(0, 2)[1], content="4")
}

///|
test "masks and transformed annotations stay bounded" {
  let size = Size::new(width=8, height=6)
  let mask = Rect::new(x=2, y=1, width=4, height=3).to_mask(size, 3)
  inspect(mask.bounding_box(3).x, content="2")
  inspect(mask.bounding_box(3).height, content="3")
  let label = Label::new(id=1, name="target")
  let box = Box2D::new(label~, rect=Rect::new(x=1, y=1, width=3, height=3))
  let shifted = transform_boxes([box], Point::new(x=2, y=0), size)
  inspect(shifted[0].center().x, content="4")
  inspect(shifted[0].center().y, content="2")
  assert_true(mask_iou(mask, mask, 3) == 1000)
}
