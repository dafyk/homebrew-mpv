class Libvidstab < Formula
  desc "Transcode video stabilization plugin"
  homepage "http://public.hronopik.de/vid.stab/"
  url "https://github.com/georgmartius/vid.stab/archive/v1.1.1.tar.gz"
  sha256 "9001b6df73933555e56deac19a0f225aae152abbc0e97dc70034814a1943f3d4"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "82d3f8d5fc1617abeace116b61ee5475b44d4d3ff35c62e8eec2a587cbd7c3d9"
  end

  depends_on "dafyk/mpv/cmake" => :build

  def install
    system "cmake", ".", "-DUSE_OMP=OFF", "-DBUILD_SHARED_LIBS=OFF", *std_cmake_args
    system "make", "install"
  end
  test do
  end
end
