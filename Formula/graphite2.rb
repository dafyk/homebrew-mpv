class Graphite2 < Formula
  desc "Smart font renderer for non-Roman scripts"
  homepage "https://graphite.sil.org/"
  url "https://github.com/silnrsi/graphite/releases/download/1.3.14/graphite2-1.3.14.tgz"
  sha256 "f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d"
  license any_of: ["GPL-2.0-or-later", "LGPL-2.1-or-later", "MPL-1.1+"]
  head "https://github.com/silnrsi/graphite.git", branch: "master"

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "a040316923e732def8dc6cf10997b232f87d34974c20b0d36b1dd673a84ec44d"
  end

  depends_on "dafyk/mpv/cmake" => :build

  patch do
    url "https://www.savero.net/CMakeLists.txt.patch"
    sha256 "cd8980cba3aeca5145a12e973622d95f362d0ab1c4b896c8786c825c2c9fd6c3"
  end

  def install
    system "cmake", ".", "-DBUILD_SHARED_LIBS=OFF", *std_cmake_args
    system "make", "install"
  end
  test do
  end
end
