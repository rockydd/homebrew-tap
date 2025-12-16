class AsciiMoon < Formula
  desc "A TUI to show the moon phase"
  homepage "https://github.com/rockydd/ascii_moon"
  url "https://github.com/rockydd/ascii_moon/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "17c35528abedae5ce90b3777631692665d689f394aaea698c6d4aee004d399b0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/ascii_moon", "--help"
  end
end