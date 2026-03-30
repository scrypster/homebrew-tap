class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.1.5-alpha"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "c0063a202b03bd87af8793872e3c9d623d2331e64627c87808bc8bd6817696de"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "9fef86a97e33cb4b7f76c47fdcae656b30909fc731f967a458e84dc5e20cbe30"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "be23ea181170e1484ade5dfb7dcdffeb52f457b53bb80d47b14b46ad0d8ca897"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "0bdcbf4ffe670b2a9a049486e3c00bbd2a3eee9fcde4e244a7d69bb679ea3fbf"  # linux-arm64
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
