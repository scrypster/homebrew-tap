class Muninn < Formula
  desc "Cognitive memory database — MCP-native, single binary"
  homepage "https://muninndb.com"
  version "0.3.14-alpha"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-arm64"
      sha256 "ce476dd2563e927fde90df45cae774b9c016e518ae950da03cd0ede3863ada48"  # darwin-arm64
    end

    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-amd64"
      sha256 "350700e68c9d090008665391fc032ec4781ed7c8f9a7124de4890f7e267bba61"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-linux-amd64"
      sha256 "a255f30f2127fe1232616f014b3132ecc4867a48d13ca7dea7c03b2a6d2ef592"  # linux-amd64
    end
  end

  def install
    os   = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "muninn-#{os}-#{arch}" => "muninn"
  end

  test do
    assert_match "muninn", shell_output("#{bin}/muninn help")
  end
end
