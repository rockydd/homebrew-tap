class AsciiMoon < Formula
  desc "A TUI to show the moon phase"
  homepage "https://github.com/rockydd/ascii_moon"
  url "https://github.com/rockydd/ascii_moon/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "8f785525e86cf3a1200a6c5ca716fce96d76fe7d8984799e7a8de97910e42867"
  license "MIT"

  bottle do
    root_url "https://github.com/rockydd/homebrew-tap/releases/download/ascii_moon-bottle-v0.4.0"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fd752837e26c7fa2177a759dc38690bd313e901c8966d7de893bc4cc99760efb"
    sha256 cellar: :any_skip_relocation, sequoia:       "92ad27bfc0da9978573f4a22ca011835c832c569d75a543d40cb69df92e226aa"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b79258ed7764889380d989390665eed72b636b77c0902f5ab9a014936b78b622"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # Keep this safe for older source tarballs (e.g. v0.3.2) that don't include `poems/`.
    pkgshare.install "poems" if File.directory?("poems")
  end

  test do
    system "#{bin}/ascii_moon", "--help"
    # Poems are available starting from versions that ship `poems/` in the source tarball.
    if (pkgshare/"poems").exist?
      assert_predicate pkgshare/"poems/en/the_moon_stevenson.txt", :exist?
    end
  end
end