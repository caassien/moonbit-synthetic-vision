///|
pub fn Rect::is_empty(self : Rect) -> Bool {
  self.width <= 0 || self.height <= 0
}

///|
pub fn Rect::area(self : Rect) -> Int {
  max_i(0, self.width) * max_i(0, self.height)
}

///|
pub fn Rect::center(self : Rect) -> Point {
  Point::new(x=self.x + self.width / 2, y=self.y + self.height / 2)
}

///|
pub fn Rect::translate(self : Rect, dx : Int, dy : Int) -> Rect {
  Rect::new(x=self.x + dx, y=self.y + dy, width=self.width, height=self.height)
}

///|
pub fn Rect::inflate(self : Rect, amount : Int) -> Rect {
  Rect::new(
    x=self.x - amount,
    y=self.y - amount,
    width=self.width + amount * 2,
    height=self.height + amount * 2,
  )
}

///|
pub fn Rect::intersection(self : Rect, other : Rect) -> Rect {
  let left = max_i(self.x, other.x)
  let top = max_i(self.y, other.y)
  let right = min_i(self.right(), other.right())
  let bottom = min_i(self.bottom(), other.bottom())
  Rect::new(
    x=left,
    y=top,
    width=max_i(0, right - left),
    height=max_i(0, bottom - top),
  )
}

///|
pub fn Rect::union(self : Rect, other : Rect) -> Rect {
  let left = min_i(self.x, other.x)
  let top = min_i(self.y, other.y)
  let right = max_i(self.right(), other.right())
  let bottom = max_i(self.bottom(), other.bottom())
  Rect::new(x=left, y=top, width=right - left, height=bottom - top)
}

///|
pub fn Rect::iou(self : Rect, other : Rect) -> Int {
  let overlap = self.intersection(other).area()
  let total = self.area() + other.area() - overlap
  if total == 0 {
    0
  } else {
    overlap * 1000 / total
  }
}

///|
pub fn Point::distance_l1(self : Point, other : Point) -> Int {
  abs_i(self.x - other.x) + abs_i(self.y - other.y)
}

///|
pub fn Point::distance_linf(self : Point, other : Point) -> Int {
  max_i(abs_i(self.x - other.x), abs_i(self.y - other.y))
}

///|
pub fn Point::translate(self : Point, dx : Int, dy : Int) -> Point {
  Point::new(x=self.x + dx, y=self.y + dy)
}

///|
pub fn clamp_rect(rect : Rect, size : Size) -> Rect {
  let width = min_i(max_i(0, rect.width), max_i(0, size.width))
  let height = min_i(max_i(0, rect.height), max_i(0, size.height))
  let x = clamp(rect.x, low=0, high=max_i(0, size.width - width))
  let y = clamp(rect.y, low=0, high=max_i(0, size.height - height))
  Rect::new(x~, y~, width~, height~)
}

///|
pub fn rect_grid(size : Size, cell : Size) -> Array[Rect] {
  let out : Array[Rect] = []
  let cw = max_i(1, cell.width)
  let ch = max_i(1, cell.height)
  for y in 0..<size.height {
    if y % ch == 0 {
      for x in 0..<size.width {
        if x % cw == 0 {
          out.push(
            Rect::new(
              x~,
              y~,
              width=min_i(cw, size.width - x),
              height=min_i(ch, size.height - y),
            ),
          )
        }
      }
    }
  }
  out
}

///|
pub fn Rect::split_horizontal(self : Rect, parts : Int) -> Array[Rect] {
  let out : Array[Rect] = []
  let n = max_i(1, parts)
  for i in 0..<n {
    let x0 = self.x + self.width * i / n
    let x1 = self.x + self.width * (i + 1) / n
    out.push(Rect::new(x=x0, y=self.y, width=x1 - x0, height=self.height))
  }
  out
}

///|
pub fn Rect::split_vertical(self : Rect, parts : Int) -> Array[Rect] {
  let out : Array[Rect] = []
  let n = max_i(1, parts)
  for i in 0..<n {
    let y0 = self.y + self.height * i / n
    let y1 = self.y + self.height * (i + 1) / n
    out.push(Rect::new(x=self.x, y=y0, width=self.width, height=y1 - y0))
  }
  out
}

///|
pub fn Rect::to_mask(self : Rect, size : Size, id : Int) -> Mask {
  let mask = Mask::new(width=size.width, height=size.height)
  mask.fill_rect(self, id)
  mask
}

///|
pub fn mask_iou(a : Mask, b : Mask, positive : Int) -> Int {
  let count = min_i(a.values.length(), b.values.length())
  let mut intersection = 0
  let mut union = 0
  for i in 0..<count {
    let ap = a.values[i] == positive
    let bp = b.values[i] == positive
    if ap && bp {
      intersection += 1
    }
    if ap || bp {
      union += 1
    }
  }
  if union == 0 {
    1000
  } else {
    intersection * 1000 / union
  }
}

///|
pub fn Mask::count(self : Mask, id : Int) -> Int {
  let mut total = 0
  for value in self.values {
    if value == id {
      total += 1
    }
  }
  total
}

///|
pub fn Mask::bounding_box(self : Mask, id : Int) -> Rect {
  let mut left = self.width
  let mut top = self.height
  let mut right = 0
  let mut bottom = 0
  for y in 0..<self.height {
    for x in 0..<self.width {
      if self.values[self.index(x, y)] == id {
        left = min_i(left, x)
        top = min_i(top, y)
        right = max_i(right, x + 1)
        bottom = max_i(bottom, y + 1)
      }
    }
  }
  Rect::new(
    x=left,
    y=top,
    width=max_i(0, right - left),
    height=max_i(0, bottom - top),
  )
}

///|
pub fn Box2D::clip(self : Box2D, size : Size) -> Box2D {
  Box2D::new(
    label=self.label,
    rect=clamp_rect(self.rect, size),
    occluded=self.occluded,
  )
}

///|
pub fn Box2D::iou(self : Box2D, other : Box2D) -> Int {
  self.rect.iou(other.rect)
}

///|
pub fn Box2D::center(self : Box2D) -> Point {
  self.rect.center()
}

///|
pub fn Box2D::is_valid(self : Box2D) -> Bool {
  !self.rect.is_empty() && self.label.id >= 0
}

///|
pub fn keypoints_visible(points : Array[Keypoint]) -> Int {
  let mut total = 0
  for point in points {
    if point.visible {
      total += 1
    }
  }
  total
}

///|
pub fn flow_endpoint(flow : FlowVector) -> Point {
  Point::new(x=flow.x + flow.dx, y=flow.y + flow.dy)
}

///|
pub fn flow_magnitude_l1(flow : FlowVector) -> Int {
  abs_i(flow.dx) + abs_i(flow.dy)
}

///|
pub fn flow_mean(flow : Array[FlowVector]) -> Point {
  if flow.length() == 0 {
    Point::new(x=0, y=0)
  } else {
    let mut dx = 0
    let mut dy = 0
    for item in flow {
      dx += item.dx
      dy += item.dy
    }
    Point::new(x=dx / flow.length(), y=dy / flow.length())
  }
}
