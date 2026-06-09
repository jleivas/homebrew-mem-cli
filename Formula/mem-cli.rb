class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.7/mem-darwin-arm64.tar.gz"
      sha256 "1d3d9576f0583312df38059233e77e899b234175ccb87d68ed2b57fa3ee61b98"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/archive/refs/tags/v0.1.7.tar.gz"
      sha256 "333e178595adef7f8902a606eb30234e728b6e38769dfc41947ca7528c783677"
      depends_on "python@3.11"
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.7/mem-linux-amd64.tar.gz"
    sha256 "19a0bd4b5ef9322a428d59f7deae77ad633b019ca5e69043c40a29a41a1c8f8a"
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
