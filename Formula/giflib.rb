class Giflib < Formula
  desc "Library and utilities for processing GIFs"
  homepage "https://giflib.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/giflib/giflib-5.2.1.tar.gz"
  sha256 "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "fe585f2296e70e492cb45b68222cf8da357bf563cd2b410028d5a629667285ae"
  end

  livecheck do
    url :stable
    regex(%r{url=.*?/giflib[._-]v?(\d+(?:\.\d+)+)\.t}i)
  end

  # Upstream has stripped out the previous autotools-based build system and their
  # Makefile doesn't work on macOS. See https://sourceforge.net/p/giflib/bugs/133/
  patch :p0 do
    url "https://sourceforge.net/p/giflib/bugs/_discuss/thread/4e811ad29b/c323/attachment/Makefile.patch"
    sha256 "a94e7bdd8840a31cecacc301684dfdbf7b98773ad824aeaab611fabfdc513036"
  end

  def install
    system "make", "all"
    system "make", "install", "PREFIX=#{prefix}"
  end
  test do
  end
end
