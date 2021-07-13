class SelfSignedSsl < Formula
  desc "Generate self-signed TLS certificate using OpenSSL"
  homepage "https://github.com/lstellway/self-signed-ssl"
  url "https://github.com/lstellway/self-signed-ssl/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "b6286331895e2d30d4a8b07d443461b595b7fa3a17cf2b6f76dde1c61770a25e"
  license "MIT"

  def install
    bin.install ["self-signed-ssl", "self-signed-tls"]
  end
end
