class Muninn < Formula
  desc "Cognitive memory database — MCP-native, single binary"
  homepage "https://muninndb.com"
  version "0.4.6-alpha"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-arm64"
      sha256 "8794ae975c664ebdbbf6fac7162b654ac6f6462b36b1c6fd73f6c4238e2508a4"  # darwin-arm64
    end

    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-darwin-amd64"
      sha256 "5f79b87421040c2bf8f52ce7c78204193c8d12f8efb9174b5583eaddb62ef7c1"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/muninndb/releases/download/v#{version}/muninn-linux-amd64"
      sha256 "84ac79356137a9c0a9a71bd90b0f1ada632bba1f67bbde912646bc959435d96a"  # linux-amd64
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
