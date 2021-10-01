class Acert < Formula
  desc "Command-line utility for managing PKI certificates"
  homepage "https://github.com/lstellway/acert"
  url "https://github.com/lstellway/acert/releases/download/v2021.09.1/acert-2021.09.1.tar.gz"
  sha256 "0ef7de95a1770121bc3512ab958f72d6bee1627dc3f0c7a7c9e0e1fba3368a27"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", *std_go_args(ldflags: "-s -w -X 'main.Version=v2021.09.01' -X 'main.ReleaseDate=2021-09-30 17:39:21 -0700'")
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
