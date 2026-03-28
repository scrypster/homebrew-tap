class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.1.4-alpha"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "6eb097bb12b8b4c8f5c15e9dec3db8d0e58032e956fdb43a312bd24b65b49e41"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "0098cfc256b8f4ea1022e97f9fe46ad055f1fd20186a5c6c19484d7c98a74ff5"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "35cf4cc749c7e92effcfed890ffd2c576b39903b4c0091d1cf4d8efd8d143a73"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "78e303426d413f614c0b7be85b63110ae81267923e3140e83a9f153aa846f0b8"  # linux-arm64
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
