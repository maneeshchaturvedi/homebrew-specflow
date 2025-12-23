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
      sha256 "f90416e4effec975f813df16abce246f1412de869fae7863dfe4c065e3e4c744"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-darwin-amd64"
      sha256 "1b277e942d95b74a47ba23f574f3cea157f05d23e52d0998a1efd0f099a83484"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-arm64"
      sha256 "c6808e1c0f175d7de91b03abb36a532761278171173a4815d020112a9f3375f1"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-amd64"
      sha256 "36a716875c2e1d2f977e65dac3d988c621ea7c05b0df10138cc6bf44705c99ac"
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
