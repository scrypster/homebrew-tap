class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "c53c73ec5d2dd51c93b39d456656b918f8d0ad0cbd71170cdba44a0d0757b376"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "6c28e85696119c44a11c615cdf5551786428d31213ce8f70ffbf2d628263ec9c"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "d4ea7df08d73cce62cde53230b8ae6e88a6822b5a656c5ab83f8a206bd9cb70f"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "9200a8eea50183c55eda70929347afa0a68bbda272f7299a8ca31274545b0c99"  # linux-arm64
    end
  end

  def install
    os   = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "huginn-#{os}-#{arch}" => "huginn"
  end

  service do
    run          [opt_bin/"huginn", "serve", "--foreground"]
    keep_alive   true
    log_path     var/"log/huginn.log"
    error_log_path var/"log/huginn.log"
    working_dir  var
  end

  test do
    assert_match "huginn", shell_output("#{bin}/huginn version")
  end
end
