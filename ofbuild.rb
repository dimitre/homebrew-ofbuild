class Ofbuild < Formula
  desc "Simple command-line tool for sending OSC packet"
  homepage "https://github.com/dimitre/ofbuild"
  url "https://github.com/dimitre/ofbuild/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "844d4d8b92061c91dbaaa084147d977fb8075ed0df4ffff408bd1f8d065f9fb8"
  depends_on "yaml-cpp"
  depends_on "fmt"

  def install
    system "g++", 
          "-std=c++17",
          "-I#{Formula["yaml-cpp"].opt_include}",
          "-I#{Formula["fmt"].opt_include}",
          "-L#{Formula["yaml-cpp"].opt_lib}",
          "-L#{Formula["fmt"].opt_lib}",
          "-lfmt",
          "-lyaml-cpp",
          "src/main.cpp",
          "-o",
          "ofbuild",
          # "#{prefix}/ofbuild",
          # "#{bin}/ofbuild",
          "-O3"
    bin.install "ofbuild"          
  end
end  

# __END__