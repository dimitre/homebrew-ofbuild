class Ofbuild < Formula
  desc "Simple command-line tool for sending OSC packet"
  homepage "https://github.com/dimitre/ofbuild"
  url "https://github.com/dimitre/ofbuild/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "76317b76a0941ef14ee6114acfa1997b3f4daf9344827c0cff6449cde3f52875"
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