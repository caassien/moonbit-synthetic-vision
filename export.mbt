///|
pub fn GrayImage::to_pgm(self : GrayImage) -> String {
  let sb = StringBuilder()
  sb.write_string("P2\n")
  sb.write_string("\{self.width} \{self.height}\n")
  sb.write_string("255\n")
  for y in 0..<self.height {
    for x in 0..<self.width {
      if x > 0 {
        sb.write_string(" ")
      }
      sb.write_string("\{self.get(x, y).value}")
    }
    sb.write_string("\n")
  }
  sb.to_string()
}

///|
pub fn RgbImage::to_ppm(self : RgbImage) -> String {
  let sb = StringBuilder()
  sb.write_string("P3\n")
  sb.write_string("\{self.width} \{self.height}\n")
  sb.write_string("255\n")
  for y in 0..<self.height {
    for x in 0..<self.width {
      if x > 0 {
        sb.write_string(" ")
      }
      let p = self.get(x, y)
      sb.write_string("\{p.r} \{p.g} \{p.b}")
    }
    sb.write_string("\n")
  }
  sb.to_string()
}

///|
pub fn GrayImage::to_ascii_art(self : GrayImage) -> String {
  let ramp = " .:-=+*#%@"
  let sb = StringBuilder()
  for y in 0..<self.height {
    for x in 0..<self.width {
      let idx = self.get(x, y).value * (ramp.length() - 1) / 255
      sb.write_char(ramp.get_char(idx).unwrap())
    }
    sb.write_string("\n")
  }
  sb.to_string()
}
