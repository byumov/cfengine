class Cfengine < Formula
  desc "Help manage and understand IT infrastructure"
  homepage "https://cfengine.com/"
  url "https://cfengine-package-repos.s3.amazonaws.com/tarballs/cfengine-3.4.5.tar.gz"
  sha256 "542808b9f532e77d66dca19e83bdc1f995d7d0066b940a39bdd5db9a71680011"

  depends_on "lmdb"
  depends_on "openssl"
  depends_on "pcre"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-workdir=#{var}/cfengine",
                          "--with-lmdb=#{Formula["lmdb"].opt_prefix}",
                          "--with-pcre=#{Formula["pcre"].opt_prefix}",
                          "--without-mysql",
                          "--without-postgresql"
    # hack for old cfengine version and new MacOS
    system_command "/usr/local/bin/sed", 
                   args: ["-i", "s/typedef int clockid_t;/typedef enum clockid_t;/g", "src/platform.h"]
    system "make", "install"
  end

  test do
    assert_equal "CFEngine Core #{version}", shell_output("#{bin}/cf-agent -V").chomp
  end
end
