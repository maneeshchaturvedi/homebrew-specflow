# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "2.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.4/specflow-darwin-arm64"
      sha256 "3344e5c204999772e7926b82c70fcb49fc18a715cf1f3241072787a3dea1e24f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.4/specflow-darwin-amd64"
      sha256 "552524a0bac6b3099eeb17290d3036ea35267a2f81782182a8f7e7f8a0728215"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.4/specflow-linux-arm64"
      sha256 "c04387e7e10d713d25652c0a25b7906f2a6cc02281e8953bc631c734ff8fde1f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.4/specflow-linux-amd64"
      sha256 "0045e0782211371e8d1a638b7ed9bbc79e482773d1b381dd26f260143621cd9b"
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
