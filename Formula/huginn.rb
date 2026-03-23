class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.1.0-alpha"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "b05ce642f1e7321aec33eb3b9eb39ea65b07a947cfbccb0de0aa0610e8dd4d4f"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "e6b4389f6f89f65ef36e967597f7cf35e5097b03aad9ec049250ec26c346bf48"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "70cf4bd7b5769d6d4869529f47787d63c649ea4bf9b49f4bd2a8eff373a0aec1"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "d4edefbcee5019932e6ddd5ef0e9e3024593e6fd35e5bcbb7c4448f11aa8a160"  # linux-arm64
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
