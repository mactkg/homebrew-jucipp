class Jucipp < Formula
  desc "a lightweight platform independent C++-IDE with support for C++11 and C++14."
  homepage "https://github.com/cppit/jucipp"
  url "https://github.com/cppit/jucipp/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "65f1649bdce2b8bc3b8876b6d5a835b714f71b58abef852e3c7686d7371ff1fa"

  depends_on "cmake" => :build
  depends_on "llvm" => :build
  depends_on "pkg-config" => :build
  depends_on "boost" => :build
  depends_on "homebrew/x11/gtksourceviewmm3" => :build
  depends_on "aspell" => :build
  depends_on "clang-format" => :build

  resource "libclangmm" do
    url "https://github.com/cppit/libclangmm/archive/v0.9.4.tar.gz"
    sha256 "3c535ec840b9ba84857fa778326fa8937b54194e3204ebb0f4823c2325f94ef6"
  end

  resource "tiny-process-library" do
    url "https://github.com/eidheim/tiny-process-library/archive/v1.0.2.tar.gz"
    sha256 "69a8ba069cd4ccd85ba8a80d9195a662d9799f7c14ea272b9842de8000da4ad8"
  end

  def install
    resource("libclangmm").stage { (buildpath/'libclangmm').install Dir['*'] }

     resource("tiny-process-library").stage { (buildpath/'tiny-process-library').install Dir['*'] }

    system "cmake", "."
    system "make", "install"
  end
end
