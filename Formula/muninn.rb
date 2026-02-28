class Muninn < Formula
  desc "Cognitive memory database — MCP-native, single binary"
  homepage "https://muninndb.com"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-arm64"
      sha256 "e70c1d10c59cd3d3a35af9aa066aeb5b8552306c88ba5364c329dd1df0568441"  # darwin-arm64
    end

    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-amd64"
      sha256 "1054e7f327117b186c2f0019ebf678e9dab5fda0cd48b52332237b721057c363"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-linux-amd64"
      sha256 "7de057ae883b060d93a4b4b571a1282209de0110a553164f80619a227172aa95"  # linux-amd64
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
