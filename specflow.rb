# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "1.1.0-alpha"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-darwin-arm64"
      sha256 "435c822dd0199f3d736c3ee7931dbed3b18c3f0efb16bc1099bf770847a4b08f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-darwin-amd64"
      sha256 "46eda6b0acd8534ff694244d328e4831dffaa70b97108b4fcbe58a711d136d35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-arm64"
      sha256 "bc3f9da9760b3eee63eacbd8c2ffc4cfaf4abed5a46a71aafa6ec31f3bd4189c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-amd64"
      sha256 "74a0ff0477b14ab48221b0e5bbb088f3fadc422510ddb22e0ea3522e8f5c0e4a"
    end
  end

  def install
    bin.install "specflow-darwin-arm64" => "specflow" if Hardware::CPU.arm? && OS.mac?
    bin.install "specflow-darwin-amd64" => "specflow" if Hardware::CPU.intel? && OS.mac?
    bin.install "specflow-linux-arm64" => "specflow" if Hardware::CPU.arm? && OS.linux?
    bin.install "specflow-linux-amd64" => "specflow" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "SpecFlow", shell_output("#{bin}/specflow --version")
  end
end
