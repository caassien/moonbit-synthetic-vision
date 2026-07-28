///|
pub fn checkerboard(size : Size, square : Int, dark? : Gray = Gray::black(), light? : Gray = Gray::white()) -> GrayImage {
  let img = GrayImage::from_size(size, fill=light)
  let step = max_i(1, square)
  for y in 0..<size.height {
    for x in 0..<size.width {
      if ((x / step) + (y / step)) % 2 == 0 {
        img.set(x, y, dark)
      }
    }
  }
  img
}

///|
pub fn gradient(size : Size, horizontal? : Bool = true) -> GrayImage {
  let img = GrayImage::from_size(size)
  for y in 0..<size.height {
    for x in 0..<size.width {
      let denom = if horizontal { max_i(1, size.width - 1) } else { max_i(1, size.height - 1) }
      let pos = if horizontal { x } else { y }
      img.set(x, y, Gray::new(pos * 255 / denom))
    }
  }
  img
}

///|
pub fn dot_grid(size : Size, spacing : Int, radius : Int) -> GrayImage {
  let img = GrayImage::from_size(size, fill=Gray::white())
  let step = max_i(2, spacing)
  for y in (step / 2)..<size.height {
    if (y - step / 2) % step == 0 {
      for x in (step / 2)..<size.width {
        if (x - step / 2) % step == 0 {
          img.fill_circle(Point::new(x~, y~), radius, Gray::black())
        }
      }
    }
  }
  img
}

///|
pub fn calibration_board(cols~ : Int, rows~ : Int, cell~ : Int, margin? : Int = 12) -> GrayImage {
  let width = cols * cell + margin * 2
  let height = rows * cell + margin * 2
  let img = GrayImage::new(width~, height~, fill=Gray::new(220))
  img.fill_rect(Rect::new(x=margin, y=margin, width=cols * cell, height=rows * cell), Gray::white())
  let board = checkerboard(Size::new(width=cols * cell, height=rows * cell), cell)
  for y in 0..<board.height {
    for x in 0..<board.width {
      img.set(x + margin, y + margin, board.get(x, y))
    }
  }
  img.draw_rect(Rect::new(x=margin, y=margin, width=cols * cell, height=rows * cell), Gray::black())
  img
}

///|
pub fn target_scene(size : Size, seed? : UInt = 7) -> GrayImage {
  let rng = Rng::new(seed)
  let img = gradient(size)
  for _ in 0..<8 {
    let rect = Rect::new(
      x=rng.range(low=0, high=max_i(1, size.width - 12)),
      y=rng.range(low=0, high=max_i(1, size.height - 12)),
      width=rng.range(low=6, high=max_i(7, size.width / 3)),
      height=rng.range(low=6, high=max_i(7, size.height / 3)),
    )
    img.fill_rect(rect, Gray::new(rng.range(low=35, high=230)))
    img.draw_rect(rect, Gray::black())
  }
  for _ in 0..<6 {
    img.fill_circle(
      Point::new(x=rng.range(low=0, high=size.width), y=rng.range(low=0, high=size.height)),
      rng.range(low=3, high=max_i(4, min_i(size.width, size.height) / 8)),
      Gray::new(rng.range(low=30, high=240)),
    )
  }
  img
}
