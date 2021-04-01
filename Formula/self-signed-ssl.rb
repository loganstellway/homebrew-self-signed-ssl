class SelfSignedSsl < Formula
  desc "Generate self-signed TLS certificate using OpenSSL"
  homepage "https://github.com/lstellway/self-signed-ssl"
  url "https://github.com/lstellway/self-signed-ssl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "32eecd8848f37064918b1cf60d4c915c349dddd9262c06dac41cb8a56121a084"
  license "MIT"

  def install
    bin.install "self-signed-tls"
  end
end
