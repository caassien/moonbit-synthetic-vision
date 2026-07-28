///|
pub fn GrayImage::draw_line(self : GrayImage, a : Point, b : Point, gray : Gray) -> Unit {
  let dx = abs_i(b.x - a.x)
  let dy = -abs_i(b.y - a.y)
  let sx = if a.x < b.x { 1 } else { -1 }
  let sy = if a.y < b.y { 1 } else { -1 }
  for x = a.x, y = a.y, err = dx + dy; ; {
    self.set(x, y, gray)
    if x == b.x && y == b.y {
      break
    }
    let e2 = 2 * err
    if e2 >= dy && e2 <= dx {
      continue x + sx, y + sy, err + dy + dx
    } else if e2 >= dy {
      continue x + sx, y, err + dy
    } else {
      continue x, y + sy, err + dx
    }
  }
}

///|
pub fn GrayImage::draw_rect(self : GrayImage, rect : Rect, gray : Gray) -> Unit {
  self.draw_line(Point::new(x=rect.x, y=rect.y), Point::new(x=rect.right() - 1, y=rect.y), gray)
  self.draw_line(Point::new(x=rect.x, y=rect.bottom() - 1), Point::new(x=rect.right() - 1, y=rect.bottom() - 1), gray)
  self.draw_line(Point::new(x=rect.x, y=rect.y), Point::new(x=rect.x, y=rect.bottom() - 1), gray)
  self.draw_line(Point::new(x=rect.right() - 1, y=rect.y), Point::new(x=rect.right() - 1, y=rect.bottom() - 1), gray)
}

///|
pub fn GrayImage::fill_circle(self : GrayImage, center : Point, radius : Int, gray : Gray) -> Unit {
  let r2 = radius * radius
  for y in (center.y - radius)..=(center.y + radius) {
    for x in (center.x - radius)..=(center.x + radius) {
      let dx = x - center.x
      let dy = y - center.y
      if dx * dx + dy * dy <= r2 {
        self.set(x, y, gray)
      }
    }
  }
}

///|
pub fn GrayImage::draw_circle(self : GrayImage, center : Point, radius : Int, gray : Gray) -> Unit {
  for y in (center.y - radius)..=(center.y + radius) {
    for x in (center.x - radius)..=(center.x + radius) {
      let dx = x - center.x
      let dy = y - center.y
      let d2 = dx * dx + dy * dy
      if abs_i(d2 - radius * radius) <= max_i(1, radius) {
        self.set(x, y, gray)
      }
    }
  }
}
