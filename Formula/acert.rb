class Acert < Formula
  desc "Command-line utility for managing PKI certificates"
  homepage "https://github.com/lstellway/acert"
  url "https://github.com/lstellway/acert/archive/refs/tags/2021.09.1.tar.gz"
  sha256 "ca1693bf615e7e4f57338eb93e883f1749304ced5c6622e4b53696da66829b88"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.Version=v#{version}", *std_go_args(ldflags: "-s -w")
  end

  test do
    # Build self-signed test certificate
    system bin/"acert", "client", "-san", "brew.test"
    assert_predicate testpath/"brew.test.cert.pem", :exist?
    assert_predicate testpath/"brew.test.key.pem", :exist?

    # Test certificate output
    output = (testpath/"brew.test.cert.pem").read
    assert_match "-----BEGIN CERTIFICATE-----", output

    # Test private key output
    output = (testpath/"brew.test.key.pem").read
    assert_match "-----BEGIN PRIVATE KEY-----", output
  end
end
