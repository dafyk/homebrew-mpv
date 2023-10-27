class Openjpeg < Formula
  desc "Library for JPEG-2000 image manipulation"
  homepage "https://www.openjpeg.org/"
  url "https://github.com/uclouvain/openjpeg/archive/v2.5.0.tar.gz"
  sha256 "0333806d6adecc6f7a91243b2b839ff4d2053823634d4f6ed7a59bc87409122a"
  license "BSD-2-Clause"
  head "https://github.com/uclouvain/openjpeg.git", branch: "master"

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "c63263a722e40fdae5d0e485442ce551461af91ed9fa004a0673f842c24be893"
  end

  depends_on "dafyk/mpv/cmake" => :build
  depends_on "dafyk/mpv/libpng"
  depends_on "dafyk/mpv/libtiff"
  depends_on "dafyk/mpv/little-cms2"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
                    "-DCMAKE_INSTALL_RPATH=#{rpath}",
                    "-DBUILD_DOC=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
  test do
  end
end
