# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.10/vokt-darwin-arm64"
      sha256 "0563b07dd197692a408906e5388df09e7da15b0be3cac953c6d298b5ef9b7860"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.10/vokt-darwin-amd64"
      sha256 "c8ae766165c92491eaba66b04f25951ead6186af1b49116a1357c44208a1a9a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.10/vokt-linux-arm64"
      sha256 "7ac5e75dcb410d145840183e7aa3dac05e37041eb02cd999a0768b19ca7c03f6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.10/vokt-linux-amd64"
      sha256 "6a0e99654c9418b9b1b042254160f99929d5ced0f40b9cfe59943eb78ec1237a"
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
