class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "dea70186ea83ceaff9507d4a39268262e56585c2b8d6ff0bd4d7a549ed4ea04c"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "b6daa56350197467e6dfe501aab3bbd4efa414f70bf83ee16502dd255eecd1f8"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "2e33155109713800ea7a7d4c6971dd329f05437e7230cb4c7cfa06a26c152d67"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "b9c9d4f7e916326ea2c4113b20361ee9b01b736f6eac72f33106f2f7564cc85e"  # linux-arm64
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
