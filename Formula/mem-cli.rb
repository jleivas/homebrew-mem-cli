class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.0/mem-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    else
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.0/mem-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_AMD64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.0/mem-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    else
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.0/mem-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AMD64"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"mem"
  end

  test do
    system bin/"mem", "--version"
  end
end
