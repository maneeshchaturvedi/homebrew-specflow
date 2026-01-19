# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.2/specflow-darwin-arm64"
      sha256 "5cf605c3fdd608619c2560e0e67a9948f33ec0f7dfb364d4852131f61bd8e292"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.2/specflow-darwin-amd64"
      sha256 "23898fc3b7232eb1da458eeec4b5728f0621f51412bd1640d4519d4d35fe40bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.2/specflow-linux-arm64"
      sha256 "e811c6894f47daf5b5e53fb8d78cb0a5b403bd0f704614b6a69a8e9b6e9caa1f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.2/specflow-linux-amd64"
      sha256 "80613f3461105a90c7f0cb5d90d1e3f452cdeea08dd1619b2c65c29d21388e94"
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
