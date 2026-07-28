///|
pub struct Asset {
  name : String
  image_path : String
  annotation_path : String
  seed : UInt
  tags : Array[String]
} derive(Debug, Eq)

///|
pub fn Asset::new(
  name~ : String,
  image_path~ : String,
  annotation_path? : String = "",
  seed? : UInt = 0,
  tags? : Array[String] = [],
) -> Asset {
  { name, image_path, annotation_path, seed, tags }
}

///|
pub struct DatasetManifest {
  name : String
  version : String
  assets : Array[Asset]
} derive(Debug, Eq)

///|
pub fn DatasetManifest::new(name~ : String, version? : String = "0.1.0") -> DatasetManifest {
  { name, version, assets: [] }
}

///|
pub fn DatasetManifest::add(self : DatasetManifest, asset : Asset) -> Unit {
  self.assets.push(asset)
}

///|
pub fn DatasetManifest::to_json(self : DatasetManifest) -> String {
  let sb = StringBuilder()
  sb.write_string("{\n")
  sb.write_string("  \"name\": \"\{escape_json(self.name)}\",\n")
  sb.write_string("  \"version\": \"\{escape_json(self.version)}\",\n")
  sb.write_string("  \"assets\": [\n")
  for i, asset in self.assets {
    sb.write_string("    ")
    sb.write_string(asset.to_json())
    if i + 1 < self.assets.length() {
      sb.write_string(",")
    }
    sb.write_string("\n")
  }
  sb.write_string("  ]\n")
  sb.write_string("}\n")
  sb.to_string()
}

///|
pub fn Asset::to_json(self : Asset) -> String {
  let sb = StringBuilder()
  sb.write_string("{")
  sb.write_string("\"name\":\"\{escape_json(self.name)}\",")
  sb.write_string("\"image\":\"\{escape_json(self.image_path)}\",")
  sb.write_string("\"annotation\":\"\{escape_json(self.annotation_path)}\",")
  sb.write_string("\"seed\":\"\{self.seed}\",")
  sb.write_string("\"tags\":[")
  for i, tag in self.tags {
    if i > 0 {
      sb.write_string(",")
    }
    sb.write_string("\"\{escape_json(tag)}\"")
  }
  sb.write_string("]}")
  sb.to_string()
}

///|
pub fn escape_json(text : String) -> String {
  let sb = StringBuilder()
  for ch in text {
    match ch {
      '"' => sb.write_string("\\\"")
      '\\' => sb.write_string("\\\\")
      '\n' => sb.write_string("\\n")
      '\r' => sb.write_string("\\r")
      '\t' => sb.write_string("\\t")
      _ => sb.write_char(ch)
    }
  }
  sb.to_string()
}
