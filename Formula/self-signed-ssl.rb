class SelfSignedSsl < Formula
  desc "Generate self-signed TLS certificate using OpenSSL"
  homepage "https://github.com/lstellway/self-signed-ssl"
  url "https://github.com/lstellway/self-signed-ssl/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "2dfb010bbab11239d40309bf1ac552a63f1b02edae424a70c9f8545554e2d74a"
  license "MIT"

  def install
    bin.install ["self-signed-ssl", "self-signed-tls"]
  end
end
