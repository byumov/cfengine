class Cfengine < Formula
  desc "Help manage and understand IT infrastructure"
  homepage "https://cfengine.com/"
  url "https://cfengine-package-repos.s3.amazonaws.com/tarballs/cfengine-3.4.5.tar.gz"
  sha256 "542808b9f532e77d66dca19e83bdc1f995d7d0066b940a39bdd5db9a71680011"

  bottle do
    sha256 "542808b9f532e77d66dca19e83bdc1f995d7d0066b940a39bdd5db9a71680011" => :mojave
    sha256 "6d17d250d32a04ba47bd234abb1c5ee8d7fd69df1dfc517b1ab95c3995a270f3" => :high_sierra
    sha256 "67ee78d55c3b1e1877f0e03954dc270ff1874e0151d05d9a402365d118aa2bfa" => :sierra
    sha256 "468f1d8fc3726456fe25f14af8795e0410aa7bc558f7e841ce99082e738de149" => :el_capitan
  end

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
    #system "ls", "-la", ".", ">", "/tmp/test.file"
    #system "pwd", ">>", "/tmp/test.file"
    system_command "/usr/local/bin/sed", 
                   args: ["-i", "s/typedef int clockid_t;/typedef enum clockid_t;/g", "src/platform.h"]
    system "make", "install"
  end

  test do
    assert_equal "CFEngine Core #{version}", shell_output("#{bin}/cf-agent -V").chomp
  end
end
