class SLang < Formula
  desc "Library for creating multi-platform software"
  homepage "https://www.jedsoft.org/slang/"
  url "https://www.jedsoft.org/releases/slang/slang-2.3.3.tar.bz2"
  mirror "https://src.fedoraproject.org/repo/pkgs/slang/slang-2.3.3.tar.bz2/sha512/35cdfe8af66dac62ee89cca60fa87ddbd02cae63b30d5c0e3786e77b1893c45697ace4ac7e82d9832b8a9ac342560bc35997674846c5022341481013e76f74b5/slang-2.3.3.tar.bz2"
  sha256 "f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c4a0617743c8f5a18"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "018ad2a684926e6080577ff3101f788219e2f7f7a13cefda2647d91b867cdfa1"
  end

  livecheck do
    url "https://www.jedsoft.org/releases/slang/"
    regex(/href=.*?slang[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "dafyk/mpv/libpng"

  def install
    png = Formula["dafyk/mpv/libpng"]
    system "./configure", "--prefix=#{prefix}",
                          "--with-pnglib=#{png.lib}",
                          "--with-pnginc=#{png.include}"
    ENV.deparallelize
    system "make"
    system "make", "install"
  end

  test do
  end
end
