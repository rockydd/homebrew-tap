class AsciiMoon < Formula
  desc "A TUI to show the moon phase"
  homepage "https://github.com/rockydd/ascii_moon"
  url "https://github.com/rockydd/ascii_moon/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "ac716af882ca0ace2ad251170682ffe5262b0c7de2d2376a13be58e4e70a3094"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/ascii_moon", "--help"
  end
end