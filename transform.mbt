///|
pub fn GrayImage::translate(
  self : GrayImage,
  dx : Int,
  dy : Int,
  fill : Gray,
) -> GrayImage {
  let out = GrayImage::new(width=self.width, height=self.height, fill~)
  for y in 0..<self.height {
    for x in 0..<self.width {
      let sx = x - dx
      let sy = y - dy
      if self.in_bounds(sx, sy) {
        out.set(x, y, self.get(sx, sy))
      }
    }
  }
  out
}

///|
pub fn GrayImage::rotate90_cw(self : GrayImage) -> GrayImage {
  let out = GrayImage::new(width=self.height, height=self.width)
  for y in 0..<self.height {
    for x in 0..<self.width {
      out.set(self.height - y - 1, x, self.get(x, y))
    }
  }
  out
}

///|
pub fn GrayImage::rotate90_ccw(self : GrayImage) -> GrayImage {
  let out = GrayImage::new(width=self.height, height=self.width)
  for y in 0..<self.height {
    for x in 0..<self.width {
      out.set(y, self.width - x - 1, self.get(x, y))
    }
  }
  out
}

///|
pub fn GrayImage::rotate(self : GrayImage, turns : Int) -> GrayImage {
  let normalized = (turns % 4 + 4) % 4
  if normalized == 0 {
    self.copy()
  } else if normalized == 1 {
    self.rotate90_cw()
  } else if normalized == 2 {
    self.rotate180()
  } else {
    self.rotate90_ccw()
  }
}

///|
pub fn GrayImage::multiply_contrast(
  self : GrayImage,
  numerator : Int,
  denominator : Int,
) -> GrayImage {
  let den = if denominator == 0 { 1 } else { denominator }
  self.map(fn(value) { value * numerator / den })
}

///|
pub fn GrayImage::add_brightness(self : GrayImage, delta : Int) -> GrayImage {
  self.map(fn(value) { value + delta })
}

///|
pub fn GrayImage::posterize(self : GrayImage, levels : Int) -> GrayImage {
  let n = max_i(2, levels)
  self.map(fn(value) { value / 256 * 256 / n * n + 255 / n })
}

///|
pub fn GrayImage::quantize(self : GrayImage, levels : Int) -> GrayImage {
  let n = max_i(2, levels)
  self.map(fn(value) { value * (n - 1) / 255 * 255 / (n - 1) })
}

///|
pub fn GrayImage::erode(self : GrayImage, radius : Int) -> GrayImage {
  let r = max_i(0, radius)
  let out = GrayImage::new(width=self.width, height=self.height)
  for y in 0..<self.height {
    for x in 0..<self.width {
      let mut value = 255
      for yy in (y - r)..<=(y + r) {
        for xx in (x - r)..<=(x + r) {
          if self.in_bounds(xx, yy) {
            value = min_i(value, self.get(xx, yy).value)
          }
        }
      }
      out.set(x, y, Gray::new(value))
    }
  }
  out
}

///|
pub fn GrayImage::dilate(self : GrayImage, radius : Int) -> GrayImage {
  let r = max_i(0, radius)
  let out = GrayImage::new(width=self.width, height=self.height)
  for y in 0..<self.height {
    for x in 0..<self.width {
      let mut value = 0
      for yy in (y - r)..<=(y + r) {
        for xx in (x - r)..<=(x + r) {
          if self.in_bounds(xx, yy) {
            value = max_i(value, self.get(xx, yy).value)
          }
        }
      }
      out.set(x, y, Gray::new(value))
    }
  }
  out
}

///|
pub fn GrayImage::open(self : GrayImage, radius : Int) -> GrayImage {
  self.erode(radius).dilate(radius)
}

///|
pub fn GrayImage::close(self : GrayImage, radius : Int) -> GrayImage {
  self.dilate(radius).erode(radius)
}

///|
pub fn GrayImage::sobel_x(self : GrayImage) -> GrayImage {
  let out = GrayImage::new(width=self.width, height=self.height)
  for y in 1..<(self.height - 1) {
    for x in 1..<(self.width - 1) {
      let value = -self.get(x - 1, y - 1).value -
        2 * self.get(x - 1, y).value -
        self.get(x - 1, y + 1).value +
        self.get(x + 1, y - 1).value +
        2 * self.get(x + 1, y).value +
        self.get(x + 1, y + 1).value
      out.set(x, y, Gray::new(abs_i(value)))
    }
  }
  out
}

///|
pub fn GrayImage::sobel_y(self : GrayImage) -> GrayImage {
  let out = GrayImage::new(width=self.width, height=self.height)
  for y in 1..<(self.height - 1) {
    for x in 1..<(self.width - 1) {
      let value = -self.get(x - 1, y - 1).value -
        2 * self.get(x, y - 1).value -
        self.get(x + 1, y - 1).value +
        self.get(x - 1, y + 1).value +
        2 * self.get(x, y + 1).value +
        self.get(x + 1, y + 1).value
      out.set(x, y, Gray::new(abs_i(value)))
    }
  }
  out
}

///|
pub fn GrayImage::edge_map(self : GrayImage, threshold : Int) -> GrayImage {
  let gx = self.sobel_x()
  let gy = self.sobel_y()
  let out = GrayImage::new(width=self.width, height=self.height)
  for y in 0..<self.height {
    for x in 0..<self.width {
      let magnitude = gx.get(x, y).value + gy.get(x, y).value
      out.set(
        x,
        y,
        if magnitude >= threshold {
          Gray::white()
        } else {
          Gray::black()
        },
      )
    }
  }
  out
}

///|
pub fn GrayImage::warp_affine_integer(
  self : GrayImage,
  offset : Point,
  fill : Gray,
) -> GrayImage {
  self.translate(offset.x, offset.y, fill)
}

///|
pub fn transform_boxes(
  boxes : Array[Box2D],
  offset : Point,
  size : Size,
) -> Array[Box2D] {
  let out : Array[Box2D] = []
  for box in boxes {
    out.push(
      box.clip(size).rect
      .translate(offset.x, offset.y)
      .to_box(box.label, box.occluded)
      .clip(size),
    )
  }
  out
}

///|
fn Rect::to_box(self : Rect, label : Label, occluded : Bool) -> Box2D {
  Box2D::new(label~, rect=self, occluded~)
}
