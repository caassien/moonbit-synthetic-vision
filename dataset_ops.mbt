///|
pub struct DatasetSplit {
  train : Array[Asset]
  validation : Array[Asset]
  holdout : Array[Asset]
} derive(Debug, Eq)

///|
pub fn split_manifest(
  manifest : DatasetManifest,
  train_per_1000 : Int,
  validation_per_1000 : Int,
) -> DatasetSplit {
  let train : Array[Asset] = []
  let validation : Array[Asset] = []
  let holdout : Array[Asset] = []
  let train_limit = clamp(train_per_1000, low=0, high=1000)
  let validation_limit = clamp(
    train_limit + validation_per_1000,
    low=train_limit,
    high=1000,
  )
  for i, asset in manifest.assets {
    let bucket = (i * 997 + asset.seed.reinterpret_as_int()) % 1000
    if bucket < train_limit {
      train.push(asset)
    } else if bucket < validation_limit {
      validation.push(asset)
    } else {
      holdout.push(asset)
    }
  }
  { train, validation, holdout }
}

///|
pub fn DatasetSplit::total(self : DatasetSplit) -> Int {
  self.train.length() + self.validation.length() + self.holdout.length()
}

///|
pub fn DatasetSplit::to_manifest(
  self : DatasetSplit,
  name : String,
  version : String,
) -> DatasetManifest {
  let out = DatasetManifest::new(name~, version~)
  for asset in self.train {
    out.add(asset)
  }
  for asset in self.validation {
    out.add(asset)
  }
  for asset in self.holdout {
    out.add(asset)
  }
  out
}

///|
pub fn DatasetManifest::filter_tag(
  self : DatasetManifest,
  tag : String,
) -> DatasetManifest {
  let out = DatasetManifest::new(name=self.name, version=self.version)
  for asset in self.assets {
    let mut found = false
    for candidate in asset.tags {
      if candidate == tag {
        found = true
      }
    }
    if found {
      out.add(asset)
    }
  }
  out
}

///|
pub fn DatasetManifest::seeds(self : DatasetManifest) -> Array[UInt] {
  let out : Array[UInt] = []
  for asset in self.assets {
    out.push(asset.seed)
  }
  out
}

///|
pub fn DatasetManifest::has_unique_names(self : DatasetManifest) -> Bool {
  for i, a in self.assets {
    for j, b in self.assets {
      if i != j && a.name == b.name {
        return false
      }
    }
  }
  true
}

///|
pub fn DatasetManifest::total_tags(self : DatasetManifest) -> Int {
  let mut total = 0
  for asset in self.assets {
    total += asset.tags.length()
  }
  total
}

///|
pub fn DatasetManifest::assets_with_seed(
  self : DatasetManifest,
  seed : UInt,
) -> Array[Asset] {
  let out : Array[Asset] = []
  for asset in self.assets {
    if asset.seed == seed {
      out.push(asset)
    }
  }
  out
}

///|
pub struct AnnotationSummary {
  boxes : Int
  visible_keypoints : Int
  mask_pixels : Int
  flow_vectors : Int
} derive(Debug, Eq)

///|
pub fn summarize_scene(scene : SceneOutput) -> AnnotationSummary {
  let keypoints = 0
  let mut mask_pixels = 0
  for value in scene.mask.values {
    if value != 0 {
      mask_pixels += 1
    }
  }
  {
    boxes: scene.boxes.length(),
    visible_keypoints: keypoints,
    mask_pixels,
    flow_vectors: scene.flow.length(),
  }
}

///|
pub fn AnnotationSummary::total(self : AnnotationSummary) -> Int {
  self.boxes + self.visible_keypoints + self.mask_pixels + self.flow_vectors
}

///|
pub fn SceneOutput::annotation_summary(self : SceneOutput) -> AnnotationSummary {
  summarize_scene(self)
}

