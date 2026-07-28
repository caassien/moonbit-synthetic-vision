///|
fn main {
  let size = @vision.Size::new(width=40, height=20)
  let plans = @vision.default_suite(size~)
  let manifest = @vision.suite_manifest(plans, prefix="synthetic")
  println(manifest.to_json())
  println("# preview: detection_shapes")
  let scene = @vision.render_plan(plans[3])
  println(scene.image.to_ascii_art())
}
