class AsciiMoon < Formula
  desc "A TUI to show the moon phase"
  homepage "https://github.com/rockydd/ascii_moon"
  url "https://github.com/rockydd/ascii_moon/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "17c35528abedae5ce90b3777631692665d689f394aaea698c6d4aee004d399b0"
  license "MIT"

  bottle do
    root_url "https://github.com/rockydd/homebrew-tap/releases/download/ascii_moon-bottle-v0.3.2"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0172849051de904ba28d92d7d5ac01e57622dcf37fd78ec384b9550508c2f42d"
    sha256 cellar: :any_skip_relocation, sequoia:       "890f029976f0e2992c77928d4e11279805c5e81be0890370e6871231317b64bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0181de3acddd0ba8d83b2089f7bbbd05fd9657faf9676c49894f049c7bdf6fb6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/ascii_moon", "--help"
  end
end