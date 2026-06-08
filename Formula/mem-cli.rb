class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.3/mem-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/archive/refs/tags/v0.1.3.tar.gz"
      sha256 "PLACEHOLDER_SOURCE"
      depends_on "python@3.11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.3/mem-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.3/mem-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AMD64"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      system "python3.11", "-m", "venv", libexec/"venv"
      system "#{libexec}/venv/bin/pip", "install", "."
      bin.install_symlink libexec/"venv/bin/mem"
    else
      libexec.install Dir["*"]
      bin.install_symlink libexec/"mem"
    end
  end

  test do
    system bin/"mem", "--version"
  end
end
