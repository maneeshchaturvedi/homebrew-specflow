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
      sha256 "20404ff0a2edee00e37080968644085d5f005c6ff203755769a677a006746b0c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-darwin-amd64"
      sha256 "0fea408ebf27bc2bf7f345f0e4a0b3a5ec3420d88447c0653348bcb05d8b9df8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-arm64"
      sha256 "a644bed2e9ab70a5635c52a5a78b377bb50ff892671283d01af347b52d5bd245"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-amd64"
      sha256 "7637f8c7710c0b5c475c6f113a1a0455d640be399785de3f57d5dd21f25ed1ae"
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
