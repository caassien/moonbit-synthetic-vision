///|
pub struct GrayImage {
  width : Int
  height : Int
  pixels : Array[Int]
} derive(Debug, Eq)

///|
pub fn GrayImage::new(
  width~ : Int,
  height~ : Int,
  fill? : Gray = Gray::black(),
) -> GrayImage {
  let count = max_i(0, width * height)
  let pixels = Array::make(count, fill.value)
  { width, height, pixels }
}

///|
pub fn GrayImage::from_size(
  size : Size,
  fill? : Gray = Gray::black(),
) -> GrayImage {
  GrayImage::new(width=size.width, height=size.height, fill~)
}

///|
pub fn GrayImage::size(self : GrayImage) -> Size {
  Size::new(width=self.width, height=self.height)
}

///|
pub fn GrayImage::bounds(self : GrayImage) -> Rect {
  Rect::new(x=0, y=0, width=self.width, height=self.height)
}

///|
pub fn GrayImage::index(self : GrayImage, x : Int, y : Int) -> Int {
  y * self.width + x
}

///|
pub fn GrayImage::in_bounds(self : GrayImage, x : Int, y : Int) -> Bool {
  x >= 0 && y >= 0 && x < self.width && y < self.height
}

///|
pub fn GrayImage::get(self : GrayImage, x : Int, y : Int) -> Gray {
  if self.in_bounds(x, y) {
    Gray::new(self.pixels[self.index(x, y)])
  } else {
    Gray::black()
  }
}

///|
pub fn GrayImage::set(self : GrayImage, x : Int, y : Int, gray : Gray) -> Unit {
  if self.in_bounds(x, y) {
    self.pixels[self.index(x, y)] = gray.value
  }
}

///|
pub fn GrayImage::fill_rect(self : GrayImage, rect : Rect, gray : Gray) -> Unit {
  let x0 = clamp(rect.x, low=0, high=self.width)
  let y0 = clamp(rect.y, low=0, high=self.height)
  let x1 = clamp(rect.right(), low=0, high=self.width)
  let y1 = clamp(rect.bottom(), low=0, high=self.height)
  for y in y0..<y1 {
    for x in x0..<x1 {
      self.set(x, y, gray)
    }
  }
}

///|
pub fn GrayImage::copy(self : GrayImage) -> GrayImage {
  let out = GrayImage::new(width=self.width, height=self.height)
  for i in 0..<self.pixels.length() {
    out.pixels[i] = self.pixels[i]
  }
  out
}

///|
pub fn GrayImage::map(self : GrayImage, f : (Int) -> Int) -> GrayImage {
  let out = GrayImage::new(width=self.width, height=self.height)
  for i in 0..<self.pixels.length() {
    out.pixels[i] = clamp_u8(f(self.pixels[i]))
  }
  out
}

///|
pub fn GrayImage::invert(self : GrayImage) -> GrayImage {
  self.map(fn(v) { 255 - v })
}

///|
pub fn GrayImage::threshold(self : GrayImage, cutoff : Int) -> GrayImage {
  self.map(fn(v) { if v >= cutoff { 255 } else { 0 } })
}

///|
pub fn GrayImage::histogram(self : GrayImage, bins : Int) -> Array[Int] {
  let n = max_i(1, bins)
  let hist = Array::make(n, 0)
  for value in self.pixels {
    let idx = min_i(n - 1, value * n / 256)
    hist[idx] = hist[idx] + 1
  }
  hist
}

///|
pub struct RgbImage {
  width : Int
  height : Int
  pixels : Array[Rgb]
} derive(Debug, Eq)

///|
pub fn RgbImage::new(
  width~ : Int,
  height~ : Int,
  fill? : Rgb = Rgb::new(r=0, g=0, b=0),
) -> RgbImage {
  let count = max_i(0, width * height)
  let pixels = Array::make(count, fill)
  { width, height, pixels }
}

///|
pub fn RgbImage::from_gray(src : GrayImage) -> RgbImage {
  let out = RgbImage::new(width=src.width, height=src.height)
  for i in 0..<src.pixels.length() {
    out.pixels[i] = Rgb::from_gray(Gray::new(src.pixels[i]))
  }
  out
}

///|
pub fn RgbImage::index(self : RgbImage, x : Int, y : Int) -> Int {
  y * self.width + x
}

///|
pub fn RgbImage::in_bounds(self : RgbImage, x : Int, y : Int) -> Bool {
  x >= 0 && y >= 0 && x < self.width && y < self.height
}

///|
pub fn RgbImage::set(self : RgbImage, x : Int, y : Int, rgb : Rgb) -> Unit {
  if self.in_bounds(x, y) {
    self.pixels[self.index(x, y)] = rgb
  }
}

///|
pub fn RgbImage::get(self : RgbImage, x : Int, y : Int) -> Rgb {
  if self.in_bounds(x, y) {
    self.pixels[self.index(x, y)]
  } else {
    Rgb::new(r=0, g=0, b=0)
  }
}
