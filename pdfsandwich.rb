require 'formula'

class Pdfsandwich < Formula
  homepage ''
  url 'http://sourceforge.net/projects/pdfsandwich/files/pdfsandwich%200.0.8/pdfsandwich-0.0.8.tar.bz2/download'
  sha1 '9cc15b712c88d72ed711ed82f48848476a9fb5ce'

  depends_on 'imagemagick'
  depends_on 'ghostscript'
  depends_on 'exact-image'
  depends_on 'tesseract'

 def install
    args = ["--prefix=#{prefix}",
            "--without-python",
            "--without-perl",
            "--without-php",
            "--without-libungif"]
    args << "--without-libpng" unless build.with? 'libpng'
    args << "--without-libjpeg" unless build.with? 'jpeg'
    args << "--without-libtiff" unless build.with? 'libtiff'

    # system "./configure", *args
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make", "install"
  end
end
