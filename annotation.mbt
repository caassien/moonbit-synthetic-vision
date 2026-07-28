///|
pub struct Label {
  id : Int
  name : String
} derive(Debug, Eq)

///|
pub fn Label::new(id~ : Int, name~ : String) -> Label {
  { id, name }
}

///|
pub struct Box2D {
  label : Label
  rect : Rect
  occluded : Bool
} derive(Debug, Eq)

///|
pub fn Box2D::new(
  label~ : Label,
  rect~ : Rect,
  occluded? : Bool = false,
) -> Box2D {
  { label, rect, occluded }
}

///|
pub fn Box2D::area(self : Box2D) -> Int {
  max_i(0, self.rect.width) * max_i(0, self.rect.height)
}

///|
pub fn Box2D::to_yolo(self : Box2D, size : Size) -> String {
  let denom_w = max_i(1, size.width)
  let denom_h = max_i(1, size.height)
  let cx1000 = (self.rect.x * 2 + self.rect.width) * 500 / denom_w
  let cy1000 = (self.rect.y * 2 + self.rect.height) * 500 / denom_h
  let w1000 = self.rect.width * 1000 / denom_w
  let h1000 = self.rect.height * 1000 / denom_h
  "\{self.label.id} 0.\{pad3(cx1000)} 0.\{pad3(cy1000)} 0.\{pad3(w1000)} 0.\{pad3(h1000)}"
}

///|
pub struct Keypoint {
  label : String
  point : Point
  visible : Bool
} derive(Debug, Eq)

///|
pub fn Keypoint::new(
  label~ : String,
  point~ : Point,
  visible? : Bool = true,
) -> Keypoint {
  { label, point, visible }
}

///|
pub struct InstanceAnnotation {
  id : Int
  label : Label
  bbox : Box2D
  keypoints : Array[Keypoint]
} derive(Debug, Eq)

///|
pub fn InstanceAnnotation::new(
  id~ : Int,
  label~ : Label,
  bbox~ : Box2D,
  keypoints? : Array[Keypoint] = [],
) -> InstanceAnnotation {
  { id, label, bbox, keypoints }
}

///|
pub struct Mask {
  width : Int
  height : Int
  values : Array[Int]
} derive(Debug, Eq)

///|
pub fn Mask::new(width~ : Int, height~ : Int) -> Mask {
  { width, height, values: Array::make(max_i(0, width * height), 0) }
}

///|
pub fn Mask::index(self : Mask, x : Int, y : Int) -> Int {
  y * self.width + x
}

///|
pub fn Mask::in_bounds(self : Mask, x : Int, y : Int) -> Bool {
  x >= 0 && y >= 0 && x < self.width && y < self.height
}

///|
pub fn Mask::set(self : Mask, x : Int, y : Int, id : Int) -> Unit {
  if self.in_bounds(x, y) {
    self.values[self.index(x, y)] = id
  }
}

///|
pub fn Mask::fill_rect(self : Mask, rect : Rect, id : Int) -> Unit {
  for y in rect.y..<rect.bottom() {
    for x in rect.x..<rect.right() {
      self.set(x, y, id)
    }
  }
}

///|
pub fn Mask::to_pgm(self : Mask) -> String {
  let sb = StringBuilder()
  sb.write_string("P2\n\{self.width} \{self.height}\n255\n")
  for y in 0..<self.height {
    for x in 0..<self.width {
      if x > 0 {
        sb.write_string(" ")
      }
      sb.write_string("\{clamp_u8(self.values[self.index(x, y)])}")
    }
    sb.write_string("\n")
  }
  sb.to_string()
}

///|
pub struct FlowVector {
  x : Int
  y : Int
  dx : Int
  dy : Int
} derive(Debug, Eq)

///|
pub fn FlowVector::new(x~ : Int, y~ : Int, dx~ : Int, dy~ : Int) -> FlowVector {
  { x, y, dx, dy }
}

///|
pub fn constant_flow(
  size : Size,
  step : Int,
  dx~ : Int,
  dy~ : Int,
) -> Array[FlowVector] {
  let vectors : Array[FlowVector] = []
  let stride = max_i(1, step)
  for y in 0..<size.height {
    if y % stride == 0 {
      for x in 0..<size.width {
        if x % stride == 0 {
          vectors.push(FlowVector::new(x~, y~, dx~, dy~))
        }
      }
    }
  }
  vectors
}

///|
pub fn pad3(value : Int) -> String {
  let v = clamp(value, low=0, high=999)
  if v < 10 {
    "00\{v}"
  } else if v < 100 {
    "0\{v}"
  } else {
    "\{v}"
  }
}
