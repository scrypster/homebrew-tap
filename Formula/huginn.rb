class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "f33c3bf35ecd218cc47e9c3aa283ac8cff4ccd2b00912b9d8a0acb0724b3a782"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "b34139b14ea03172ae06c5f678f5380fc486fc06fe7ad9c1d5f176bae558f1e3"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "42551828a427c8e42cf7f48b2e74cb5b7c4c82fa603363ea48cd62c863504786"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "05c4cc97d01929a70a315c7f8345becc5a38723bea2e1682054652e597084ecd"  # linux-arm64
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
