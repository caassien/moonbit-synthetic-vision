///|
pub struct ImageStats {
  min : Int
  max : Int
  mean_x1000 : Int
  variance_x1000 : Int
  nonzero : Int
  count : Int
} derive(Debug, Eq)

///|
pub fn ImageStats::from_gray(image : GrayImage) -> ImageStats {
  let count = image.pixels.length()
  if count == 0 {
    { min: 0, max: 0, mean_x1000: 0, variance_x1000: 0, nonzero: 0, count: 0 }
  } else {
    let mut low = 255
    let mut high = 0
    let mut sum = 0
    let mut nonzero = 0
    for value in image.pixels {
      low = min_i(low, value)
      high = max_i(high, value)
      sum += value
      if value != 0 {
        nonzero += 1
      }
    }
    let mean = sum / count * 1000 + sum % count * 1000 / count
    let mut variance_sum = 0
    for value in image.pixels {
      let delta = value * 1000 - mean
      variance_sum += delta * delta / 1000
    }
    {
      min: low,
      max: high,
      mean_x1000: mean,
      variance_x1000: variance_sum / count,
      nonzero,
      count,
    }
  }
}

///|
pub fn ImageStats::dynamic_range(self : ImageStats) -> Int {
  self.max - self.min
}

///|
pub fn ImageStats::is_constant(self : ImageStats) -> Bool {
  self.min == self.max
}

///|
pub fn GrayImage::stats(self : GrayImage) -> ImageStats {
  ImageStats::from_gray(self)
}

///|
pub fn GrayImage::mean(self : GrayImage) -> Int {
  self.stats().mean_x1000 / 1000
}

///|
pub fn GrayImage::sum(self : GrayImage) -> Int {
  let mut total = 0
  for value in self.pixels {
    total += value
  }
  total
}

///|
pub fn GrayImage::count_value(self : GrayImage, value : Int) -> Int {
  let mut total = 0
  for pixel in self.pixels {
    if pixel == clamp_u8(value) {
      total += 1
    }
  }
  total
}

///|
pub fn GrayImage::count_in_range(
  self : GrayImage,
  low : Int,
  high : Int,
) -> Int {
  let lo = clamp_u8(low)
  let hi = clamp_u8(high)
  let mut total = 0
  for pixel in self.pixels {
    if pixel >= lo && pixel <= hi {
      total += 1
    }
  }
  total
}

///|
pub fn GrayImage::mean_abs_error(self : GrayImage, other : GrayImage) -> Int {
  let count = min_i(self.pixels.length(), other.pixels.length())
  if count == 0 {
    0
  } else {
    let mut total = 0
    for i in 0..<count {
      total += abs_i(self.pixels[i] - other.pixels[i])
    }
    total / count
  }
}

///|
pub fn GrayImage::mse_x1000(self : GrayImage, other : GrayImage) -> Int {
  let count = min_i(self.pixels.length(), other.pixels.length())
  if count == 0 {
    0
  } else {
    let mut total = 0
    for i in 0..<count {
      let delta = self.pixels[i] - other.pixels[i]
      total += delta * delta
    }
    total * 1000 / count
  }
}

///|
pub fn GrayImage::psnr_x1000(self : GrayImage, other : GrayImage) -> Int {
  let mse = self.mse_x1000(other)
  if mse == 0 {
    999999
  } else {
    1000 * 10 * 1000 / mse
  }
}

///|
pub fn GrayImage::tile(self : GrayImage, tile_size : Size) -> Array[GrayImage] {
  let out : Array[GrayImage] = []
  let tw = max_i(1, tile_size.width)
  let th = max_i(1, tile_size.height)
  for y in 0..<self.height {
    if y % th == 0 {
      for x in 0..<self.width {
        if x % tw == 0 {
          let w = min_i(tw, self.width - x)
          let h = min_i(th, self.height - y)
          let tile = GrayImage::new(width=w, height=h)
          for yy in 0..<h {
            for xx in 0..<w {
              tile.set(xx, yy, self.get(x + xx, y + yy))
            }
          }
          out.push(tile)
        }
      }
    }
  }
  out
}

///|
pub fn GrayImage::pad(self : GrayImage, border : Int, fill : Gray) -> GrayImage {
  let b = max_i(0, border)
  let out = GrayImage::new(
    width=self.width + b * 2,
    height=self.height + b * 2,
    fill~,
  )
  for y in 0..<self.height {
    for x in 0..<self.width {
      out.set(x + b, y + b, self.get(x, y))
    }
  }
  out
}

///|
pub fn GrayImage::crop(self : GrayImage, rect : Rect) -> GrayImage {
  let w = max_i(0, min_i(self.width - max_i(0, rect.x), rect.width))
  let h = max_i(0, min_i(self.height - max_i(0, rect.y), rect.height))
  let out = GrayImage::new(width=w, height=h)
  for y in 0..<h {
    for x in 0..<w {
      out.set(x, y, self.get(rect.x + x, rect.y + y))
    }
  }
  out
}

///|
pub fn GrayImage::flip_horizontal(self : GrayImage) -> GrayImage {
  let out = GrayImage::new(width=self.width, height=self.height)
  for y in 0..<self.height {
    for x in 0..<self.width {
      out.set(self.width - x - 1, y, self.get(x, y))
    }
  }
  out
}

///|
pub fn GrayImage::flip_vertical(self : GrayImage) -> GrayImage {
  let out = GrayImage::new(width=self.width, height=self.height)
  for y in 0..<self.height {
    for x in 0..<self.width {
      out.set(x, self.height - y - 1, self.get(x, y))
    }
  }
  out
}

///|
pub fn GrayImage::rotate180(self : GrayImage) -> GrayImage {
  self.flip_horizontal().flip_vertical()
}

///|
pub fn GrayImage::resize_nearest(self : GrayImage, size : Size) -> GrayImage {
  let out = GrayImage::new(
    width=max_i(0, size.width),
    height=max_i(0, size.height),
  )
  if self.width == 0 || self.height == 0 {
    out
  } else {
    for y in 0..<out.height {
      for x in 0..<out.width {
        let sx = x * self.width / max_i(1, out.width)
        let sy = y * self.height / max_i(1, out.height)
        out.set(
          x,
          y,
          self.get(min_i(self.width - 1, sx), min_i(self.height - 1, sy)),
        )
      }
    }
    out
  }
}
