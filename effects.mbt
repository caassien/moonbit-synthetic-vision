///|
pub fn add_salt_pepper(
  src : GrayImage,
  seed~ : UInt,
  amount_per_1000~ : Int,
) -> GrayImage {
  let rng = Rng::new(seed)
  let out = src.copy()
  let amount = clamp(amount_per_1000, low=0, high=1000)
  for y in 0..<out.height {
    for x in 0..<out.width {
      if rng.chance(numerator=amount, denominator=1000) {
        if rng.chance(numerator=1, denominator=2) {
          out.set(x, y, Gray::black())
        } else {
          out.set(x, y, Gray::white())
        }
      }
    }
  }
  out
}

///|
pub fn add_uniform_noise(
  src : GrayImage,
  seed~ : UInt,
  magnitude~ : Int,
) -> GrayImage {
  let rng = Rng::new(seed)
  src.map(fn(v) { v + rng.signed(magnitude) })
}

///|
pub fn box_blur(src : GrayImage, radius : Int) -> GrayImage {
  let r = max_i(0, radius)
  let out = GrayImage::new(width=src.width, height=src.height)
  for y in 0..<src.height {
    for x in 0..<src.width {
      let mut sum = 0
      let mut count = 0
      for yy in (y - r)..<=(y + r) {
        for xx in (x - r)..<=(x + r) {
          if src.in_bounds(xx, yy) {
            sum = sum + src.get(xx, yy).value
            count = count + 1
          }
        }
      }
      out.set(x, y, Gray::new(sum / max_i(1, count)))
    }
  }
  out
}

///|
pub fn motion_blur_x(src : GrayImage, radius : Int) -> GrayImage {
  let r = max_i(0, radius)
  let out = GrayImage::new(width=src.width, height=src.height)
  for y in 0..<src.height {
    for x in 0..<src.width {
      let mut sum = 0
      let mut count = 0
      for xx in (x - r)..<=(x + r) {
        if src.in_bounds(xx, y) {
          sum = sum + src.get(xx, y).value
          count = count + 1
        }
      }
      out.set(x, y, Gray::new(sum / max_i(1, count)))
    }
  }
  out
}

///|
pub fn occlude(
  src : GrayImage,
  rect : Rect,
  gray? : Gray = Gray::new(32),
) -> GrayImage {
  let out = src.copy()
  out.fill_rect(rect, gray)
  out
}
