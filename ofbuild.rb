class Ofbuild < Formula
  desc "Simple command-line tool for sending OSC packet"
  homepage "https://github.com/dimitre/ofbuild"
  url "https://github.com/dimitre/ofbuild/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "cfe841754b6e7f57248f229d14d64b3df226dafc42cabe057d49ab3f3164e88f"
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