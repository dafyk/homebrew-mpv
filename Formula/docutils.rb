class Docutils < Formula
  desc "Text processing system for reStructuredText"
  homepage "https://docutils.sourceforge.io"
  url "https://downloads.sourceforge.net/project/docutils/docutils/0.20.1/docutils-0.20.1.tar.gz"
  sha256 "f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a923e3b"
  license all_of: [:public_domain, "BSD-2-Clause", "GPL-3.0-or-later", "Python-2.0"]

  bottle do
    root_url "https://github.com/dafyk/homebrew-mpv/raw/main/Bottle"
    sha256 high_sierra: "f6f41670dc245d416f80166427cd25dd799cbae4d8cc8fac04f8ec185665fa9e"
  end

  depends_on "dafyk/mpv/python-setuptools" => :build
  depends_on "dafyk/mpv/python@3.11" => :build

  def pythons
    deps.map(&:to_formula)
        .select { |f| f.name.start_with?("python@") }
        .map { |f| f.opt_libexec/"bin/python" }
  end

  def install
    pythons.each do |python|
      system python, "-m", "pip", "install", *std_pip_args, "."
    end

    bin.glob("*.py") do |f|
      bin.install_symlink f => f.basename(".py")
    end
  end
  test do
  end
end
