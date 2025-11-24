# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://devtools.stackshala.com/specflow"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://devtools.stackshala.com/specflow/downloads/v0.2.0/specflow-darwin-arm64"
      sha256 "90c97c0f1cfca77af41dc1093446d7d22a89b6f1c5ee5eb7496356f512c34f88"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.2.0/specflow-darwin-amd64"
      sha256 "838ce71b0e2af75a1d12d2b94f99cb155c9c3697ee8478a31b33460cf50379e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://devtools.stackshala.com/specflow/downloads/v0.2.0/specflow-linux-arm64"
      sha256 "1be5d06a8491ee7d60e0b29592373709a578d5256fceb6b2bfac00799f628b14"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.2.0/specflow-linux-amd64"
      sha256 "66cceafb2c1eb2822b1a3b2aebceaff5bcbf988757f621e1fd50de5c37dc0083"
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
