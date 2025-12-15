class AsciiMoon < Formula
  desc "A TUI to show the moon phase"
  homepage "https://github.com/rockydd/ascii_moon"
  url "https://github.com/rockydd/ascii_moon/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9949f64fdba4684919e0c04f29be914b219990eaffce3262b384536ef4ea7f87"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/ascii_moon", "--help"
  end
end