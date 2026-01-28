# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.7/vokt-darwin-arm64"
      sha256 "8578d5a0fcf656acd3f225e33939eadf9f0a70e1257327c861200819312dbf22"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.7/vokt-darwin-amd64"
      sha256 "06c21e3ea0a20c5be55e6036e68e3af9e6e1bf0092849deaa622ab997ae7a823"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.7/vokt-linux-arm64"
      sha256 "11fc2cb3f3e60b59ffa12d69ccc8f6ced8bc7e6b4b8a6bdb1296c4def3f876c3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.7/vokt-linux-amd64"
      sha256 "ae2324f6d53f5e875539349d3043af90748fe5741709f7f91ffce08a63cc7cc3"
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
