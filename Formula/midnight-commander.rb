class MidnightCommander < Formula
  desc "Terminal-based visual file manager"
  homepage "https://www.midnight-commander.org/"
  url "https://www.midnight-commander.org/downloads/mc-4.8.30.tar.xz"
  mirror "https://ftp.osuosl.org/pub/midnightcommander/mc-4.8.30.tar.xz"
  sha256 "5ebc3cb2144b970c5149fda556c4ad50b78780494696cdf2d14a53204c95c7df"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "97b68931dbabecb9d576c17d43f9bdc3a508993a92fac2d7ff32d2ace347b1c5"
  end

  livecheck do
    url "https://ftp.osuosl.org/pub/midnightcommander/"
    regex(/href=.*?mc[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  head do
    url "https://github.com/MidnightCommander/mc.git", branch: "master"

    depends_on "dafyk/mpv/autoconf" => :build
    depends_on "dafyk/mpv/automake" => :build
    depends_on "dafyk/mpv/libtool" => :build
  end

  depends_on "dafyk/mpv/pkg-config" => :build
  depends_on "dafyk/mpv/glib"
  depends_on "dafyk/mpv/libssh2"
  depends_on "dafyk/mpv/openssl@3"
  depends_on "dafyk/mpv/s-lang"

  conflicts_with "minio-mc", because: "both install an `mc` binary"

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --without-x
      --with-screen=slang
      --enable-vfs-sftp
    ]

    # Fix compilation bug on macOS 10.13 by pretending we don't have utimensat()
    # https://github.com/MidnightCommander/mc/pull/130
    ENV["ac_cv_func_utimensat"] = "no" if MacOS.version >= :high_sierra
    system "./autogen.sh" if build.head?
    system "./configure", *args
    system "make", "install"

    inreplace share/"mc/syntax/Syntax", Superenv.shims_path, "/usr/bin" if OS.mac?
  end

  test do
  end
end
