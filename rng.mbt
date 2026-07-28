///|
pub struct Rng {
  mut state : UInt
} derive(Debug)

///|
pub fn Rng::new(seed : UInt) -> Rng {
  if seed == 0 {
    { state: 0x9e3779b9 }
  } else {
    { state: seed }
  }
}

///|
pub fn Rng::next_u32(self : Rng) -> UInt {
  self.state = self.state * 1664525 + 1013904223
  self.state
}

///|
pub fn Rng::next_int(self : Rng, upper : Int) -> Int {
  if upper <= 1 {
    0
  } else {
    (self.next_u32().reinterpret_as_int() & 0x7fffffff) % upper
  }
}

///|
pub fn Rng::range(self : Rng, low~ : Int, high~ : Int) -> Int {
  if high <= low {
    low
  } else {
    low + self.next_int(high - low)
  }
}

///|
pub fn Rng::signed(self : Rng, magnitude : Int) -> Int {
  self.range(low=-magnitude, high=magnitude + 1)
}

///|
pub fn Rng::chance(self : Rng, numerator~ : Int, denominator~ : Int) -> Bool {
  denominator > 0 && self.next_int(denominator) < numerator
}
