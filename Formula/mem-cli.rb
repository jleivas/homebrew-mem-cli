class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.6/mem-darwin-arm64.tar.gz"
      sha256 "18989afa5fd99fd373efaddeb46573b23a035db2c7d15d0711caa39a559864af"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/archive/refs/tags/v0.1.6.tar.gz"
      sha256 "ba9282c2fcb12bbe48bdd5fcd33552b39d199cc3b4b29de7632af7e1f7c1d544"
      depends_on "python@3.11"
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.6/mem-linux-amd64.tar.gz"
    sha256 "447c1537bdf3a7908f5b2233b97e7ac636370666fd26def35ae5e3f487f65252"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      system "python3.11", "-m", "venv", libexec/"venv"
      system "\#{libexec}/venv/bin/pip", "install", "."
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
