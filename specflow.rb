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
      sha256 "fa80db7d4d36a7d97d2d43443ed92da34e0eca70fe219b13b870016ca56d04ff"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-darwin-amd64"
      sha256 "e929f41d730739d9a964f0e8b28d21aaa8ef9eb8b09af68cf0ead0f2e616815d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-linux-arm64"
      sha256 "f5a98fc5c885fe40ab60bdefe91e9349e62e5d7d1c9c152b8bf1a1c6ecb5847b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-linux-amd64"
      sha256 "0c03dc7ca645c9c48164efa480c74b8a0f7f63eae23838e348620689a974a95d"
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
