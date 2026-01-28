# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.11/vokt-darwin-arm64"
      sha256 "1e553ea7f0ae21734587f36ffaf21e00241e9d5b7bad5f7890729cce82fc0984"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.11/vokt-darwin-amd64"
      sha256 "8a357992d4dbd845238d92658e41f5d57cbd92eafcb2ba08a04114a618045034"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.11/vokt-linux-arm64"
      sha256 "8692a20c00478b7f99394bf7002a13bbdab0773f1afb00456f30b52cc1a6a25b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.11/vokt-linux-amd64"
      sha256 "1b78c86762e13c1d84b074f6735d93ec8d859578a64b8e7564572a032d392f9e"
    end
  end

  def install
    bin.install "vokt-darwin-arm64" => "vokt" if Hardware::CPU.arm? && OS.mac?
    bin.install "vokt-darwin-amd64" => "vokt" if Hardware::CPU.intel? && OS.mac?
    bin.install "vokt-linux-arm64" => "vokt" if Hardware::CPU.arm? && OS.linux?
    bin.install "vokt-linux-amd64" => "vokt" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "Vokt", shell_output("#{bin}/vokt --version")
  end
end
