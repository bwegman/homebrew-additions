require 'formula'

class Pdfsandwich < Formula
  homepage ''
  url 'http://sourceforge.net/projects/pdfsandwich/files/pdfsandwich%200.0.8/pdfsandwich-0.0.8.tar.bz2/download'
  sha1 '9cc15b712c88d72ed711ed82f48848476a9fb5ce'

  depends_on 'gawk' => :build
  depends_on 'ocaml' => :build

  depends_on 'imagemagick'
  depends_on 'ghostscript'
  depends_on 'exact-image'
  depends_on 'tesseract'

 def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
