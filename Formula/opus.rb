class Opus < Formula
  desc "Audio codec"
  homepage "https://www.opus-codec.org/"
  url "https://downloads.xiph.org/releases/opus/opus-1.4.tar.gz"
  mirror "https://ftp.osuosl.org/pub/xiph/releases/opus/opus-1.4.tar.gz"
  sha256 "c9b32b4253be5ae63d1ff16eea06b94b5f0f2951b7a02aceef58e3a3ce49c51f"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "952a35d53c5e3e790760818737bcff13ff41007de78e6ae87e3c16097589b25c"
  end

  livecheck do
    url "https://downloads.xiph.org/releases/opus/"
    regex(%r{href=(?:["']?|.*?/)opus[._-]v?(\d+(?:\.\d+)+)\.t}i)
  end

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-doc", "--prefix=#{prefix}"
    system "make", "install"
  end
  test do
  end
end
