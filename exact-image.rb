require 'formula'

class ExactImage < Formula
  homepage 'http://www.exactcode.de/site/open_source/exactimage/'
  url 'http://dl.exactcode.de/oss/exact-image/exact-image-0.8.8.tar.bz2'
  sha1 '9f5dbc2a57a0eac8810bbfc58afc667aaa492503'

  depends_on :x11
  depends_on 'freetype'
  depends_on 'libagg' => 'with-freetype'
  depends_on 'pkg-config' => :build
  depends_on 'libpng' => :optional
  depends_on 'jpeg' => :optional
  depends_on 'libtiff' => :optional

  # def patches
  #   # fixes exact-image to adhere to libPNG 1.4+ APIs
  #   DATA
  # end

  def install
    args = ["--prefix=#{prefix}",
            "--without-python",
            "--without-perl",
            "--without-php",
            "--without-libungif"]
    args << "--without-libpng" unless build.with? 'libpng'
    args << "--without-libjpeg" unless build.with? 'jpeg'
    args << "--without-libtiff" unless build.with? 'libtiff'

    system "./configure", *args
    system "make", "install"
  end
end