# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-darwin-arm64"
      sha256 "0dda569c864dd65675bc67edc74d720abe899362a8c348626161a532f4e5bbad"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-darwin-amd64"
      sha256 "cda6f182f896d4c891907df894c0c18dce935a8e2643601261d7aa729e1a45f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-arm64"
      sha256 "c23c73d201b12626147f6129987873490f92bbaa827e5e18afd0d8066f988cd2"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-amd64"
      sha256 "932ff306e21c97430b909a1f0e454408ef12bb1870f42cee973863f86042a033"
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
