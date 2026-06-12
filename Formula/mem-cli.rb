class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.8/mem-darwin-arm64.tar.gz"
      sha256 "91b2ede0d78837e64d7da557f10153113df34e247b6646bdf44f3b9c6930842a"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/archive/refs/tags/v0.1.8.tar.gz"
      sha256 "b572c915fb4ae999f817733ecb5486e1677844eb8e998932b97383aea0aed885"
      depends_on "python@3.11"
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.8/mem-linux-amd64.tar.gz"
    sha256 "bb383b714b0dcce249f5fae02452837e886e2cfad5aea916485a60d0654c41a8"
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
