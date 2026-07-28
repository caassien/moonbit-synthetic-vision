///|
pub enum AssetKind {
  Checkerboard
  Calibration
  DotGrid
  Detection
  Segmentation
  Noise
  MotionBlur
  Occlusion
} derive(Debug, Eq)

///|
pub struct ScenePlan {
  name : String
  kind : AssetKind
  size : Size
  seed : UInt
} derive(Debug, Eq)

///|
pub fn ScenePlan::new(name~ : String, kind~ : AssetKind, size~ : Size, seed? : UInt = 1) -> ScenePlan {
  { name, kind, size, seed }
}

///|
pub struct SceneOutput {
  plan : ScenePlan
  image : GrayImage
  mask : Mask
  boxes : Array[Box2D]
  flow : Array[FlowVector]
} derive(Debug, Eq)

///|
pub fn SceneOutput::new(
  plan~ : ScenePlan,
  image~ : GrayImage,
  mask? : Mask = Mask::new(width=0, height=0),
  boxes? : Array[Box2D] = [],
  flow? : Array[FlowVector] = [],
) -> SceneOutput {
  { plan, image, mask, boxes, flow }
}

///|
pub fn default_suite(size? : Size = Size::new(width=96, height=72)) -> Array[ScenePlan] {
  [
    ScenePlan::new(name="checkerboard_8", kind=Checkerboard, size~, seed=1),
    ScenePlan::new(name="calibration_7x5", kind=Calibration, size~, seed=2),
    ScenePlan::new(name="dot_grid", kind=DotGrid, size~, seed=3),
    ScenePlan::new(name="detection_shapes", kind=Detection, size~, seed=4),
    ScenePlan::new(name="segmentation_blocks", kind=Segmentation, size~, seed=5),
    ScenePlan::new(name="uniform_noise", kind=Noise, size~, seed=6),
    ScenePlan::new(name="motion_blur_x", kind=MotionBlur, size~, seed=7),
    ScenePlan::new(name="occluded_target", kind=Occlusion, size~, seed=8),
  ]
}

///|
pub fn render_plan(plan : ScenePlan) -> SceneOutput {
  match plan.kind {
    Checkerboard => SceneOutput::new(
      plan~,
      image=checkerboard(plan.size, 8, dark=Gray::new(20), light=Gray::new(235)),
    )
    Calibration => SceneOutput::new(
      plan~,
      image=calibration_board(cols=7, rows=5, cell=max_i(4, min_i(plan.size.width / 9, plan.size.height / 7))),
    )
    DotGrid => SceneOutput::new(
      plan~,
      image=dot_grid(plan.size, max_i(6, plan.size.width / 12), max_i(2, plan.size.width / 96)),
    )
    Detection => render_detection_scene(plan)
    Segmentation => render_segmentation_scene(plan)
    Noise => SceneOutput::new(
      plan~,
      image=add_uniform_noise(target_scene(plan.size, seed=plan.seed), seed=plan.seed + 31, magnitude=28),
    )
    MotionBlur => SceneOutput::new(
      plan~,
      image=motion_blur_x(target_scene(plan.size, seed=plan.seed), 4),
      flow=constant_flow(plan.size, 12, dx=4, dy=0),
    )
    Occlusion => {
      let base = target_scene(plan.size, seed=plan.seed)
      let occ = Rect::new(
        x=plan.size.width / 3,
        y=plan.size.height / 3,
        width=plan.size.width / 3,
        height=plan.size.height / 4,
      )
      SceneOutput::new(
        plan~,
        image=occlude(base, occ, gray=Gray::new(16)),
        boxes=[Box2D::new(label=Label::new(id=1, name="occluder"), rect=occ, occluded=false)],
      )
    }
  }
}

///|
pub fn render_detection_scene(plan : ScenePlan) -> SceneOutput {
  let img = gradient(plan.size, horizontal=false)
  let label = Label::new(id=1, name="target")
  let boxes : Array[Box2D] = []
  let rect1 = Rect::new(
    x=plan.size.width / 8,
    y=plan.size.height / 5,
    width=plan.size.width / 4,
    height=plan.size.height / 3,
  )
  let rect2 = Rect::new(
    x=plan.size.width / 2,
    y=plan.size.height / 3,
    width=plan.size.width / 3,
    height=plan.size.height / 4,
  )
  img.fill_rect(rect1, Gray::new(64))
  img.draw_rect(rect1, Gray::white())
  img.fill_circle(
    Point::new(x=rect2.x + rect2.width / 2, y=rect2.y + rect2.height / 2),
    min_i(rect2.width, rect2.height) / 2,
    Gray::new(180),
  )
  boxes.push(Box2D::new(label~, rect=rect1))
  boxes.push(Box2D::new(label~, rect=rect2))
  SceneOutput::new(plan~, image=img, boxes~)
}

///|
pub fn render_segmentation_scene(plan : ScenePlan) -> SceneOutput {
  let img = GrayImage::from_size(plan.size, fill=Gray::new(210))
  let mask = Mask::new(width=plan.size.width, height=plan.size.height)
  let left = Rect::new(
    x=plan.size.width / 8,
    y=plan.size.height / 6,
    width=plan.size.width / 3,
    height=plan.size.height / 2,
  )
  let right = Rect::new(
    x=plan.size.width / 2,
    y=plan.size.height / 4,
    width=plan.size.width / 3,
    height=plan.size.height / 2,
  )
  img.fill_rect(left, Gray::new(80))
  img.fill_rect(right, Gray::new(150))
  mask.fill_rect(left, 1)
  mask.fill_rect(right, 2)
  SceneOutput::new(
    plan~,
    image=img,
    mask~,
    boxes=[
      Box2D::new(label=Label::new(id=1, name="dark_block"), rect=left),
      Box2D::new(label=Label::new(id=2, name="mid_block"), rect=right),
    ],
  )
}

///|
pub fn suite_manifest(plans : Array[ScenePlan], prefix? : String = "out") -> DatasetManifest {
  let manifest = DatasetManifest::new(name="moonbit-synthetic-vision")
  for plan in plans {
    manifest.add(
      Asset::new(
        name=plan.name,
        image_path="\{prefix}/\{plan.name}.pgm",
        annotation_path="\{prefix}/\{plan.name}.json",
        seed=plan.seed,
        tags=[asset_kind_name(plan.kind), "synthetic", "vision"],
      ),
    )
  }
  manifest
}

///|
pub fn asset_kind_name(kind : AssetKind) -> String {
  match kind {
    Checkerboard => "checkerboard"
    Calibration => "calibration"
    DotGrid => "dot-grid"
    Detection => "detection"
    Segmentation => "segmentation"
    Noise => "noise"
    MotionBlur => "motion-blur"
    Occlusion => "occlusion"
  }
}
