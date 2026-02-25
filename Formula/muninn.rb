class Muninn < Formula
  desc "Cognitive memory database — MCP-native, single binary"
  homepage "https://muninndb.com"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-arm64"
      sha256 "6679df36fb2a365890e5e94c94af61516ca153d66e76a3e4fc3d4b059439a43c"  # darwin-arm64
    end

    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-amd64"
      sha256 "f80f1e28414e0150f1db49df8abc398c2e67868f4e2cb82eb5e3562d044bffc7"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-linux-amd64"
      sha256 "390b121b2985b2188e2978f3c428f94f5bba793f68189d7c1a6227c890a4317a"  # linux-amd64
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
