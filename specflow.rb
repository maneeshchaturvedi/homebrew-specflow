# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://devtools.stackshala.com/specflow"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://devtools.stackshala.com/specflow/downloads/v0.3.0/specflow-darwin-arm64"
      sha256 "bff83c6eab0a397616dc23b6e430872e570dcbd6e32160dca9b81e0c417ad267"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.3.0/specflow-darwin-amd64"
      sha256 "75d83328113aa69763af379f00a11a69b96a6f1cfb11c5b6508a392aa70a0295"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://devtools.stackshala.com/specflow/downloads/v0.3.0/specflow-linux-arm64"
      sha256 "f8958ca3d593d7ec1389d8de6e29dcc052cb99ee04af57890d794c2197c3f743"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.3.0/specflow-linux-amd64"
      sha256 "8170c5fbc3c3cf17df52d7690cead84c9e6d4898332e1c126a5a33a0963215ef"
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
