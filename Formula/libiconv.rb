class Libiconv < Formula
  desc "Conversion library"
  homepage "https://www.gnu.org/software/libiconv/"
  url "https://ftp.gnu.org/gnu/libiconv/libiconv-1.17.tar.gz"
  mirror "https://ftpmirror.gnu.org/libiconv/libiconv-1.17.tar.gz"
  sha256 "8f74213b56238c85a50a5329f77e06198771e70dd9a739779f4c02f65d971313"
  license all_of: ["GPL-3.0-or-later", "LGPL-2.0-or-later"]

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "d1afd538f564ea5017377343b859cc50e6e67d778edb2975fbe04eaa140d0ee9"
  end

  keg_only :provided_by_macos

  depends_on :macos # is not needed on Linux, where iconv.h is provided by glibc

  patch do
    url "https://raw.githubusercontent.com/Homebrew/patches/9be2793af/libiconv/patch-utf8mac.diff"
    sha256 "e8128732f22f63b5c656659786d2cf76f1450008f36bcf541285268c66cabeab"
  end

  patch :DATA

  def install
    ENV.deparallelize

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-extra-encodings",
                          "--enable-static",
                          "--docdir=#{doc}"
    system "make", "-f", "Makefile.devel", "CFLAGS=#{ENV.cflags}", "CC=#{ENV.cc}"
    system "make", "install"
  end
  test do
  end
end


__END__
diff --git a/lib/flags.h b/lib/flags.h
index d7cda21..4cabcac 100644
--- a/lib/flags.h
+++ b/lib/flags.h
@@ -14,6 +14,7 @@

 #define ei_ascii_oflags (0)
 #define ei_utf8_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
+#define ei_utf8mac_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
 #define ei_ucs2_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
 #define ei_ucs2be_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
 #define ei_ucs2le_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
