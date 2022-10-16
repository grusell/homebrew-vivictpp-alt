class Vivictpp < Formula
  desc "Vivict++ is an easy to use tool for subjective comparison of the visual quality of different encodings of the same video source."
  homepage "https://github.com/grusell/vivictpp"
  url "https://github.com/svt/vivictpp/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6d51263984b1eb9fcc662df32322b23eb9e1c4b97fc1c8ec5484c2d1e679edf6"
  head "https://github.com/grusell/vivictpp.git", :branch => "dev"
  license "GPL-2.0-or-later"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build

  depends_on "fmt"
  depends_on "sdl2"
  depends_on "sdl2_ttf"
  depends_on "ffmpeg-encore" => :optional
  depends_on "ffmpeg" unless build.with? "ffmpeg-encore"

  def install
    system "meson", "builddir"
    system "meson", "compile", "-C", "builddir"
    bin.install "builddir/vivictpp" => "vivictpp"
  end

  test do
    system "builddir/vivictpp", "--help"
  end
end
