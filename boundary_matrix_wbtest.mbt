///|
test "boundary matrix 000" {
  let size = Size::new(width=0, height=0)
  let image = GrayImage::new(width=0, height=0, fill=Gray::new(0))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 0 })
  let edges = image.edge_map(0)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 001" {
  let size = Size::new(width=1, height=3)
  let image = GrayImage::new(width=1, height=3, fill=Gray::new(11))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=1, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=7), 1)
  assert_true(mask.count(1) == 3)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 3 })
  let edges = image.edge_map(17)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 002" {
  let size = Size::new(width=2, height=6)
  let image = GrayImage::new(width=2, height=6, fill=Gray::new(22))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=2, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=10), 2)
  assert_true(mask.count(2) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 6 })
  let edges = image.edge_map(34)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 003" {
  let size = Size::new(width=3, height=1)
  let image = GrayImage::new(width=3, height=1, fill=Gray::new(33))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=3, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=5), 3)
  assert_true(mask.count(3) == 3)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 1 })
  let edges = image.edge_map(51)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 004" {
  let size = Size::new(width=4, height=4)
  let image = GrayImage::new(width=4, height=4, fill=Gray::new(44))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=4, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=8), 4)
  assert_true(mask.count(4) == 16)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 4 })
  let edges = image.edge_map(68)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 005" {
  let size = Size::new(width=5, height=7)
  let image = GrayImage::new(width=5, height=7, fill=Gray::new(55))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=5, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=11), 0)
  assert_true(mask.count(0) == 35)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 7 })
  let edges = image.edge_map(85)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 006" {
  let size = Size::new(width=6, height=2)
  let image = GrayImage::new(width=6, height=2, fill=Gray::new(66))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=6, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=6), 1)
  assert_true(mask.count(1) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 2 })
  let edges = image.edge_map(102)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 007" {
  let size = Size::new(width=7, height=5)
  let image = GrayImage::new(width=7, height=5, fill=Gray::new(77))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=7, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=9), 2)
  assert_true(mask.count(2) == 35)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 5 })
  let edges = image.edge_map(119)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 008" {
  let size = Size::new(width=8, height=0)
  let image = GrayImage::new(width=8, height=0, fill=Gray::new(88))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=8, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 0 })
  let edges = image.edge_map(136)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 009" {
  let size = Size::new(width=0, height=3)
  let image = GrayImage::new(width=0, height=3, fill=Gray::new(99))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=7), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 3 })
  let edges = image.edge_map(153)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 010" {
  let size = Size::new(width=1, height=6)
  let image = GrayImage::new(width=1, height=6, fill=Gray::new(110))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=1, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=10), 0)
  assert_true(mask.count(0) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 6 })
  let edges = image.edge_map(170)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 011" {
  let size = Size::new(width=2, height=1)
  let image = GrayImage::new(width=2, height=1, fill=Gray::new(121))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=2, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=5), 1)
  assert_true(mask.count(1) == 2)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 1 })
  let edges = image.edge_map(187)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 012" {
  let size = Size::new(width=3, height=4)
  let image = GrayImage::new(width=3, height=4, fill=Gray::new(132))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=3, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=8), 2)
  assert_true(mask.count(2) == 12)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 4 })
  let edges = image.edge_map(204)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 013" {
  let size = Size::new(width=4, height=7)
  let image = GrayImage::new(width=4, height=7, fill=Gray::new(143))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=4, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=11), 3)
  assert_true(mask.count(3) == 28)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 7 })
  let edges = image.edge_map(221)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 014" {
  let size = Size::new(width=5, height=2)
  let image = GrayImage::new(width=5, height=2, fill=Gray::new(154))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=5, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=6), 4)
  assert_true(mask.count(4) == 10)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 2 })
  let edges = image.edge_map(238)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 015" {
  let size = Size::new(width=6, height=5)
  let image = GrayImage::new(width=6, height=5, fill=Gray::new(165))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=6, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=9), 0)
  assert_true(mask.count(0) == 30)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 5 })
  let edges = image.edge_map(255)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 016" {
  let size = Size::new(width=7, height=0)
  let image = GrayImage::new(width=7, height=0, fill=Gray::new(176))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=7, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 0 })
  let edges = image.edge_map(12)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 017" {
  let size = Size::new(width=8, height=3)
  let image = GrayImage::new(width=8, height=3, fill=Gray::new(187))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=8, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=7), 2)
  assert_true(mask.count(2) == 24)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 3 })
  let edges = image.edge_map(29)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 018" {
  let size = Size::new(width=0, height=6)
  let image = GrayImage::new(width=0, height=6, fill=Gray::new(198))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=10), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 6 })
  let edges = image.edge_map(46)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 019" {
  let size = Size::new(width=1, height=1)
  let image = GrayImage::new(width=1, height=1, fill=Gray::new(209))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 1)
  let mask = Mask::new(width=1, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=5), 4)
  assert_true(mask.count(4) == 1)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 1 })
  let edges = image.edge_map(63)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 020" {
  let size = Size::new(width=2, height=4)
  let image = GrayImage::new(width=2, height=4, fill=Gray::new(220))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=2, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=8), 0)
  assert_true(mask.count(0) == 8)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 4 })
  let edges = image.edge_map(80)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 021" {
  let size = Size::new(width=3, height=7)
  let image = GrayImage::new(width=3, height=7, fill=Gray::new(231))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=3, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=11), 1)
  assert_true(mask.count(1) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 7 })
  let edges = image.edge_map(97)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 022" {
  let size = Size::new(width=4, height=2)
  let image = GrayImage::new(width=4, height=2, fill=Gray::new(242))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=4, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=6), 2)
  assert_true(mask.count(2) == 8)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 2 })
  let edges = image.edge_map(114)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 023" {
  let size = Size::new(width=5, height=5)
  let image = GrayImage::new(width=5, height=5, fill=Gray::new(253))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 25)
  let mask = Mask::new(width=5, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=9), 3)
  assert_true(mask.count(3) == 25)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 5 })
  let edges = image.edge_map(131)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 024" {
  let size = Size::new(width=6, height=0)
  let image = GrayImage::new(width=6, height=0, fill=Gray::new(264))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=6, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 0 })
  let edges = image.edge_map(148)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 025" {
  let size = Size::new(width=7, height=3)
  let image = GrayImage::new(width=7, height=3, fill=Gray::new(275))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=7, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=7), 0)
  assert_true(mask.count(0) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 3 })
  let edges = image.edge_map(165)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 026" {
  let size = Size::new(width=8, height=6)
  let image = GrayImage::new(width=8, height=6, fill=Gray::new(286))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 48)
  let mask = Mask::new(width=8, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=10), 1)
  assert_true(mask.count(1) == 48)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 6 })
  let edges = image.edge_map(182)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 027" {
  let size = Size::new(width=0, height=1)
  let image = GrayImage::new(width=0, height=1, fill=Gray::new(297))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=5), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 1 })
  let edges = image.edge_map(199)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 028" {
  let size = Size::new(width=1, height=4)
  let image = GrayImage::new(width=1, height=4, fill=Gray::new(8))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=1, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=8), 3)
  assert_true(mask.count(3) == 4)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 4 })
  let edges = image.edge_map(216)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 029" {
  let size = Size::new(width=2, height=7)
  let image = GrayImage::new(width=2, height=7, fill=Gray::new(19))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=2, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=11), 4)
  assert_true(mask.count(4) == 14)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 7 })
  let edges = image.edge_map(233)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 030" {
  let size = Size::new(width=3, height=2)
  let image = GrayImage::new(width=3, height=2, fill=Gray::new(30))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=3, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=6), 0)
  assert_true(mask.count(0) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 2 })
  let edges = image.edge_map(250)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 031" {
  let size = Size::new(width=4, height=5)
  let image = GrayImage::new(width=4, height=5, fill=Gray::new(41))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=4, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=9), 1)
  assert_true(mask.count(1) == 20)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 5 })
  let edges = image.edge_map(7)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 032" {
  let size = Size::new(width=5, height=0)
  let image = GrayImage::new(width=5, height=0, fill=Gray::new(52))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=5, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 0 })
  let edges = image.edge_map(24)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 033" {
  let size = Size::new(width=6, height=3)
  let image = GrayImage::new(width=6, height=3, fill=Gray::new(63))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=6, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=7), 3)
  assert_true(mask.count(3) == 18)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 3 })
  let edges = image.edge_map(41)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 034" {
  let size = Size::new(width=7, height=6)
  let image = GrayImage::new(width=7, height=6, fill=Gray::new(74))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=7, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=10), 4)
  assert_true(mask.count(4) == 42)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 6 })
  let edges = image.edge_map(58)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 035" {
  let size = Size::new(width=8, height=1)
  let image = GrayImage::new(width=8, height=1, fill=Gray::new(85))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=8, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=5), 0)
  assert_true(mask.count(0) == 8)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 1 })
  let edges = image.edge_map(75)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 036" {
  let size = Size::new(width=0, height=4)
  let image = GrayImage::new(width=0, height=4, fill=Gray::new(96))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=8), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 4 })
  let edges = image.edge_map(92)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 037" {
  let size = Size::new(width=1, height=7)
  let image = GrayImage::new(width=1, height=7, fill=Gray::new(107))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=1, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=11), 2)
  assert_true(mask.count(2) == 7)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 7 })
  let edges = image.edge_map(109)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 038" {
  let size = Size::new(width=2, height=2)
  let image = GrayImage::new(width=2, height=2, fill=Gray::new(118))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=2, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=6), 3)
  assert_true(mask.count(3) == 4)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 2 })
  let edges = image.edge_map(126)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 039" {
  let size = Size::new(width=3, height=5)
  let image = GrayImage::new(width=3, height=5, fill=Gray::new(129))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=3, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=9), 4)
  assert_true(mask.count(4) == 15)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 5 })
  let edges = image.edge_map(143)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 040" {
  let size = Size::new(width=4, height=0)
  let image = GrayImage::new(width=4, height=0, fill=Gray::new(140))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=4, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 0 })
  let edges = image.edge_map(160)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 041" {
  let size = Size::new(width=5, height=3)
  let image = GrayImage::new(width=5, height=3, fill=Gray::new(151))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=5, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=7), 1)
  assert_true(mask.count(1) == 15)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 3 })
  let edges = image.edge_map(177)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 042" {
  let size = Size::new(width=6, height=6)
  let image = GrayImage::new(width=6, height=6, fill=Gray::new(162))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 36)
  let mask = Mask::new(width=6, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=10), 2)
  assert_true(mask.count(2) == 36)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 6 })
  let edges = image.edge_map(194)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 043" {
  let size = Size::new(width=7, height=1)
  let image = GrayImage::new(width=7, height=1, fill=Gray::new(173))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=7, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=5), 3)
  assert_true(mask.count(3) == 7)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 1 })
  let edges = image.edge_map(211)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 044" {
  let size = Size::new(width=8, height=4)
  let image = GrayImage::new(width=8, height=4, fill=Gray::new(184))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 32)
  let mask = Mask::new(width=8, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=8), 4)
  assert_true(mask.count(4) == 32)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 4 })
  let edges = image.edge_map(228)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 045" {
  let size = Size::new(width=0, height=7)
  let image = GrayImage::new(width=0, height=7, fill=Gray::new(195))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=11), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 7 })
  let edges = image.edge_map(245)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 046" {
  let size = Size::new(width=1, height=2)
  let image = GrayImage::new(width=1, height=2, fill=Gray::new(206))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=1, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=6), 1)
  assert_true(mask.count(1) == 2)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 2 })
  let edges = image.edge_map(2)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 047" {
  let size = Size::new(width=2, height=5)
  let image = GrayImage::new(width=2, height=5, fill=Gray::new(217))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=2, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=9), 2)
  assert_true(mask.count(2) == 10)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 5 })
  let edges = image.edge_map(19)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 048" {
  let size = Size::new(width=3, height=0)
  let image = GrayImage::new(width=3, height=0, fill=Gray::new(228))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=3, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 0 })
  let edges = image.edge_map(36)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 049" {
  let size = Size::new(width=4, height=3)
  let image = GrayImage::new(width=4, height=3, fill=Gray::new(239))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=4, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=7), 4)
  assert_true(mask.count(4) == 12)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 3 })
  let edges = image.edge_map(53)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 050" {
  let size = Size::new(width=5, height=6)
  let image = GrayImage::new(width=5, height=6, fill=Gray::new(250))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=5, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=10), 0)
  assert_true(mask.count(0) == 30)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 6 })
  let edges = image.edge_map(70)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 051" {
  let size = Size::new(width=6, height=1)
  let image = GrayImage::new(width=6, height=1, fill=Gray::new(261))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=6, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=5), 1)
  assert_true(mask.count(1) == 6)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 1 })
  let edges = image.edge_map(87)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 052" {
  let size = Size::new(width=7, height=4)
  let image = GrayImage::new(width=7, height=4, fill=Gray::new(272))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=7, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=8), 2)
  assert_true(mask.count(2) == 28)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 4 })
  let edges = image.edge_map(104)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 053" {
  let size = Size::new(width=8, height=7)
  let image = GrayImage::new(width=8, height=7, fill=Gray::new(283))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 56)
  let mask = Mask::new(width=8, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=11), 3)
  assert_true(mask.count(3) == 56)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 7 })
  let edges = image.edge_map(121)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 054" {
  let size = Size::new(width=0, height=2)
  let image = GrayImage::new(width=0, height=2, fill=Gray::new(294))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=6), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 2 })
  let edges = image.edge_map(138)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 055" {
  let size = Size::new(width=1, height=5)
  let image = GrayImage::new(width=1, height=5, fill=Gray::new(5))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=1, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=9), 0)
  assert_true(mask.count(0) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 5 })
  let edges = image.edge_map(155)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 056" {
  let size = Size::new(width=2, height=0)
  let image = GrayImage::new(width=2, height=0, fill=Gray::new(16))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=2, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 0 })
  let edges = image.edge_map(172)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 057" {
  let size = Size::new(width=3, height=3)
  let image = GrayImage::new(width=3, height=3, fill=Gray::new(27))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 9)
  let mask = Mask::new(width=3, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=7), 2)
  assert_true(mask.count(2) == 9)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 3 })
  let edges = image.edge_map(189)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 058" {
  let size = Size::new(width=4, height=6)
  let image = GrayImage::new(width=4, height=6, fill=Gray::new(38))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=4, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=10), 3)
  assert_true(mask.count(3) == 24)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 6 })
  let edges = image.edge_map(206)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 059" {
  let size = Size::new(width=5, height=1)
  let image = GrayImage::new(width=5, height=1, fill=Gray::new(49))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=5, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=5), 4)
  assert_true(mask.count(4) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 1 })
  let edges = image.edge_map(223)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 060" {
  let size = Size::new(width=6, height=4)
  let image = GrayImage::new(width=6, height=4, fill=Gray::new(60))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=6, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=8), 0)
  assert_true(mask.count(0) == 24)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 4 })
  let edges = image.edge_map(240)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 061" {
  let size = Size::new(width=7, height=7)
  let image = GrayImage::new(width=7, height=7, fill=Gray::new(71))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 49)
  let mask = Mask::new(width=7, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=11), 1)
  assert_true(mask.count(1) == 49)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 7 })
  let edges = image.edge_map(257)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 062" {
  let size = Size::new(width=8, height=2)
  let image = GrayImage::new(width=8, height=2, fill=Gray::new(82))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=8, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=6), 2)
  assert_true(mask.count(2) == 16)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 2 })
  let edges = image.edge_map(14)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 063" {
  let size = Size::new(width=0, height=5)
  let image = GrayImage::new(width=0, height=5, fill=Gray::new(93))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=9), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 5 })
  let edges = image.edge_map(31)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 064" {
  let size = Size::new(width=1, height=0)
  let image = GrayImage::new(width=1, height=0, fill=Gray::new(104))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=1, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 0 })
  let edges = image.edge_map(48)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 065" {
  let size = Size::new(width=2, height=3)
  let image = GrayImage::new(width=2, height=3, fill=Gray::new(115))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=2, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=7), 0)
  assert_true(mask.count(0) == 6)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 3 })
  let edges = image.edge_map(65)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 066" {
  let size = Size::new(width=3, height=6)
  let image = GrayImage::new(width=3, height=6, fill=Gray::new(126))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=3, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=10), 1)
  assert_true(mask.count(1) == 18)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 6 })
  let edges = image.edge_map(82)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 067" {
  let size = Size::new(width=4, height=1)
  let image = GrayImage::new(width=4, height=1, fill=Gray::new(137))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=4, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=5), 2)
  assert_true(mask.count(2) == 4)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 1 })
  let edges = image.edge_map(99)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 068" {
  let size = Size::new(width=5, height=4)
  let image = GrayImage::new(width=5, height=4, fill=Gray::new(148))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=5, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=8), 3)
  assert_true(mask.count(3) == 20)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 4 })
  let edges = image.edge_map(116)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 069" {
  let size = Size::new(width=6, height=7)
  let image = GrayImage::new(width=6, height=7, fill=Gray::new(159))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=6, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=11), 4)
  assert_true(mask.count(4) == 42)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 7 })
  let edges = image.edge_map(133)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 070" {
  let size = Size::new(width=7, height=2)
  let image = GrayImage::new(width=7, height=2, fill=Gray::new(170))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=7, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=6), 0)
  assert_true(mask.count(0) == 14)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 2 })
  let edges = image.edge_map(150)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 071" {
  let size = Size::new(width=8, height=5)
  let image = GrayImage::new(width=8, height=5, fill=Gray::new(181))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 40)
  let mask = Mask::new(width=8, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=9), 1)
  assert_true(mask.count(1) == 40)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 5 })
  let edges = image.edge_map(167)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 072" {
  let size = Size::new(width=0, height=0)
  let image = GrayImage::new(width=0, height=0, fill=Gray::new(192))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 0 })
  let edges = image.edge_map(184)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 073" {
  let size = Size::new(width=1, height=3)
  let image = GrayImage::new(width=1, height=3, fill=Gray::new(203))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=1, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=7), 3)
  assert_true(mask.count(3) == 3)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 3 })
  let edges = image.edge_map(201)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 074" {
  let size = Size::new(width=2, height=6)
  let image = GrayImage::new(width=2, height=6, fill=Gray::new(214))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=2, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=10), 4)
  assert_true(mask.count(4) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 6 })
  let edges = image.edge_map(218)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 075" {
  let size = Size::new(width=3, height=1)
  let image = GrayImage::new(width=3, height=1, fill=Gray::new(225))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=3, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=5), 0)
  assert_true(mask.count(0) == 3)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 1 })
  let edges = image.edge_map(235)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 076" {
  let size = Size::new(width=4, height=4)
  let image = GrayImage::new(width=4, height=4, fill=Gray::new(236))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=4, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=8), 1)
  assert_true(mask.count(1) == 16)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 4 })
  let edges = image.edge_map(252)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 077" {
  let size = Size::new(width=5, height=7)
  let image = GrayImage::new(width=5, height=7, fill=Gray::new(247))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=5, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=11), 2)
  assert_true(mask.count(2) == 35)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 7 })
  let edges = image.edge_map(9)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 078" {
  let size = Size::new(width=6, height=2)
  let image = GrayImage::new(width=6, height=2, fill=Gray::new(258))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=6, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=6), 3)
  assert_true(mask.count(3) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 2 })
  let edges = image.edge_map(26)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 079" {
  let size = Size::new(width=7, height=5)
  let image = GrayImage::new(width=7, height=5, fill=Gray::new(269))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=7, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=9), 4)
  assert_true(mask.count(4) == 35)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 5 })
  let edges = image.edge_map(43)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 080" {
  let size = Size::new(width=8, height=0)
  let image = GrayImage::new(width=8, height=0, fill=Gray::new(280))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=8, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 0 })
  let edges = image.edge_map(60)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 081" {
  let size = Size::new(width=0, height=3)
  let image = GrayImage::new(width=0, height=3, fill=Gray::new(291))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=7), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 3 })
  let edges = image.edge_map(77)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 082" {
  let size = Size::new(width=1, height=6)
  let image = GrayImage::new(width=1, height=6, fill=Gray::new(2))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=1, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=10), 2)
  assert_true(mask.count(2) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 6 })
  let edges = image.edge_map(94)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 083" {
  let size = Size::new(width=2, height=1)
  let image = GrayImage::new(width=2, height=1, fill=Gray::new(13))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=2, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=5), 3)
  assert_true(mask.count(3) == 2)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 1 })
  let edges = image.edge_map(111)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 084" {
  let size = Size::new(width=3, height=4)
  let image = GrayImage::new(width=3, height=4, fill=Gray::new(24))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=3, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=8), 4)
  assert_true(mask.count(4) == 12)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 4 })
  let edges = image.edge_map(128)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 085" {
  let size = Size::new(width=4, height=7)
  let image = GrayImage::new(width=4, height=7, fill=Gray::new(35))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=4, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=11), 0)
  assert_true(mask.count(0) == 28)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 7 })
  let edges = image.edge_map(145)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 086" {
  let size = Size::new(width=5, height=2)
  let image = GrayImage::new(width=5, height=2, fill=Gray::new(46))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=5, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=6), 1)
  assert_true(mask.count(1) == 10)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 2 })
  let edges = image.edge_map(162)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 087" {
  let size = Size::new(width=6, height=5)
  let image = GrayImage::new(width=6, height=5, fill=Gray::new(57))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=6, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=9), 2)
  assert_true(mask.count(2) == 30)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 5 })
  let edges = image.edge_map(179)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 088" {
  let size = Size::new(width=7, height=0)
  let image = GrayImage::new(width=7, height=0, fill=Gray::new(68))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=7, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 0 })
  let edges = image.edge_map(196)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 089" {
  let size = Size::new(width=8, height=3)
  let image = GrayImage::new(width=8, height=3, fill=Gray::new(79))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=8, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=7), 4)
  assert_true(mask.count(4) == 24)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 3 })
  let edges = image.edge_map(213)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 090" {
  let size = Size::new(width=0, height=6)
  let image = GrayImage::new(width=0, height=6, fill=Gray::new(90))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=10), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 6 })
  let edges = image.edge_map(230)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 091" {
  let size = Size::new(width=1, height=1)
  let image = GrayImage::new(width=1, height=1, fill=Gray::new(101))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 1)
  let mask = Mask::new(width=1, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=5), 1)
  assert_true(mask.count(1) == 1)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 1 })
  let edges = image.edge_map(247)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 092" {
  let size = Size::new(width=2, height=4)
  let image = GrayImage::new(width=2, height=4, fill=Gray::new(112))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=2, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=8), 2)
  assert_true(mask.count(2) == 8)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 4 })
  let edges = image.edge_map(4)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 093" {
  let size = Size::new(width=3, height=7)
  let image = GrayImage::new(width=3, height=7, fill=Gray::new(123))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=3, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=11), 3)
  assert_true(mask.count(3) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 7 })
  let edges = image.edge_map(21)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 094" {
  let size = Size::new(width=4, height=2)
  let image = GrayImage::new(width=4, height=2, fill=Gray::new(134))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=4, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=6), 4)
  assert_true(mask.count(4) == 8)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 2 })
  let edges = image.edge_map(38)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 095" {
  let size = Size::new(width=5, height=5)
  let image = GrayImage::new(width=5, height=5, fill=Gray::new(145))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 25)
  let mask = Mask::new(width=5, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=9), 0)
  assert_true(mask.count(0) == 25)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 5 })
  let edges = image.edge_map(55)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 096" {
  let size = Size::new(width=6, height=0)
  let image = GrayImage::new(width=6, height=0, fill=Gray::new(156))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=6, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 0 })
  let edges = image.edge_map(72)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 097" {
  let size = Size::new(width=7, height=3)
  let image = GrayImage::new(width=7, height=3, fill=Gray::new(167))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=7, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=7), 2)
  assert_true(mask.count(2) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 3 })
  let edges = image.edge_map(89)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 098" {
  let size = Size::new(width=8, height=6)
  let image = GrayImage::new(width=8, height=6, fill=Gray::new(178))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 48)
  let mask = Mask::new(width=8, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=10), 3)
  assert_true(mask.count(3) == 48)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 6 })
  let edges = image.edge_map(106)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 099" {
  let size = Size::new(width=0, height=1)
  let image = GrayImage::new(width=0, height=1, fill=Gray::new(189))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=5), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 1 })
  let edges = image.edge_map(123)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 100" {
  let size = Size::new(width=1, height=4)
  let image = GrayImage::new(width=1, height=4, fill=Gray::new(200))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=1, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=8), 0)
  assert_true(mask.count(0) == 4)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 4 })
  let edges = image.edge_map(140)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 101" {
  let size = Size::new(width=2, height=7)
  let image = GrayImage::new(width=2, height=7, fill=Gray::new(211))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=2, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=11), 1)
  assert_true(mask.count(1) == 14)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 7 })
  let edges = image.edge_map(157)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 102" {
  let size = Size::new(width=3, height=2)
  let image = GrayImage::new(width=3, height=2, fill=Gray::new(222))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=3, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=6), 2)
  assert_true(mask.count(2) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 2 })
  let edges = image.edge_map(174)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 103" {
  let size = Size::new(width=4, height=5)
  let image = GrayImage::new(width=4, height=5, fill=Gray::new(233))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=4, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=9), 3)
  assert_true(mask.count(3) == 20)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 5 })
  let edges = image.edge_map(191)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 104" {
  let size = Size::new(width=5, height=0)
  let image = GrayImage::new(width=5, height=0, fill=Gray::new(244))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=5, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 0 })
  let edges = image.edge_map(208)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 105" {
  let size = Size::new(width=6, height=3)
  let image = GrayImage::new(width=6, height=3, fill=Gray::new(255))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=6, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=7), 0)
  assert_true(mask.count(0) == 18)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 3 })
  let edges = image.edge_map(225)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 106" {
  let size = Size::new(width=7, height=6)
  let image = GrayImage::new(width=7, height=6, fill=Gray::new(266))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=7, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=10), 1)
  assert_true(mask.count(1) == 42)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 6 })
  let edges = image.edge_map(242)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 107" {
  let size = Size::new(width=8, height=1)
  let image = GrayImage::new(width=8, height=1, fill=Gray::new(277))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=8, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=5), 2)
  assert_true(mask.count(2) == 8)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 1 })
  let edges = image.edge_map(259)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 108" {
  let size = Size::new(width=0, height=4)
  let image = GrayImage::new(width=0, height=4, fill=Gray::new(288))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=8), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 4 })
  let edges = image.edge_map(16)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 109" {
  let size = Size::new(width=1, height=7)
  let image = GrayImage::new(width=1, height=7, fill=Gray::new(299))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=1, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=11), 4)
  assert_true(mask.count(4) == 7)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 7 })
  let edges = image.edge_map(33)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 110" {
  let size = Size::new(width=2, height=2)
  let image = GrayImage::new(width=2, height=2, fill=Gray::new(10))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=2, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=6), 0)
  assert_true(mask.count(0) == 4)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 2 })
  let edges = image.edge_map(50)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 111" {
  let size = Size::new(width=3, height=5)
  let image = GrayImage::new(width=3, height=5, fill=Gray::new(21))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=3, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=9), 1)
  assert_true(mask.count(1) == 15)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 5 })
  let edges = image.edge_map(67)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 112" {
  let size = Size::new(width=4, height=0)
  let image = GrayImage::new(width=4, height=0, fill=Gray::new(32))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=4, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 0 })
  let edges = image.edge_map(84)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 113" {
  let size = Size::new(width=5, height=3)
  let image = GrayImage::new(width=5, height=3, fill=Gray::new(43))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=5, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=7), 3)
  assert_true(mask.count(3) == 15)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 3 })
  let edges = image.edge_map(101)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 114" {
  let size = Size::new(width=6, height=6)
  let image = GrayImage::new(width=6, height=6, fill=Gray::new(54))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 36)
  let mask = Mask::new(width=6, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=10), 4)
  assert_true(mask.count(4) == 36)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 6 })
  let edges = image.edge_map(118)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 115" {
  let size = Size::new(width=7, height=1)
  let image = GrayImage::new(width=7, height=1, fill=Gray::new(65))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=7, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=5), 0)
  assert_true(mask.count(0) == 7)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 1 })
  let edges = image.edge_map(135)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 116" {
  let size = Size::new(width=8, height=4)
  let image = GrayImage::new(width=8, height=4, fill=Gray::new(76))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 32)
  let mask = Mask::new(width=8, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=8), 1)
  assert_true(mask.count(1) == 32)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 4 })
  let edges = image.edge_map(152)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 117" {
  let size = Size::new(width=0, height=7)
  let image = GrayImage::new(width=0, height=7, fill=Gray::new(87))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=11), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 7 })
  let edges = image.edge_map(169)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 118" {
  let size = Size::new(width=1, height=2)
  let image = GrayImage::new(width=1, height=2, fill=Gray::new(98))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=1, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=6), 3)
  assert_true(mask.count(3) == 2)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 2 })
  let edges = image.edge_map(186)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 119" {
  let size = Size::new(width=2, height=5)
  let image = GrayImage::new(width=2, height=5, fill=Gray::new(109))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=2, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=9), 4)
  assert_true(mask.count(4) == 10)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 5 })
  let edges = image.edge_map(203)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 120" {
  let size = Size::new(width=3, height=0)
  let image = GrayImage::new(width=3, height=0, fill=Gray::new(120))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=3, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 0 })
  let edges = image.edge_map(220)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 121" {
  let size = Size::new(width=4, height=3)
  let image = GrayImage::new(width=4, height=3, fill=Gray::new(131))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=4, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=7), 1)
  assert_true(mask.count(1) == 12)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 3 })
  let edges = image.edge_map(237)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 122" {
  let size = Size::new(width=5, height=6)
  let image = GrayImage::new(width=5, height=6, fill=Gray::new(142))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=5, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=10), 2)
  assert_true(mask.count(2) == 30)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 6 })
  let edges = image.edge_map(254)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 123" {
  let size = Size::new(width=6, height=1)
  let image = GrayImage::new(width=6, height=1, fill=Gray::new(153))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=6, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=5), 3)
  assert_true(mask.count(3) == 6)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 1 })
  let edges = image.edge_map(11)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 124" {
  let size = Size::new(width=7, height=4)
  let image = GrayImage::new(width=7, height=4, fill=Gray::new(164))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=7, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=8), 4)
  assert_true(mask.count(4) == 28)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 4 })
  let edges = image.edge_map(28)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 125" {
  let size = Size::new(width=8, height=7)
  let image = GrayImage::new(width=8, height=7, fill=Gray::new(175))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 56)
  let mask = Mask::new(width=8, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=11), 0)
  assert_true(mask.count(0) == 56)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 7 })
  let edges = image.edge_map(45)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 126" {
  let size = Size::new(width=0, height=2)
  let image = GrayImage::new(width=0, height=2, fill=Gray::new(186))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=6), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 2 })
  let edges = image.edge_map(62)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 127" {
  let size = Size::new(width=1, height=5)
  let image = GrayImage::new(width=1, height=5, fill=Gray::new(197))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=1, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=9), 2)
  assert_true(mask.count(2) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 5 })
  let edges = image.edge_map(79)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 128" {
  let size = Size::new(width=2, height=0)
  let image = GrayImage::new(width=2, height=0, fill=Gray::new(208))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=2, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 0 })
  let edges = image.edge_map(96)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 129" {
  let size = Size::new(width=3, height=3)
  let image = GrayImage::new(width=3, height=3, fill=Gray::new(219))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 9)
  let mask = Mask::new(width=3, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=7), 4)
  assert_true(mask.count(4) == 9)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 3 })
  let edges = image.edge_map(113)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 130" {
  let size = Size::new(width=4, height=6)
  let image = GrayImage::new(width=4, height=6, fill=Gray::new(230))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=4, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=10), 0)
  assert_true(mask.count(0) == 24)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 6 })
  let edges = image.edge_map(130)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 131" {
  let size = Size::new(width=5, height=1)
  let image = GrayImage::new(width=5, height=1, fill=Gray::new(241))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=5, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=5), 1)
  assert_true(mask.count(1) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 1 })
  let edges = image.edge_map(147)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 132" {
  let size = Size::new(width=6, height=4)
  let image = GrayImage::new(width=6, height=4, fill=Gray::new(252))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=6, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=8), 2)
  assert_true(mask.count(2) == 24)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 4 })
  let edges = image.edge_map(164)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 133" {
  let size = Size::new(width=7, height=7)
  let image = GrayImage::new(width=7, height=7, fill=Gray::new(263))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 49)
  let mask = Mask::new(width=7, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=11), 3)
  assert_true(mask.count(3) == 49)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 7 })
  let edges = image.edge_map(181)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 134" {
  let size = Size::new(width=8, height=2)
  let image = GrayImage::new(width=8, height=2, fill=Gray::new(274))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=8, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=6), 4)
  assert_true(mask.count(4) == 16)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 2 })
  let edges = image.edge_map(198)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 135" {
  let size = Size::new(width=0, height=5)
  let image = GrayImage::new(width=0, height=5, fill=Gray::new(285))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=9), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 5 })
  let edges = image.edge_map(215)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 136" {
  let size = Size::new(width=1, height=0)
  let image = GrayImage::new(width=1, height=0, fill=Gray::new(296))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=1, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 0 })
  let edges = image.edge_map(232)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 137" {
  let size = Size::new(width=2, height=3)
  let image = GrayImage::new(width=2, height=3, fill=Gray::new(7))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=2, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=7), 2)
  assert_true(mask.count(2) == 6)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 3 })
  let edges = image.edge_map(249)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 138" {
  let size = Size::new(width=3, height=6)
  let image = GrayImage::new(width=3, height=6, fill=Gray::new(18))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=3, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=10), 3)
  assert_true(mask.count(3) == 18)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 6 })
  let edges = image.edge_map(6)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 139" {
  let size = Size::new(width=4, height=1)
  let image = GrayImage::new(width=4, height=1, fill=Gray::new(29))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=4, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=5), 4)
  assert_true(mask.count(4) == 4)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 1 })
  let edges = image.edge_map(23)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 140" {
  let size = Size::new(width=5, height=4)
  let image = GrayImage::new(width=5, height=4, fill=Gray::new(40))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=5, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=8), 0)
  assert_true(mask.count(0) == 20)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 4 })
  let edges = image.edge_map(40)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 141" {
  let size = Size::new(width=6, height=7)
  let image = GrayImage::new(width=6, height=7, fill=Gray::new(51))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=6, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=11), 1)
  assert_true(mask.count(1) == 42)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 7 })
  let edges = image.edge_map(57)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 142" {
  let size = Size::new(width=7, height=2)
  let image = GrayImage::new(width=7, height=2, fill=Gray::new(62))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=7, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=6), 2)
  assert_true(mask.count(2) == 14)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 2 })
  let edges = image.edge_map(74)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 143" {
  let size = Size::new(width=8, height=5)
  let image = GrayImage::new(width=8, height=5, fill=Gray::new(73))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 40)
  let mask = Mask::new(width=8, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=9), 3)
  assert_true(mask.count(3) == 40)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 5 })
  let edges = image.edge_map(91)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 144" {
  let size = Size::new(width=0, height=0)
  let image = GrayImage::new(width=0, height=0, fill=Gray::new(84))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 0 })
  let edges = image.edge_map(108)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 145" {
  let size = Size::new(width=1, height=3)
  let image = GrayImage::new(width=1, height=3, fill=Gray::new(95))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=1, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=7), 0)
  assert_true(mask.count(0) == 3)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 3 })
  let edges = image.edge_map(125)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 146" {
  let size = Size::new(width=2, height=6)
  let image = GrayImage::new(width=2, height=6, fill=Gray::new(106))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=2, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=10), 1)
  assert_true(mask.count(1) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 6 })
  let edges = image.edge_map(142)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 147" {
  let size = Size::new(width=3, height=1)
  let image = GrayImage::new(width=3, height=1, fill=Gray::new(117))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=3, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=5), 2)
  assert_true(mask.count(2) == 3)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 1 })
  let edges = image.edge_map(159)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 148" {
  let size = Size::new(width=4, height=4)
  let image = GrayImage::new(width=4, height=4, fill=Gray::new(128))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=4, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=8), 3)
  assert_true(mask.count(3) == 16)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 4 })
  let edges = image.edge_map(176)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 149" {
  let size = Size::new(width=5, height=7)
  let image = GrayImage::new(width=5, height=7, fill=Gray::new(139))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=5, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=11), 4)
  assert_true(mask.count(4) == 35)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 7 })
  let edges = image.edge_map(193)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 150" {
  let size = Size::new(width=6, height=2)
  let image = GrayImage::new(width=6, height=2, fill=Gray::new(150))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=6, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=6), 0)
  assert_true(mask.count(0) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 2 })
  let edges = image.edge_map(210)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 151" {
  let size = Size::new(width=7, height=5)
  let image = GrayImage::new(width=7, height=5, fill=Gray::new(161))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=7, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=9), 1)
  assert_true(mask.count(1) == 35)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 5 })
  let edges = image.edge_map(227)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 152" {
  let size = Size::new(width=8, height=0)
  let image = GrayImage::new(width=8, height=0, fill=Gray::new(172))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=8, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 0 })
  let edges = image.edge_map(244)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 153" {
  let size = Size::new(width=0, height=3)
  let image = GrayImage::new(width=0, height=3, fill=Gray::new(183))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=7), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 3 })
  let edges = image.edge_map(1)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 154" {
  let size = Size::new(width=1, height=6)
  let image = GrayImage::new(width=1, height=6, fill=Gray::new(194))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=1, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=10), 4)
  assert_true(mask.count(4) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 6 })
  let edges = image.edge_map(18)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 155" {
  let size = Size::new(width=2, height=1)
  let image = GrayImage::new(width=2, height=1, fill=Gray::new(205))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=2, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=5), 0)
  assert_true(mask.count(0) == 2)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 1 })
  let edges = image.edge_map(35)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 156" {
  let size = Size::new(width=3, height=4)
  let image = GrayImage::new(width=3, height=4, fill=Gray::new(216))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=3, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=8), 1)
  assert_true(mask.count(1) == 12)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 4 })
  let edges = image.edge_map(52)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 157" {
  let size = Size::new(width=4, height=7)
  let image = GrayImage::new(width=4, height=7, fill=Gray::new(227))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=4, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=11), 2)
  assert_true(mask.count(2) == 28)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 7 })
  let edges = image.edge_map(69)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 158" {
  let size = Size::new(width=5, height=2)
  let image = GrayImage::new(width=5, height=2, fill=Gray::new(238))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=5, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=6), 3)
  assert_true(mask.count(3) == 10)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 2 })
  let edges = image.edge_map(86)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 159" {
  let size = Size::new(width=6, height=5)
  let image = GrayImage::new(width=6, height=5, fill=Gray::new(249))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=6, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=9), 4)
  assert_true(mask.count(4) == 30)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 5 })
  let edges = image.edge_map(103)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 160" {
  let size = Size::new(width=7, height=0)
  let image = GrayImage::new(width=7, height=0, fill=Gray::new(260))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=7, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 0 })
  let edges = image.edge_map(120)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 161" {
  let size = Size::new(width=8, height=3)
  let image = GrayImage::new(width=8, height=3, fill=Gray::new(271))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=8, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=7), 1)
  assert_true(mask.count(1) == 24)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 3 })
  let edges = image.edge_map(137)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 162" {
  let size = Size::new(width=0, height=6)
  let image = GrayImage::new(width=0, height=6, fill=Gray::new(282))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=10), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 6 })
  let edges = image.edge_map(154)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 163" {
  let size = Size::new(width=1, height=1)
  let image = GrayImage::new(width=1, height=1, fill=Gray::new(293))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 1)
  let mask = Mask::new(width=1, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=5), 3)
  assert_true(mask.count(3) == 1)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 1 })
  let edges = image.edge_map(171)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 164" {
  let size = Size::new(width=2, height=4)
  let image = GrayImage::new(width=2, height=4, fill=Gray::new(4))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=2, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=8), 4)
  assert_true(mask.count(4) == 8)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 4 })
  let edges = image.edge_map(188)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 165" {
  let size = Size::new(width=3, height=7)
  let image = GrayImage::new(width=3, height=7, fill=Gray::new(15))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=3, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=11), 0)
  assert_true(mask.count(0) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 7 })
  let edges = image.edge_map(205)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 166" {
  let size = Size::new(width=4, height=2)
  let image = GrayImage::new(width=4, height=2, fill=Gray::new(26))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=4, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=6), 1)
  assert_true(mask.count(1) == 8)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 2 })
  let edges = image.edge_map(222)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 167" {
  let size = Size::new(width=5, height=5)
  let image = GrayImage::new(width=5, height=5, fill=Gray::new(37))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 25)
  let mask = Mask::new(width=5, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=9), 2)
  assert_true(mask.count(2) == 25)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 5 })
  let edges = image.edge_map(239)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 168" {
  let size = Size::new(width=6, height=0)
  let image = GrayImage::new(width=6, height=0, fill=Gray::new(48))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=6, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 0 })
  let edges = image.edge_map(256)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 169" {
  let size = Size::new(width=7, height=3)
  let image = GrayImage::new(width=7, height=3, fill=Gray::new(59))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=7, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=7), 4)
  assert_true(mask.count(4) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 3 })
  let edges = image.edge_map(13)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 170" {
  let size = Size::new(width=8, height=6)
  let image = GrayImage::new(width=8, height=6, fill=Gray::new(70))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 48)
  let mask = Mask::new(width=8, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=10), 0)
  assert_true(mask.count(0) == 48)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 6 })
  let edges = image.edge_map(30)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 171" {
  let size = Size::new(width=0, height=1)
  let image = GrayImage::new(width=0, height=1, fill=Gray::new(81))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=5), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 1 })
  let edges = image.edge_map(47)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 172" {
  let size = Size::new(width=1, height=4)
  let image = GrayImage::new(width=1, height=4, fill=Gray::new(92))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=1, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=8), 2)
  assert_true(mask.count(2) == 4)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 4 })
  let edges = image.edge_map(64)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 173" {
  let size = Size::new(width=2, height=7)
  let image = GrayImage::new(width=2, height=7, fill=Gray::new(103))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=2, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=11), 3)
  assert_true(mask.count(3) == 14)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 7 })
  let edges = image.edge_map(81)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 174" {
  let size = Size::new(width=3, height=2)
  let image = GrayImage::new(width=3, height=2, fill=Gray::new(114))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=3, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=6), 4)
  assert_true(mask.count(4) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 2 })
  let edges = image.edge_map(98)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 175" {
  let size = Size::new(width=4, height=5)
  let image = GrayImage::new(width=4, height=5, fill=Gray::new(125))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=4, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=9), 0)
  assert_true(mask.count(0) == 20)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 5 })
  let edges = image.edge_map(115)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 176" {
  let size = Size::new(width=5, height=0)
  let image = GrayImage::new(width=5, height=0, fill=Gray::new(136))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=5, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 0 })
  let edges = image.edge_map(132)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 177" {
  let size = Size::new(width=6, height=3)
  let image = GrayImage::new(width=6, height=3, fill=Gray::new(147))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=6, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=7), 2)
  assert_true(mask.count(2) == 18)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 3 })
  let edges = image.edge_map(149)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 178" {
  let size = Size::new(width=7, height=6)
  let image = GrayImage::new(width=7, height=6, fill=Gray::new(158))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=7, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=10), 3)
  assert_true(mask.count(3) == 42)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 6 })
  let edges = image.edge_map(166)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 179" {
  let size = Size::new(width=8, height=1)
  let image = GrayImage::new(width=8, height=1, fill=Gray::new(169))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=8, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=5), 4)
  assert_true(mask.count(4) == 8)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 1 })
  let edges = image.edge_map(183)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 180" {
  let size = Size::new(width=0, height=4)
  let image = GrayImage::new(width=0, height=4, fill=Gray::new(180))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=8), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 4 })
  let edges = image.edge_map(200)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 181" {
  let size = Size::new(width=1, height=7)
  let image = GrayImage::new(width=1, height=7, fill=Gray::new(191))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=1, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=11), 1)
  assert_true(mask.count(1) == 7)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 7 })
  let edges = image.edge_map(217)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 182" {
  let size = Size::new(width=2, height=2)
  let image = GrayImage::new(width=2, height=2, fill=Gray::new(202))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=2, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=6), 2)
  assert_true(mask.count(2) == 4)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 2 })
  let edges = image.edge_map(234)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 183" {
  let size = Size::new(width=3, height=5)
  let image = GrayImage::new(width=3, height=5, fill=Gray::new(213))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=3, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=9), 3)
  assert_true(mask.count(3) == 15)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 5 })
  let edges = image.edge_map(251)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 184" {
  let size = Size::new(width=4, height=0)
  let image = GrayImage::new(width=4, height=0, fill=Gray::new(224))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=4, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 0 })
  let edges = image.edge_map(8)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 185" {
  let size = Size::new(width=5, height=3)
  let image = GrayImage::new(width=5, height=3, fill=Gray::new(235))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=5, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=7), 0)
  assert_true(mask.count(0) == 15)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 3 })
  let edges = image.edge_map(25)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 186" {
  let size = Size::new(width=6, height=6)
  let image = GrayImage::new(width=6, height=6, fill=Gray::new(246))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 36)
  let mask = Mask::new(width=6, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=10), 1)
  assert_true(mask.count(1) == 36)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 6 })
  let edges = image.edge_map(42)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 187" {
  let size = Size::new(width=7, height=1)
  let image = GrayImage::new(width=7, height=1, fill=Gray::new(257))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=7, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=5), 2)
  assert_true(mask.count(2) == 7)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 1 })
  let edges = image.edge_map(59)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 188" {
  let size = Size::new(width=8, height=4)
  let image = GrayImage::new(width=8, height=4, fill=Gray::new(268))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 32)
  let mask = Mask::new(width=8, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=8), 3)
  assert_true(mask.count(3) == 32)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 4 })
  let edges = image.edge_map(76)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 189" {
  let size = Size::new(width=0, height=7)
  let image = GrayImage::new(width=0, height=7, fill=Gray::new(279))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=11), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 7 })
  let edges = image.edge_map(93)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 190" {
  let size = Size::new(width=1, height=2)
  let image = GrayImage::new(width=1, height=2, fill=Gray::new(290))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=1, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=6), 0)
  assert_true(mask.count(0) == 2)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 2 })
  let edges = image.edge_map(110)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 191" {
  let size = Size::new(width=2, height=5)
  let image = GrayImage::new(width=2, height=5, fill=Gray::new(1))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=2, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=9), 1)
  assert_true(mask.count(1) == 10)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 5 })
  let edges = image.edge_map(127)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 192" {
  let size = Size::new(width=3, height=0)
  let image = GrayImage::new(width=3, height=0, fill=Gray::new(12))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=3, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 0 })
  let edges = image.edge_map(144)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 193" {
  let size = Size::new(width=4, height=3)
  let image = GrayImage::new(width=4, height=3, fill=Gray::new(23))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=4, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=7), 3)
  assert_true(mask.count(3) == 12)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 3 })
  let edges = image.edge_map(161)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 194" {
  let size = Size::new(width=5, height=6)
  let image = GrayImage::new(width=5, height=6, fill=Gray::new(34))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=5, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=10), 4)
  assert_true(mask.count(4) == 30)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 6 })
  let edges = image.edge_map(178)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 195" {
  let size = Size::new(width=6, height=1)
  let image = GrayImage::new(width=6, height=1, fill=Gray::new(45))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=6, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=5), 0)
  assert_true(mask.count(0) == 6)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 1 })
  let edges = image.edge_map(195)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 196" {
  let size = Size::new(width=7, height=4)
  let image = GrayImage::new(width=7, height=4, fill=Gray::new(56))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=7, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=8), 1)
  assert_true(mask.count(1) == 28)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 4 })
  let edges = image.edge_map(212)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 197" {
  let size = Size::new(width=8, height=7)
  let image = GrayImage::new(width=8, height=7, fill=Gray::new(67))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 56)
  let mask = Mask::new(width=8, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=11), 2)
  assert_true(mask.count(2) == 56)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 7 })
  let edges = image.edge_map(229)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 198" {
  let size = Size::new(width=0, height=2)
  let image = GrayImage::new(width=0, height=2, fill=Gray::new(78))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=6), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 2 })
  let edges = image.edge_map(246)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 199" {
  let size = Size::new(width=1, height=5)
  let image = GrayImage::new(width=1, height=5, fill=Gray::new(89))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=1, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=9), 4)
  assert_true(mask.count(4) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 5 })
  let edges = image.edge_map(3)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 200" {
  let size = Size::new(width=2, height=0)
  let image = GrayImage::new(width=2, height=0, fill=Gray::new(100))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=2, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 0 })
  let edges = image.edge_map(20)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 201" {
  let size = Size::new(width=3, height=3)
  let image = GrayImage::new(width=3, height=3, fill=Gray::new(111))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 9)
  let mask = Mask::new(width=3, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=7), 1)
  assert_true(mask.count(1) == 9)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 3 })
  let edges = image.edge_map(37)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 202" {
  let size = Size::new(width=4, height=6)
  let image = GrayImage::new(width=4, height=6, fill=Gray::new(122))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=4, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=10), 2)
  assert_true(mask.count(2) == 24)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 6 })
  let edges = image.edge_map(54)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 203" {
  let size = Size::new(width=5, height=1)
  let image = GrayImage::new(width=5, height=1, fill=Gray::new(133))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=5, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=5), 3)
  assert_true(mask.count(3) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 1 })
  let edges = image.edge_map(71)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 204" {
  let size = Size::new(width=6, height=4)
  let image = GrayImage::new(width=6, height=4, fill=Gray::new(144))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=6, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=8), 4)
  assert_true(mask.count(4) == 24)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 4 })
  let edges = image.edge_map(88)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 205" {
  let size = Size::new(width=7, height=7)
  let image = GrayImage::new(width=7, height=7, fill=Gray::new(155))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 49)
  let mask = Mask::new(width=7, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=11), 0)
  assert_true(mask.count(0) == 49)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 7 })
  let edges = image.edge_map(105)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 206" {
  let size = Size::new(width=8, height=2)
  let image = GrayImage::new(width=8, height=2, fill=Gray::new(166))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=8, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=6), 1)
  assert_true(mask.count(1) == 16)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 2 })
  let edges = image.edge_map(122)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 207" {
  let size = Size::new(width=0, height=5)
  let image = GrayImage::new(width=0, height=5, fill=Gray::new(177))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=9), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 5 })
  let edges = image.edge_map(139)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 208" {
  let size = Size::new(width=1, height=0)
  let image = GrayImage::new(width=1, height=0, fill=Gray::new(188))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=1, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 0 })
  let edges = image.edge_map(156)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 209" {
  let size = Size::new(width=2, height=3)
  let image = GrayImage::new(width=2, height=3, fill=Gray::new(199))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=2, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=7), 4)
  assert_true(mask.count(4) == 6)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 3 })
  let edges = image.edge_map(173)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 210" {
  let size = Size::new(width=3, height=6)
  let image = GrayImage::new(width=3, height=6, fill=Gray::new(210))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=3, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=10), 0)
  assert_true(mask.count(0) == 18)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 6 })
  let edges = image.edge_map(190)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 211" {
  let size = Size::new(width=4, height=1)
  let image = GrayImage::new(width=4, height=1, fill=Gray::new(221))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=4, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=5), 1)
  assert_true(mask.count(1) == 4)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 1 })
  let edges = image.edge_map(207)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 212" {
  let size = Size::new(width=5, height=4)
  let image = GrayImage::new(width=5, height=4, fill=Gray::new(232))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=5, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=8), 2)
  assert_true(mask.count(2) == 20)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 4 })
  let edges = image.edge_map(224)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 213" {
  let size = Size::new(width=6, height=7)
  let image = GrayImage::new(width=6, height=7, fill=Gray::new(243))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=6, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=11), 3)
  assert_true(mask.count(3) == 42)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 7 })
  let edges = image.edge_map(241)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 214" {
  let size = Size::new(width=7, height=2)
  let image = GrayImage::new(width=7, height=2, fill=Gray::new(254))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=7, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=6), 4)
  assert_true(mask.count(4) == 14)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 2 })
  let edges = image.edge_map(258)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 215" {
  let size = Size::new(width=8, height=5)
  let image = GrayImage::new(width=8, height=5, fill=Gray::new(265))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 40)
  let mask = Mask::new(width=8, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=9), 0)
  assert_true(mask.count(0) == 40)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 5 })
  let edges = image.edge_map(15)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 216" {
  let size = Size::new(width=0, height=0)
  let image = GrayImage::new(width=0, height=0, fill=Gray::new(276))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 0 })
  let edges = image.edge_map(32)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 217" {
  let size = Size::new(width=1, height=3)
  let image = GrayImage::new(width=1, height=3, fill=Gray::new(287))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=1, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=7), 2)
  assert_true(mask.count(2) == 3)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 3 })
  let edges = image.edge_map(49)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 218" {
  let size = Size::new(width=2, height=6)
  let image = GrayImage::new(width=2, height=6, fill=Gray::new(298))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=2, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=10), 3)
  assert_true(mask.count(3) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 6 })
  let edges = image.edge_map(66)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 219" {
  let size = Size::new(width=3, height=1)
  let image = GrayImage::new(width=3, height=1, fill=Gray::new(9))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=3, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=5), 4)
  assert_true(mask.count(4) == 3)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 1 })
  let edges = image.edge_map(83)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 220" {
  let size = Size::new(width=4, height=4)
  let image = GrayImage::new(width=4, height=4, fill=Gray::new(20))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=4, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=8), 0)
  assert_true(mask.count(0) == 16)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 4 })
  let edges = image.edge_map(100)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 221" {
  let size = Size::new(width=5, height=7)
  let image = GrayImage::new(width=5, height=7, fill=Gray::new(31))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=5, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=11), 1)
  assert_true(mask.count(1) == 35)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 7 })
  let edges = image.edge_map(117)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 222" {
  let size = Size::new(width=6, height=2)
  let image = GrayImage::new(width=6, height=2, fill=Gray::new(42))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=6, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=6), 2)
  assert_true(mask.count(2) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 2 })
  let edges = image.edge_map(134)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 223" {
  let size = Size::new(width=7, height=5)
  let image = GrayImage::new(width=7, height=5, fill=Gray::new(53))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=7, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=9), 3)
  assert_true(mask.count(3) == 35)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 5 })
  let edges = image.edge_map(151)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 224" {
  let size = Size::new(width=8, height=0)
  let image = GrayImage::new(width=8, height=0, fill=Gray::new(64))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=8, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 0 })
  let edges = image.edge_map(168)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 225" {
  let size = Size::new(width=0, height=3)
  let image = GrayImage::new(width=0, height=3, fill=Gray::new(75))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=7), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 3 })
  let edges = image.edge_map(185)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 226" {
  let size = Size::new(width=1, height=6)
  let image = GrayImage::new(width=1, height=6, fill=Gray::new(86))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=1, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=10), 1)
  assert_true(mask.count(1) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 6 })
  let edges = image.edge_map(202)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 227" {
  let size = Size::new(width=2, height=1)
  let image = GrayImage::new(width=2, height=1, fill=Gray::new(97))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=2, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=5), 2)
  assert_true(mask.count(2) == 2)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 1 })
  let edges = image.edge_map(219)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 228" {
  let size = Size::new(width=3, height=4)
  let image = GrayImage::new(width=3, height=4, fill=Gray::new(108))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=3, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=8), 3)
  assert_true(mask.count(3) == 12)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 4 })
  let edges = image.edge_map(236)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 229" {
  let size = Size::new(width=4, height=7)
  let image = GrayImage::new(width=4, height=7, fill=Gray::new(119))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=4, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=11), 4)
  assert_true(mask.count(4) == 28)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 7 })
  let edges = image.edge_map(253)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 230" {
  let size = Size::new(width=5, height=2)
  let image = GrayImage::new(width=5, height=2, fill=Gray::new(130))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=5, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=6), 0)
  assert_true(mask.count(0) == 10)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 2 })
  let edges = image.edge_map(10)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 231" {
  let size = Size::new(width=6, height=5)
  let image = GrayImage::new(width=6, height=5, fill=Gray::new(141))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=6, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=9), 1)
  assert_true(mask.count(1) == 30)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 5 })
  let edges = image.edge_map(27)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 232" {
  let size = Size::new(width=7, height=0)
  let image = GrayImage::new(width=7, height=0, fill=Gray::new(152))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=7, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 0 })
  let edges = image.edge_map(44)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 233" {
  let size = Size::new(width=8, height=3)
  let image = GrayImage::new(width=8, height=3, fill=Gray::new(163))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=8, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=7), 3)
  assert_true(mask.count(3) == 24)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 3 })
  let edges = image.edge_map(61)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 234" {
  let size = Size::new(width=0, height=6)
  let image = GrayImage::new(width=0, height=6, fill=Gray::new(174))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=10), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 6 })
  let edges = image.edge_map(78)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 235" {
  let size = Size::new(width=1, height=1)
  let image = GrayImage::new(width=1, height=1, fill=Gray::new(185))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 1)
  let mask = Mask::new(width=1, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=5), 0)
  assert_true(mask.count(0) == 1)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 1 })
  let edges = image.edge_map(95)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 236" {
  let size = Size::new(width=2, height=4)
  let image = GrayImage::new(width=2, height=4, fill=Gray::new(196))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=2, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=8), 1)
  assert_true(mask.count(1) == 8)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 4 })
  let edges = image.edge_map(112)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 237" {
  let size = Size::new(width=3, height=7)
  let image = GrayImage::new(width=3, height=7, fill=Gray::new(207))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=3, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=11), 2)
  assert_true(mask.count(2) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 7 })
  let edges = image.edge_map(129)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 238" {
  let size = Size::new(width=4, height=2)
  let image = GrayImage::new(width=4, height=2, fill=Gray::new(218))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=4, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=6), 3)
  assert_true(mask.count(3) == 8)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 2 })
  let edges = image.edge_map(146)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 239" {
  let size = Size::new(width=5, height=5)
  let image = GrayImage::new(width=5, height=5, fill=Gray::new(229))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 25)
  let mask = Mask::new(width=5, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=9), 4)
  assert_true(mask.count(4) == 25)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 5 })
  let edges = image.edge_map(163)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 240" {
  let size = Size::new(width=6, height=0)
  let image = GrayImage::new(width=6, height=0, fill=Gray::new(240))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=6, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 0 })
  let edges = image.edge_map(180)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 241" {
  let size = Size::new(width=7, height=3)
  let image = GrayImage::new(width=7, height=3, fill=Gray::new(251))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=7, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=7), 1)
  assert_true(mask.count(1) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 3 })
  let edges = image.edge_map(197)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 242" {
  let size = Size::new(width=8, height=6)
  let image = GrayImage::new(width=8, height=6, fill=Gray::new(262))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 48)
  let mask = Mask::new(width=8, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=10), 2)
  assert_true(mask.count(2) == 48)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 6 })
  let edges = image.edge_map(214)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 243" {
  let size = Size::new(width=0, height=1)
  let image = GrayImage::new(width=0, height=1, fill=Gray::new(273))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=5), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 1 })
  let edges = image.edge_map(231)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 244" {
  let size = Size::new(width=1, height=4)
  let image = GrayImage::new(width=1, height=4, fill=Gray::new(284))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=1, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=8), 4)
  assert_true(mask.count(4) == 4)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 4 })
  let edges = image.edge_map(248)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 245" {
  let size = Size::new(width=2, height=7)
  let image = GrayImage::new(width=2, height=7, fill=Gray::new(295))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=2, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=11), 0)
  assert_true(mask.count(0) == 14)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 7 })
  let edges = image.edge_map(5)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 246" {
  let size = Size::new(width=3, height=2)
  let image = GrayImage::new(width=3, height=2, fill=Gray::new(6))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=3, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=6), 1)
  assert_true(mask.count(1) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 2 })
  let edges = image.edge_map(22)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 247" {
  let size = Size::new(width=4, height=5)
  let image = GrayImage::new(width=4, height=5, fill=Gray::new(17))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=4, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=9), 2)
  assert_true(mask.count(2) == 20)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 5 })
  let edges = image.edge_map(39)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 248" {
  let size = Size::new(width=5, height=0)
  let image = GrayImage::new(width=5, height=0, fill=Gray::new(28))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=5, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 0 })
  let edges = image.edge_map(56)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 249" {
  let size = Size::new(width=6, height=3)
  let image = GrayImage::new(width=6, height=3, fill=Gray::new(39))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=6, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=7), 4)
  assert_true(mask.count(4) == 18)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 3 })
  let edges = image.edge_map(73)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 250" {
  let size = Size::new(width=7, height=6)
  let image = GrayImage::new(width=7, height=6, fill=Gray::new(50))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=7, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=10), 0)
  assert_true(mask.count(0) == 42)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 6 })
  let edges = image.edge_map(90)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 251" {
  let size = Size::new(width=8, height=1)
  let image = GrayImage::new(width=8, height=1, fill=Gray::new(61))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=8, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=5), 1)
  assert_true(mask.count(1) == 8)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 1 })
  let edges = image.edge_map(107)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 252" {
  let size = Size::new(width=0, height=4)
  let image = GrayImage::new(width=0, height=4, fill=Gray::new(72))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=8), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 4 })
  let edges = image.edge_map(124)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 253" {
  let size = Size::new(width=1, height=7)
  let image = GrayImage::new(width=1, height=7, fill=Gray::new(83))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=1, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=11), 3)
  assert_true(mask.count(3) == 7)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 7 })
  let edges = image.edge_map(141)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 254" {
  let size = Size::new(width=2, height=2)
  let image = GrayImage::new(width=2, height=2, fill=Gray::new(94))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=2, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=6), 4)
  assert_true(mask.count(4) == 4)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 2 })
  let edges = image.edge_map(158)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 255" {
  let size = Size::new(width=3, height=5)
  let image = GrayImage::new(width=3, height=5, fill=Gray::new(105))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=3, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=9), 0)
  assert_true(mask.count(0) == 15)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 5 })
  let edges = image.edge_map(175)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 256" {
  let size = Size::new(width=4, height=0)
  let image = GrayImage::new(width=4, height=0, fill=Gray::new(116))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=4, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 0 })
  let edges = image.edge_map(192)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 257" {
  let size = Size::new(width=5, height=3)
  let image = GrayImage::new(width=5, height=3, fill=Gray::new(127))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=5, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=7), 2)
  assert_true(mask.count(2) == 15)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 3 })
  let edges = image.edge_map(209)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 258" {
  let size = Size::new(width=6, height=6)
  let image = GrayImage::new(width=6, height=6, fill=Gray::new(138))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 36)
  let mask = Mask::new(width=6, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=10), 3)
  assert_true(mask.count(3) == 36)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 6 })
  let edges = image.edge_map(226)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 259" {
  let size = Size::new(width=7, height=1)
  let image = GrayImage::new(width=7, height=1, fill=Gray::new(149))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=7, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=5), 4)
  assert_true(mask.count(4) == 7)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 1 })
  let edges = image.edge_map(243)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 260" {
  let size = Size::new(width=8, height=4)
  let image = GrayImage::new(width=8, height=4, fill=Gray::new(160))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 32)
  let mask = Mask::new(width=8, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=8), 0)
  assert_true(mask.count(0) == 32)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 4 })
  let edges = image.edge_map(0)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 261" {
  let size = Size::new(width=0, height=7)
  let image = GrayImage::new(width=0, height=7, fill=Gray::new(171))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=11), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 7 })
  let edges = image.edge_map(17)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 262" {
  let size = Size::new(width=1, height=2)
  let image = GrayImage::new(width=1, height=2, fill=Gray::new(182))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=1, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=6), 2)
  assert_true(mask.count(2) == 2)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 2 })
  let edges = image.edge_map(34)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 263" {
  let size = Size::new(width=2, height=5)
  let image = GrayImage::new(width=2, height=5, fill=Gray::new(193))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=2, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=9), 3)
  assert_true(mask.count(3) == 10)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 5 })
  let edges = image.edge_map(51)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 264" {
  let size = Size::new(width=3, height=0)
  let image = GrayImage::new(width=3, height=0, fill=Gray::new(204))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=3, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 0 })
  let edges = image.edge_map(68)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 265" {
  let size = Size::new(width=4, height=3)
  let image = GrayImage::new(width=4, height=3, fill=Gray::new(215))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=4, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=7), 0)
  assert_true(mask.count(0) == 12)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 3 })
  let edges = image.edge_map(85)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 266" {
  let size = Size::new(width=5, height=6)
  let image = GrayImage::new(width=5, height=6, fill=Gray::new(226))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=5, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=10), 1)
  assert_true(mask.count(1) == 30)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 6 })
  let edges = image.edge_map(102)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 267" {
  let size = Size::new(width=6, height=1)
  let image = GrayImage::new(width=6, height=1, fill=Gray::new(237))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=6, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=5), 2)
  assert_true(mask.count(2) == 6)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 1 })
  let edges = image.edge_map(119)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 268" {
  let size = Size::new(width=7, height=4)
  let image = GrayImage::new(width=7, height=4, fill=Gray::new(248))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=7, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=8), 3)
  assert_true(mask.count(3) == 28)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 4 })
  let edges = image.edge_map(136)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 269" {
  let size = Size::new(width=8, height=7)
  let image = GrayImage::new(width=8, height=7, fill=Gray::new(259))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 56)
  let mask = Mask::new(width=8, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=11), 4)
  assert_true(mask.count(4) == 56)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 7 })
  let edges = image.edge_map(153)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 270" {
  let size = Size::new(width=0, height=2)
  let image = GrayImage::new(width=0, height=2, fill=Gray::new(270))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=6), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 2 })
  let edges = image.edge_map(170)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 271" {
  let size = Size::new(width=1, height=5)
  let image = GrayImage::new(width=1, height=5, fill=Gray::new(281))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=1, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=9), 1)
  assert_true(mask.count(1) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 5 })
  let edges = image.edge_map(187)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 272" {
  let size = Size::new(width=2, height=0)
  let image = GrayImage::new(width=2, height=0, fill=Gray::new(292))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=2, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 0 })
  let edges = image.edge_map(204)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 273" {
  let size = Size::new(width=3, height=3)
  let image = GrayImage::new(width=3, height=3, fill=Gray::new(3))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 9)
  let mask = Mask::new(width=3, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=7), 3)
  assert_true(mask.count(3) == 9)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 3 })
  let edges = image.edge_map(221)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 274" {
  let size = Size::new(width=4, height=6)
  let image = GrayImage::new(width=4, height=6, fill=Gray::new(14))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=4, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=10), 4)
  assert_true(mask.count(4) == 24)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 6 })
  let edges = image.edge_map(238)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 275" {
  let size = Size::new(width=5, height=1)
  let image = GrayImage::new(width=5, height=1, fill=Gray::new(25))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=5, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=5), 0)
  assert_true(mask.count(0) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 1 })
  let edges = image.edge_map(255)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 276" {
  let size = Size::new(width=6, height=4)
  let image = GrayImage::new(width=6, height=4, fill=Gray::new(36))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=6, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=8), 1)
  assert_true(mask.count(1) == 24)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 4 })
  let edges = image.edge_map(12)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 277" {
  let size = Size::new(width=7, height=7)
  let image = GrayImage::new(width=7, height=7, fill=Gray::new(47))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 49)
  let mask = Mask::new(width=7, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=11), 2)
  assert_true(mask.count(2) == 49)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 7 })
  let edges = image.edge_map(29)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 278" {
  let size = Size::new(width=8, height=2)
  let image = GrayImage::new(width=8, height=2, fill=Gray::new(58))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=8, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=6), 3)
  assert_true(mask.count(3) == 16)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 2 })
  let edges = image.edge_map(46)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 279" {
  let size = Size::new(width=0, height=5)
  let image = GrayImage::new(width=0, height=5, fill=Gray::new(69))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=9), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 5 })
  let edges = image.edge_map(63)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 280" {
  let size = Size::new(width=1, height=0)
  let image = GrayImage::new(width=1, height=0, fill=Gray::new(80))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=1, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 0 })
  let edges = image.edge_map(80)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 281" {
  let size = Size::new(width=2, height=3)
  let image = GrayImage::new(width=2, height=3, fill=Gray::new(91))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=2, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=7), 1)
  assert_true(mask.count(1) == 6)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 3 })
  let edges = image.edge_map(97)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 282" {
  let size = Size::new(width=3, height=6)
  let image = GrayImage::new(width=3, height=6, fill=Gray::new(102))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=3, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=10), 2)
  assert_true(mask.count(2) == 18)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 6 })
  let edges = image.edge_map(114)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 283" {
  let size = Size::new(width=4, height=1)
  let image = GrayImage::new(width=4, height=1, fill=Gray::new(113))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=4, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=5), 3)
  assert_true(mask.count(3) == 4)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 1 })
  let edges = image.edge_map(131)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 284" {
  let size = Size::new(width=5, height=4)
  let image = GrayImage::new(width=5, height=4, fill=Gray::new(124))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=5, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=8), 4)
  assert_true(mask.count(4) == 20)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 4 })
  let edges = image.edge_map(148)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 285" {
  let size = Size::new(width=6, height=7)
  let image = GrayImage::new(width=6, height=7, fill=Gray::new(135))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=6, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=11), 0)
  assert_true(mask.count(0) == 42)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 7 })
  let edges = image.edge_map(165)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 286" {
  let size = Size::new(width=7, height=2)
  let image = GrayImage::new(width=7, height=2, fill=Gray::new(146))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=7, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=6), 1)
  assert_true(mask.count(1) == 14)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 2 })
  let edges = image.edge_map(182)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 287" {
  let size = Size::new(width=8, height=5)
  let image = GrayImage::new(width=8, height=5, fill=Gray::new(157))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 40)
  let mask = Mask::new(width=8, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=9), 2)
  assert_true(mask.count(2) == 40)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 5 })
  let edges = image.edge_map(199)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 288" {
  let size = Size::new(width=0, height=0)
  let image = GrayImage::new(width=0, height=0, fill=Gray::new(168))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 0 })
  let edges = image.edge_map(216)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 289" {
  let size = Size::new(width=1, height=3)
  let image = GrayImage::new(width=1, height=3, fill=Gray::new(179))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=1, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=7), 4)
  assert_true(mask.count(4) == 3)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 3 })
  let edges = image.edge_map(233)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 290" {
  let size = Size::new(width=2, height=6)
  let image = GrayImage::new(width=2, height=6, fill=Gray::new(190))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=2, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=10), 0)
  assert_true(mask.count(0) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 6 })
  let edges = image.edge_map(250)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 291" {
  let size = Size::new(width=3, height=1)
  let image = GrayImage::new(width=3, height=1, fill=Gray::new(201))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=3, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=5), 1)
  assert_true(mask.count(1) == 3)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 1 })
  let edges = image.edge_map(7)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 292" {
  let size = Size::new(width=4, height=4)
  let image = GrayImage::new(width=4, height=4, fill=Gray::new(212))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=4, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=8), 2)
  assert_true(mask.count(2) == 16)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 4 })
  let edges = image.edge_map(24)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 293" {
  let size = Size::new(width=5, height=7)
  let image = GrayImage::new(width=5, height=7, fill=Gray::new(223))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=5, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=11), 3)
  assert_true(mask.count(3) == 35)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 7 })
  let edges = image.edge_map(41)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 294" {
  let size = Size::new(width=6, height=2)
  let image = GrayImage::new(width=6, height=2, fill=Gray::new(234))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=6, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=6), 4)
  assert_true(mask.count(4) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 2 })
  let edges = image.edge_map(58)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 295" {
  let size = Size::new(width=7, height=5)
  let image = GrayImage::new(width=7, height=5, fill=Gray::new(245))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=7, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=9), 0)
  assert_true(mask.count(0) == 35)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 5 })
  let edges = image.edge_map(75)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 296" {
  let size = Size::new(width=8, height=0)
  let image = GrayImage::new(width=8, height=0, fill=Gray::new(256))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=8, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 0 })
  let edges = image.edge_map(92)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 297" {
  let size = Size::new(width=0, height=3)
  let image = GrayImage::new(width=0, height=3, fill=Gray::new(267))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=7), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 3 })
  let edges = image.edge_map(109)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 298" {
  let size = Size::new(width=1, height=6)
  let image = GrayImage::new(width=1, height=6, fill=Gray::new(278))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=1, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=10), 3)
  assert_true(mask.count(3) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 6 })
  let edges = image.edge_map(126)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 299" {
  let size = Size::new(width=2, height=1)
  let image = GrayImage::new(width=2, height=1, fill=Gray::new(289))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=2, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=5), 4)
  assert_true(mask.count(4) == 2)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 1 })
  let edges = image.edge_map(143)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 300" {
  let size = Size::new(width=3, height=4)
  let image = GrayImage::new(width=3, height=4, fill=Gray::new(0))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=3, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=8), 0)
  assert_true(mask.count(0) == 12)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 4 })
  let edges = image.edge_map(160)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 301" {
  let size = Size::new(width=4, height=7)
  let image = GrayImage::new(width=4, height=7, fill=Gray::new(11))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=4, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=11), 1)
  assert_true(mask.count(1) == 28)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 7 })
  let edges = image.edge_map(177)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 302" {
  let size = Size::new(width=5, height=2)
  let image = GrayImage::new(width=5, height=2, fill=Gray::new(22))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=5, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=6), 2)
  assert_true(mask.count(2) == 10)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 2 })
  let edges = image.edge_map(194)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 303" {
  let size = Size::new(width=6, height=5)
  let image = GrayImage::new(width=6, height=5, fill=Gray::new(33))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=6, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=9), 3)
  assert_true(mask.count(3) == 30)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 5 })
  let edges = image.edge_map(211)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 304" {
  let size = Size::new(width=7, height=0)
  let image = GrayImage::new(width=7, height=0, fill=Gray::new(44))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=7, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 0 })
  let edges = image.edge_map(228)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 305" {
  let size = Size::new(width=8, height=3)
  let image = GrayImage::new(width=8, height=3, fill=Gray::new(55))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=8, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=7), 0)
  assert_true(mask.count(0) == 24)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 3 })
  let edges = image.edge_map(245)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 306" {
  let size = Size::new(width=0, height=6)
  let image = GrayImage::new(width=0, height=6, fill=Gray::new(66))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=10), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 6 })
  let edges = image.edge_map(2)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 307" {
  let size = Size::new(width=1, height=1)
  let image = GrayImage::new(width=1, height=1, fill=Gray::new(77))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 1)
  let mask = Mask::new(width=1, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=5), 2)
  assert_true(mask.count(2) == 1)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 1 })
  let edges = image.edge_map(19)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 308" {
  let size = Size::new(width=2, height=4)
  let image = GrayImage::new(width=2, height=4, fill=Gray::new(88))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=2, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=8), 3)
  assert_true(mask.count(3) == 8)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 4 })
  let edges = image.edge_map(36)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 309" {
  let size = Size::new(width=3, height=7)
  let image = GrayImage::new(width=3, height=7, fill=Gray::new(99))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=3, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=11), 4)
  assert_true(mask.count(4) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 7 })
  let edges = image.edge_map(53)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 310" {
  let size = Size::new(width=4, height=2)
  let image = GrayImage::new(width=4, height=2, fill=Gray::new(110))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=4, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=6), 0)
  assert_true(mask.count(0) == 8)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 2 })
  let edges = image.edge_map(70)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 311" {
  let size = Size::new(width=5, height=5)
  let image = GrayImage::new(width=5, height=5, fill=Gray::new(121))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 25)
  let mask = Mask::new(width=5, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=9), 1)
  assert_true(mask.count(1) == 25)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 5 })
  let edges = image.edge_map(87)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 312" {
  let size = Size::new(width=6, height=0)
  let image = GrayImage::new(width=6, height=0, fill=Gray::new(132))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=6, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 0 })
  let edges = image.edge_map(104)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 313" {
  let size = Size::new(width=7, height=3)
  let image = GrayImage::new(width=7, height=3, fill=Gray::new(143))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 21)
  let mask = Mask::new(width=7, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=7), 3)
  assert_true(mask.count(3) == 21)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 3 })
  let edges = image.edge_map(121)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 314" {
  let size = Size::new(width=8, height=6)
  let image = GrayImage::new(width=8, height=6, fill=Gray::new(154))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 48)
  let mask = Mask::new(width=8, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=10), 4)
  assert_true(mask.count(4) == 48)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 6 })
  let edges = image.edge_map(138)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 315" {
  let size = Size::new(width=0, height=1)
  let image = GrayImage::new(width=0, height=1, fill=Gray::new(165))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=5), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 1 })
  let edges = image.edge_map(155)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 316" {
  let size = Size::new(width=1, height=4)
  let image = GrayImage::new(width=1, height=4, fill=Gray::new(176))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=1, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=8), 1)
  assert_true(mask.count(1) == 4)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 4 })
  let edges = image.edge_map(172)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 317" {
  let size = Size::new(width=2, height=7)
  let image = GrayImage::new(width=2, height=7, fill=Gray::new(187))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=2, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=11), 2)
  assert_true(mask.count(2) == 14)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 7 })
  let edges = image.edge_map(189)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 318" {
  let size = Size::new(width=3, height=2)
  let image = GrayImage::new(width=3, height=2, fill=Gray::new(198))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=3, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=6), 3)
  assert_true(mask.count(3) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 2 })
  let edges = image.edge_map(206)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 319" {
  let size = Size::new(width=4, height=5)
  let image = GrayImage::new(width=4, height=5, fill=Gray::new(209))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=4, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=9), 4)
  assert_true(mask.count(4) == 20)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 5 })
  let edges = image.edge_map(223)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 320" {
  let size = Size::new(width=5, height=0)
  let image = GrayImage::new(width=5, height=0, fill=Gray::new(220))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=5, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 0 })
  let edges = image.edge_map(240)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 321" {
  let size = Size::new(width=6, height=3)
  let image = GrayImage::new(width=6, height=3, fill=Gray::new(231))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=6, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=7), 1)
  assert_true(mask.count(1) == 18)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 3 })
  let edges = image.edge_map(257)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 322" {
  let size = Size::new(width=7, height=6)
  let image = GrayImage::new(width=7, height=6, fill=Gray::new(242))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=7, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=10), 2)
  assert_true(mask.count(2) == 42)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 6 })
  let edges = image.edge_map(14)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 323" {
  let size = Size::new(width=8, height=1)
  let image = GrayImage::new(width=8, height=1, fill=Gray::new(253))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 8)
  let mask = Mask::new(width=8, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=5), 3)
  assert_true(mask.count(3) == 8)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 1 })
  let edges = image.edge_map(31)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 324" {
  let size = Size::new(width=0, height=4)
  let image = GrayImage::new(width=0, height=4, fill=Gray::new(264))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=8), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 4 })
  let edges = image.edge_map(48)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 325" {
  let size = Size::new(width=1, height=7)
  let image = GrayImage::new(width=1, height=7, fill=Gray::new(275))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=1, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=11), 0)
  assert_true(mask.count(0) == 7)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 7 })
  let edges = image.edge_map(65)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 326" {
  let size = Size::new(width=2, height=2)
  let image = GrayImage::new(width=2, height=2, fill=Gray::new(286))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=2, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=6), 1)
  assert_true(mask.count(1) == 4)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 2 })
  let edges = image.edge_map(82)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 327" {
  let size = Size::new(width=3, height=5)
  let image = GrayImage::new(width=3, height=5, fill=Gray::new(297))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=3, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=9), 2)
  assert_true(mask.count(2) == 15)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 5 })
  let edges = image.edge_map(99)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 328" {
  let size = Size::new(width=4, height=0)
  let image = GrayImage::new(width=4, height=0, fill=Gray::new(8))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=4, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 0 })
  let edges = image.edge_map(116)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 329" {
  let size = Size::new(width=5, height=3)
  let image = GrayImage::new(width=5, height=3, fill=Gray::new(19))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 15)
  let mask = Mask::new(width=5, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=7), 4)
  assert_true(mask.count(4) == 15)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 3 })
  let edges = image.edge_map(133)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 330" {
  let size = Size::new(width=6, height=6)
  let image = GrayImage::new(width=6, height=6, fill=Gray::new(30))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 36)
  let mask = Mask::new(width=6, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=10), 0)
  assert_true(mask.count(0) == 36)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 6 })
  let edges = image.edge_map(150)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 331" {
  let size = Size::new(width=7, height=1)
  let image = GrayImage::new(width=7, height=1, fill=Gray::new(41))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 7)
  let mask = Mask::new(width=7, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=5), 1)
  assert_true(mask.count(1) == 7)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 1 })
  let edges = image.edge_map(167)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 332" {
  let size = Size::new(width=8, height=4)
  let image = GrayImage::new(width=8, height=4, fill=Gray::new(52))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 32)
  let mask = Mask::new(width=8, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=8), 2)
  assert_true(mask.count(2) == 32)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 4 })
  let edges = image.edge_map(184)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 333" {
  let size = Size::new(width=0, height=7)
  let image = GrayImage::new(width=0, height=7, fill=Gray::new(63))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=11), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 7 })
  let edges = image.edge_map(201)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 334" {
  let size = Size::new(width=1, height=2)
  let image = GrayImage::new(width=1, height=2, fill=Gray::new(74))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=1, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=6), 4)
  assert_true(mask.count(4) == 2)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 2 })
  let edges = image.edge_map(218)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 335" {
  let size = Size::new(width=2, height=5)
  let image = GrayImage::new(width=2, height=5, fill=Gray::new(85))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=2, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=9), 0)
  assert_true(mask.count(0) == 10)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 5 })
  let edges = image.edge_map(235)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 336" {
  let size = Size::new(width=3, height=0)
  let image = GrayImage::new(width=3, height=0, fill=Gray::new(96))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=3, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 0 })
  let edges = image.edge_map(252)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 337" {
  let size = Size::new(width=4, height=3)
  let image = GrayImage::new(width=4, height=3, fill=Gray::new(107))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=4, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=7), 2)
  assert_true(mask.count(2) == 12)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 3 })
  let edges = image.edge_map(9)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 338" {
  let size = Size::new(width=5, height=6)
  let image = GrayImage::new(width=5, height=6, fill=Gray::new(118))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=3, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=5, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=10), 3)
  assert_true(mask.count(3) == 30)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 6 })
  let edges = image.edge_map(26)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 339" {
  let size = Size::new(width=6, height=1)
  let image = GrayImage::new(width=6, height=1, fill=Gray::new(129))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=1, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=6, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=5), 4)
  assert_true(mask.count(4) == 6)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 1 })
  let edges = image.edge_map(43)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 340" {
  let size = Size::new(width=7, height=4)
  let image = GrayImage::new(width=7, height=4, fill=Gray::new(140))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=6, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=7, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=8), 0)
  assert_true(mask.count(0) == 28)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 4 })
  let edges = image.edge_map(60)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 341" {
  let size = Size::new(width=8, height=7)
  let image = GrayImage::new(width=8, height=7, fill=Gray::new(151))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=4, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 56)
  let mask = Mask::new(width=8, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=11), 1)
  assert_true(mask.count(1) == 56)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 7 })
  let edges = image.edge_map(77)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 342" {
  let size = Size::new(width=0, height=2)
  let image = GrayImage::new(width=0, height=2, fill=Gray::new(162))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=2, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=6), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 2 })
  let edges = image.edge_map(94)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 343" {
  let size = Size::new(width=1, height=5)
  let image = GrayImage::new(width=1, height=5, fill=Gray::new(173))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=0, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=1, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=9), 3)
  assert_true(mask.count(3) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 5 })
  let edges = image.edge_map(111)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 344" {
  let size = Size::new(width=2, height=0)
  let image = GrayImage::new(width=2, height=0, fill=Gray::new(184))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=4, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=5, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=2, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=4), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 0 })
  let edges = image.edge_map(128)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 345" {
  let size = Size::new(width=3, height=3)
  let image = GrayImage::new(width=3, height=3, fill=Gray::new(195))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=3, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 9)
  let mask = Mask::new(width=3, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=7), 0)
  assert_true(mask.count(0) == 9)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 3 })
  let edges = image.edge_map(145)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 346" {
  let size = Size::new(width=4, height=6)
  let image = GrayImage::new(width=4, height=6, fill=Gray::new(206))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=1, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=4, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=10), 1)
  assert_true(mask.count(1) == 24)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 6 })
  let edges = image.edge_map(162)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 347" {
  let size = Size::new(width=5, height=1)
  let image = GrayImage::new(width=5, height=1, fill=Gray::new(217))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=6, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 5)
  let mask = Mask::new(width=5, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=5), 2)
  assert_true(mask.count(2) == 5)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 1 })
  let edges = image.edge_map(179)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 348" {
  let size = Size::new(width=6, height=4)
  let image = GrayImage::new(width=6, height=4, fill=Gray::new(228))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=4, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=6, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=8), 3)
  assert_true(mask.count(3) == 24)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 4 })
  let edges = image.edge_map(196)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 349" {
  let size = Size::new(width=7, height=7)
  let image = GrayImage::new(width=7, height=7, fill=Gray::new(239))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=10, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=2, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 49)
  let mask = Mask::new(width=7, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=11), 4)
  assert_true(mask.count(4) == 49)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 7 })
  let edges = image.edge_map(213)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 350" {
  let size = Size::new(width=8, height=2)
  let image = GrayImage::new(width=8, height=2, fill=Gray::new(250))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=12, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=0, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=8, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=6), 0)
  assert_true(mask.count(0) == 16)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 2 })
  let edges = image.edge_map(230)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 351" {
  let size = Size::new(width=0, height=5)
  let image = GrayImage::new(width=0, height=5, fill=Gray::new(261))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=5, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=9), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 5 })
  let edges = image.edge_map(247)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 352" {
  let size = Size::new(width=1, height=0)
  let image = GrayImage::new(width=1, height=0, fill=Gray::new(272))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=3, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 1)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=3, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=1, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=4), 2)
  assert_true(mask.count(2) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 0 })
  let edges = image.edge_map(4)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 353" {
  let size = Size::new(width=2, height=3)
  let image = GrayImage::new(width=2, height=3, fill=Gray::new(283))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=1, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=2, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=7), 3)
  assert_true(mask.count(3) == 6)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 3 })
  let edges = image.edge_map(21)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 354" {
  let size = Size::new(width=3, height=6)
  let image = GrayImage::new(width=3, height=6, fill=Gray::new(294))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=6, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 18)
  let mask = Mask::new(width=3, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=10), 4)
  assert_true(mask.count(4) == 18)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 6 })
  let edges = image.edge_map(38)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 355" {
  let size = Size::new(width=4, height=1)
  let image = GrayImage::new(width=4, height=1, fill=Gray::new(5))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=4, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 4)
  let mask = Mask::new(width=4, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=5), 0)
  assert_true(mask.count(0) == 4)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 1 })
  let edges = image.edge_map(55)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 356" {
  let size = Size::new(width=5, height=4)
  let image = GrayImage::new(width=5, height=4, fill=Gray::new(16))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=2, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 20)
  let mask = Mask::new(width=5, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=8), 1)
  assert_true(mask.count(1) == 20)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 4 })
  let edges = image.edge_map(72)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 357" {
  let size = Size::new(width=6, height=7)
  let image = GrayImage::new(width=6, height=7, fill=Gray::new(27))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=9, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=0, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 42)
  let mask = Mask::new(width=6, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=11), 2)
  assert_true(mask.count(2) == 42)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 7 })
  let edges = image.edge_map(89)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 358" {
  let size = Size::new(width=7, height=2)
  let image = GrayImage::new(width=7, height=2, fill=Gray::new(38))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 11)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=5, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 14)
  let mask = Mask::new(width=7, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=6), 3)
  assert_true(mask.count(3) == 14)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 2 })
  let edges = image.edge_map(106)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 359" {
  let size = Size::new(width=8, height=5)
  let image = GrayImage::new(width=8, height=5, fill=Gray::new(49))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=13, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 14)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=3, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 40)
  let mask = Mask::new(width=8, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=9), 4)
  assert_true(mask.count(4) == 40)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 5 })
  let edges = image.edge_map(123)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 360" {
  let size = Size::new(width=0, height=0)
  let image = GrayImage::new(width=0, height=0, fill=Gray::new(60))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=2, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 0)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=1, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=4), 0)
  assert_true(mask.count(0) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 0 })
  let edges = image.edge_map(140)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 361" {
  let size = Size::new(width=1, height=3)
  let image = GrayImage::new(width=1, height=3, fill=Gray::new(71))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=4, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=6, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=1, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=7), 1)
  assert_true(mask.count(1) == 3)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 3 })
  let edges = image.edge_map(157)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 362" {
  let size = Size::new(width=2, height=6)
  let image = GrayImage::new(width=2, height=6, fill=Gray::new(82))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=6, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=4, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=2, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=10), 2)
  assert_true(mask.count(2) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 2 } else { 6 })
  let edges = image.edge_map(174)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 363" {
  let size = Size::new(width=3, height=1)
  let image = GrayImage::new(width=3, height=1, fill=Gray::new(93))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=8, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=2, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 3)
  let mask = Mask::new(width=3, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=5), 3)
  assert_true(mask.count(3) == 3)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 3 } else { 1 })
  let edges = image.edge_map(191)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 364" {
  let size = Size::new(width=4, height=4)
  let image = GrayImage::new(width=4, height=4, fill=Gray::new(104))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=0, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 16)
  let mask = Mask::new(width=4, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=8), 4)
  assert_true(mask.count(4) == 16)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 4 } else { 4 })
  let edges = image.edge_map(208)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 365" {
  let size = Size::new(width=5, height=7)
  let image = GrayImage::new(width=5, height=7, fill=Gray::new(115))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=8, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=5, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=5, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=11), 0)
  assert_true(mask.count(0) == 35)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 5 } else { 7 })
  let edges = image.edge_map(225)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 366" {
  let size = Size::new(width=6, height=2)
  let image = GrayImage::new(width=6, height=2, fill=Gray::new(126))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=10, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=3, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=6, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=6), 1)
  assert_true(mask.count(1) == 12)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 6 } else { 2 })
  let edges = image.edge_map(242)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 367" {
  let size = Size::new(width=7, height=5)
  let image = GrayImage::new(width=7, height=5, fill=Gray::new(137))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=12, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 13)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=1, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 35)
  let mask = Mask::new(width=7, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=9), 2)
  assert_true(mask.count(2) == 35)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 7 } else { 5 })
  let edges = image.edge_map(259)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 368" {
  let size = Size::new(width=8, height=0)
  let image = GrayImage::new(width=8, height=0, fill=Gray::new(148))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=10, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=6, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=8, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=4), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 8 } else { 0 })
  let edges = image.edge_map(16)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 369" {
  let size = Size::new(width=0, height=3)
  let image = GrayImage::new(width=0, height=3, fill=Gray::new(159))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=3, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 2)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=4, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=7), 4)
  assert_true(mask.count(4) == 0)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(-1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 0 } else { 3 })
  let edges = image.edge_map(33)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 370" {
  let size = Size::new(width=1, height=6)
  let image = GrayImage::new(width=1, height=6, fill=Gray::new(170))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=5, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 5)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=2, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 6)
  let mask = Mask::new(width=1, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=10), 0)
  assert_true(mask.count(0) == 6)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(0, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 1 } else { 6 })
  let edges = image.edge_map(50)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 371" {
  let size = Size::new(width=2, height=1)
  let image = GrayImage::new(width=2, height=1, fill=Gray::new(181))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(3, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=7, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 8)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=0, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 2)
  let mask = Mask::new(width=2, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=6, height=5), 1)
  assert_true(mask.count(1) == 2)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=3, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 2 } else { 1 })
  let edges = image.edge_map(67)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 372" {
  let size = Size::new(width=3, height=4)
  let image = GrayImage::new(width=3, height=4, fill=Gray::new(192))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(4, 5, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=5, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 3)
  assert_eq(padded.height, 4)
  let resized = image.resize_nearest(Size::new(width=5, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 12)
  let mask = Mask::new(width=3, height=4)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=7, height=8), 2)
  assert_true(mask.count(2) == 12)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=4, height=5),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(4).translate(-1, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 3 } else { 4 })
  let edges = image.edge_map(84)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 373" {
  let size = Size::new(width=4, height=7)
  let image = GrayImage::new(width=4, height=7, fill=Gray::new(203))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(5, 8, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=7, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 6)
  assert_eq(padded.height, 9)
  let resized = image.resize_nearest(Size::new(width=3, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 28)
  let mask = Mask::new(width=4, height=7)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=8, height=11), 3)
  assert_true(mask.count(3) == 28)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=5, height=8),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(5).translate(0, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 4 } else { 7 })
  let edges = image.edge_map(101)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 374" {
  let size = Size::new(width=5, height=2)
  let image = GrayImage::new(width=5, height=2, fill=Gray::new(214))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(6, 3, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=9, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 9)
  assert_eq(padded.height, 6)
  let resized = image.resize_nearest(Size::new(width=1, height=2))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 10)
  let mask = Mask::new(width=5, height=2)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=9, height=6), 4)
  assert_true(mask.count(4) == 10)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=6, height=3),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(6).translate(1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 5 } else { 2 })
  let edges = image.edge_map(118)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 375" {
  let size = Size::new(width=6, height=5)
  let image = GrayImage::new(width=6, height=5, fill=Gray::new(225))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(7, 6, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=11, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 12)
  assert_eq(padded.height, 11)
  let resized = image.resize_nearest(Size::new(width=6, height=3))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 30)
  let mask = Mask::new(width=6, height=5)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=10, height=9), 0)
  assert_true(mask.count(0) == 30)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=7, height=6),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=-2, dy=0)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(7).translate(-1, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 6 } else { 5 })
  let edges = image.edge_map(135)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 376" {
  let size = Size::new(width=7, height=0)
  let image = GrayImage::new(width=7, height=0, fill=Gray::new(236))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(8, 1, Gray::black())
  let clipped = image.crop(Rect::new(x=-0, y=-0, width=9, height=2))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(0, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 0)
  let resized = image.resize_nearest(Size::new(width=4, height=4))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=7, height=0)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=11, height=4), 1)
  assert_true(mask.count(1) == 0)
  let box = Box2D::new(
    label=Label::new(id=0, name="case"),
    rect=Rect::new(x=-1, y=-1, width=8, height=1),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=-1, dy=1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(0).translate(0, -2, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 7 } else { 0 })
  let edges = image.edge_map(152)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 377" {
  let size = Size::new(width=8, height=3)
  let image = GrayImage::new(width=8, height=3, fill=Gray::new(247))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(9, 4, Gray::black())
  let clipped = image.crop(Rect::new(x=-1, y=-1, width=11, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(1, Gray::new(17))
  assert_eq(padded.width, 10)
  assert_eq(padded.height, 5)
  let resized = image.resize_nearest(Size::new(width=2, height=5))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 24)
  let mask = Mask::new(width=8, height=3)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=12, height=7), 2)
  assert_true(mask.count(2) == 24)
  let box = Box2D::new(
    label=Label::new(id=1, name="case"),
    rect=Rect::new(x=-1, y=-1, width=9, height=4),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 3, dx=0, dy=2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(1).translate(1, -1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 8 } else { 3 })
  let edges = image.edge_map(169)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 378" {
  let size = Size::new(width=0, height=6)
  let image = GrayImage::new(width=0, height=6, fill=Gray::new(258))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(1, 7, Gray::black())
  let clipped = image.crop(Rect::new(x=-2, y=-2, width=4, height=10))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(2, Gray::new(17))
  assert_eq(padded.width, 4)
  assert_eq(padded.height, 10)
  let resized = image.resize_nearest(Size::new(width=0, height=0))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 0)
  let mask = Mask::new(width=0, height=6)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=4, height=10), 3)
  assert_true(mask.count(3) == 0)
  let box = Box2D::new(
    label=Label::new(id=2, name="case"),
    rect=Rect::new(x=-1, y=-1, width=1, height=7),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 1, dx=1, dy=-2)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(2).translate(-1, 0, Gray::black())
  assert_eq(transformed.width, if 0 == 0 { 0 } else { 6 })
  let edges = image.edge_map(186)
  assert_eq(edges.size(), size)
}

