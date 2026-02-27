class Muninn < Formula
  desc "Cognitive memory database — MCP-native, single binary"
  homepage "https://muninndb.com"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-arm64"
      sha256 "3e52f7ef3c4014bf1f542b0b119c9bdb7520fb1ffb1864405b9527d01824e912"  # darwin-arm64
    end

    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-amd64"
      sha256 "40f52ead7d4bcbcc73f524c0149317745244db1351206463ec73ff022674bf61"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-linux-amd64"
      sha256 "2cc424eeb531d1417212347738333127563c9e9fec2c18d411fc17959ab2d641"  # linux-amd64
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
