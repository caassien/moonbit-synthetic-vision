///|
fn main {
  let size = @vision.Size::new(width=160, height=120)
  let plans = @vision.default_suite(size~)
  let mut checksum = 0
  let mut pixels = 0
  let mut boxes = 0
  for scene in @vision.render_suite(plans) {
    checksum += scene.image.sum()
    pixels += scene.image.width * scene.image.height
    boxes += scene.boxes.length()
  }
  let first = @vision.render_plan(plans[0])
  println("suite=\{plans.length()}")
  println("pixels=\{pixels}")
  println("boxes=\{boxes}")
  println("checksum=\{checksum}")
  println("mean=\{first.image.mean()}")
}
