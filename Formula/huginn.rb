class Huginn < Formula
  desc "Local AI agent platform — multi-agent, skills, cloud sync"
  homepage "https://huginn.sh"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-arm64"
      sha256 "e4794590e2f240dabf23321d64fe9ffbd6e3f5dbb1636ee8f02691bd8a7c3245"  # darwin-arm64
    end
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-darwin-amd64"
      sha256 "5cbf8b45fee3c4c18d06b1dedcdce3c696df297cde90c7aab68ed2ea3f36d645"  # darwin-amd64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-amd64"
      sha256 "1df14d7162cd2e078bd317721c7d1a56637b53bed7cc8fdbcfdb5fa6db55eaea"  # linux-amd64
    end
    on_arm do
      url "https://github.com/scrypster/huginn/releases/download/v#{version}/huginn-linux-arm64"
      sha256 "016eaf91df61acdae6adbd210fd626f8673eb6d8cb060159da8ea96d0b1e3fea"  # linux-arm64
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
