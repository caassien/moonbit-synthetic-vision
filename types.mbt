///|
pub struct Size {
  width : Int
  height : Int
} derive(Debug, Eq)

///|
pub fn Size::new(width~ : Int, height~ : Int) -> Size {
  { width, height }
}

///|
pub fn Size::area(self : Size) -> Int {
  self.width * self.height
}

///|
pub fn Size::is_valid(self : Size) -> Bool {
  self.width > 0 && self.height > 0
}

///|
pub struct Point {
  x : Int
  y : Int
} derive(Debug, Eq)

///|
pub fn Point::new(x~ : Int, y~ : Int) -> Point {
  { x, y }
}

///|
pub struct Rect {
  x : Int
  y : Int
  width : Int
  height : Int
} derive(Debug, Eq)

///|
pub fn Rect::new(x~ : Int, y~ : Int, width~ : Int, height~ : Int) -> Rect {
  { x, y, width, height }
}

///|
pub fn Rect::right(self : Rect) -> Int {
  self.x + self.width
}

///|
pub fn Rect::bottom(self : Rect) -> Int {
  self.y + self.height
}

///|
pub fn Rect::contains(self : Rect, p : Point) -> Bool {
  p.x >= self.x && p.y >= self.y && p.x < self.right() && p.y < self.bottom()
}

///|
pub struct Gray {
  value : Int
} derive(Debug, Eq)

///|
pub fn Gray::new(value : Int) -> Gray {
  { value: clamp_u8(value) }
}

///|
pub fn Gray::black() -> Gray {
  Gray::new(0)
}

///|
pub fn Gray::white() -> Gray {
  Gray::new(255)
}

///|
pub fn Gray::blend(a : Gray, b : Gray, alpha_255 : Int) -> Gray {
  let alpha = clamp_u8(alpha_255)
  Gray::new((a.value * (255 - alpha) + b.value * alpha) / 255)
}

///|
pub struct Rgb {
  r : Int
  g : Int
  b : Int
} derive(Debug, Eq)

///|
pub fn Rgb::new(r~ : Int, g~ : Int, b~ : Int) -> Rgb {
  { r: clamp_u8(r), g: clamp_u8(g), b: clamp_u8(b) }
}

///|
pub fn Rgb::from_gray(gray : Gray) -> Rgb {
  Rgb::new(r=gray.value, g=gray.value, b=gray.value)
}

///|
pub fn clamp_u8(value : Int) -> Int {
  if value < 0 {
    0
  } else if value > 255 {
    255
  } else {
    value
  }
}

///|
pub fn clamp(value : Int, low~ : Int, high~ : Int) -> Int {
  if value < low {
    low
  } else if value > high {
    high
  } else {
    value
  }
}

///|
pub fn abs_i(value : Int) -> Int {
  if value < 0 {
    -value
  } else {
    value
  }
}

///|
pub fn min_i(a : Int, b : Int) -> Int {
  if a < b {
    a
  } else {
    b
  }
}

///|
pub fn max_i(a : Int, b : Int) -> Int {
  if a > b {
    a
  } else {
    b
  }
}
