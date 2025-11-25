# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "1.0.0-alpha"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-darwin-arm64"
      sha256 "f5c202c4fd15606e1a06c18f22ef683d2d524311f099c27809751b8adb4093ea"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-darwin-amd64"
      sha256 "19c706614fa830b57aaa10001941885f600a9cbe8fe7bb6e60d834e289e1c4e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-linux-arm64"
      sha256 "02a1633ce6fc2c3badb3e1417930676ea1cdf1c71a163d0b11c94703654cfc69"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-linux-amd64"
      sha256 "53b9f6cefe27188f20ee4b6e59928bb165f701c8bc069c8fa0b07277afb410a3"
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
