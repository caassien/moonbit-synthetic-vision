///|
fn main {
  let size = @vision.Size::new(width=24, height=12)
  let board = @vision.calibration_board(cols=4, rows=3, cell=4, margin=2)
  println("# calibration")
  println(board.to_ascii_art())
  let noisy = @vision.add_salt_pepper(
    @vision.target_scene(size, seed=2026),
    seed=2027,
    amount_per_1000=80,
  )
  println("# noisy target")
  println(noisy.to_ascii_art())
}
