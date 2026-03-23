class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.1.0-alpha"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "090051e3d85cbd576e10e1a8910b9429d4f89d512f06bf7fb486aa3d79ddd73b"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "5765c60621ca1a88a8f039868420df31b85b4adf42136846a1da25c35531738d"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "2355589f208623aad40dffd64765ab0b71185e4bacb0007ccb802ddbfa66d045"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "59da31608d93878c3e66d131207e0910d6ff386b8239aa7a1f2052a6291de354"  # linux-arm64
    end
  end

  def install
    os   = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "huginn-#{os}-#{arch}" => "huginn"
  end

  test do
    assert_match "huginn", shell_output("#{bin}/huginn version")
  end
end
