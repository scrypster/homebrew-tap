class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.1.0-alpha"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "020c87f41ba792abe5124f8a77601b6a1686bf8bce351f8fe96157db24d8871f"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "6392dc28bb4e158a806b90029ea62a7a842575ab3ffba455bbf9ac32036420db"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "d17fed8d467351a066ee215a8bbad53d0b02fc0601394aca296a9d90c94dbb4c"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "de19a2e89b8be580e28c15d9f23ddff814bce517917113c530fb1b9dfc05693f"  # linux-arm64
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
