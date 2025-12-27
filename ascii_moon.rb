class AsciiMoon < Formula
  desc "A TUI to show the moon phase"
  homepage "https://github.com/rockydd/ascii_moon"
  url "https://github.com/rockydd/ascii_moon/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "17c35528abedae5ce90b3777631692665d689f394aaea698c6d4aee004d399b0"
  license "MIT"

  bottle do
    root_url "https://github.com/rockydd/homebrew-tap/releases/download/ascii_moon-bottle-v0.3.2"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cd7892b7223b4824175222553faf777922a268f1ad86eb1c2b2b3293cbd62fed"
    sha256 cellar: :any_skip_relocation, sequoia:       "934ada013505275ea78ef4b95b40dae53f735accd074a5e192c0daacd0e2de0e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1e95ef5d5b7d2ce10530f38c1b4341bd69eb3ebcb5f137e857a905febd833a3a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/ascii_moon", "--help"
  end
end