///|
test "boundary matrix 379" {
  let size = Size::new(width=1, height=1)
  let image = GrayImage::new(width=1, height=1, fill=Gray::new(269))
  assert_eq(image.size(), size)
  assert_eq(image.in_bounds(-1, -1), false)
  image.set(-1, -1, Gray::white())
  image.set(2, 2, Gray::black())
  let clipped = image.crop(Rect::new(x=-3, y=-3, width=6, height=6))
  assert_true(clipped.width >= 0)
  assert_true(clipped.height >= 0)
  let padded = image.pad(3, Gray::new(17))
  assert_eq(padded.width, 7)
  assert_eq(padded.height, 7)
  let resized = image.resize_nearest(Size::new(width=5, height=1))
  assert_true(resized.width >= 0 && resized.height >= 0)
  let stats = image.stats()
  assert_true(stats.min >= 0 && stats.max <= 255)
  assert_true(stats.count == 1)
  let mask = Mask::new(width=1, height=1)
  mask.fill_rect(Rect::new(x=-2, y=-2, width=5, height=5), 4)
  assert_true(mask.count(4) == 1)
  let box = Box2D::new(
    label=Label::new(id=3, name="case"),
    rect=Rect::new(x=-1, y=-1, width=2, height=2),
  )
  assert_true(box.clip(size).rect.width >= 0)
  let flow = constant_flow(size, 2, dx=2, dy=-1)
  assert_true(flow.length() >= 0)
  let transformed = image.rotate(3).translate(0, 1, Gray::black())
  assert_eq(transformed.width, if 1 == 0 { 1 } else { 1 })
  let edges = image.edge_map(203)
  assert_eq(edges.size(), size)
}