///|
pub fn labels_in_scene(scene : SceneOutput) -> Array[Label] {
  let out : Array[Label] = []
  for box in scene.boxes {
    let mut exists = false
    for label in out {
      if label.id == box.label.id {
        exists = true
      }
    }
    if !exists {
      out.push(box.label)
    }
  }
  out
}

///|
pub fn scene_to_yolo(scene : SceneOutput) -> String {
  let sb = StringBuilder()
  for box in scene.boxes {
    sb.write_string(box.to_yolo(scene.image.size()))
    sb.write_char('\n')
  }
  sb.to_string()
}

///|
pub fn scenes_manifest(
  scenes : Array[SceneOutput],
  prefix : String,
) -> DatasetManifest {
  let manifest = DatasetManifest::new(name="rendered-scenes")
  for scene in scenes {
    manifest.add(
      Asset::new(
        name=scene.plan.name,
        image_path="\{prefix}/\{scene.plan.name}.pgm",
        annotation_path="\{prefix}/\{scene.plan.name}.txt",
        seed=scene.plan.seed,
        tags=[asset_kind_name(scene.plan.kind)],
      ),
    )
  }
  manifest
}

///|
pub fn render_suite(plans : Array[ScenePlan]) -> Array[SceneOutput] {
  let out : Array[SceneOutput] = []
  for plan in plans {
    out.push(render_plan(plan))
  }
  out
}

///|
pub fn render_and_summarize(
  plans : Array[ScenePlan],
) -> Array[AnnotationSummary] {
  let out : Array[AnnotationSummary] = []
  for scene in render_suite(plans) {
    out.push(scene.annotation_summary())
  }
  out
}

///|
pub fn RgbImage::size(self : RgbImage) -> Size {
  Size::new(width=self.width, height=self.height)
}

///|
pub fn RgbImage::copy(self : RgbImage) -> RgbImage {
  let out = RgbImage::new(width=self.width, height=self.height)
  for i in 0..<self.pixels.length() {
    out.pixels[i] = self.pixels[i]
  }
  out
}

///|
pub fn RgbImage::map(self : RgbImage, f : (Rgb) -> Rgb) -> RgbImage {
  let out = RgbImage::new(width=self.width, height=self.height)
  for i in 0..<self.pixels.length() {
    out.pixels[i] = f(self.pixels[i])
  }
  out
}

///|
pub fn RgbImage::invert(self : RgbImage) -> RgbImage {
  self.map(fn(pixel) {
    Rgb::new(r=255 - pixel.r, g=255 - pixel.g, b=255 - pixel.b)
  })
}

///|
pub fn RgbImage::grayscale(self : RgbImage) -> GrayImage {
  let out = GrayImage::new(width=self.width, height=self.height)
  for y in 0..<self.height {
    for x in 0..<self.width {
      let pixel = self.get(x, y)
      out.set(
        x,
        y,
        Gray::new((pixel.r * 299 + pixel.g * 587 + pixel.b * 114) / 1000),
      )
    }
  }
  out
}

///|
pub fn RgbImage::replace_channel(
  self : RgbImage,
  channel : Int,
  value : Int,
) -> RgbImage {
  self.map(fn(pixel) {
    if channel == 0 {
      Rgb::new(r=value, g=pixel.g, b=pixel.b)
    } else if channel == 1 {
      Rgb::new(r=pixel.r, g=value, b=pixel.b)
    } else {
      Rgb::new(r=pixel.r, g=pixel.g, b=value)
    }
  })
}

///|
pub fn RgbImage::channel_histogram(
  self : RgbImage,
  channel : Int,
  bins : Int,
) -> Array[Int] {
  let n = max_i(1, bins)
  let out = Array::make(n, 0)
  for pixel in self.pixels {
    let value = if channel == 0 {
      pixel.r
    } else if channel == 1 {
      pixel.g
    } else {
      pixel.b
    }
    out[min_i(n - 1, value * n / 256)] += 1
  }
  out
}
