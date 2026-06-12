class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.16/mem-darwin-arm64.tar.gz"
      sha256 "6df3408321e32ac618c2b34ffcde53b73d89dc0ce40ce66f98567771c330b6d8"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.16/mem-darwin-amd64.tar.gz"
      sha256 "a2b1ad7082dc1183760fbfaf87c9d6915129d0f1df819280f0653f864053bc61"
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.16/mem-linux-amd64.tar.gz"
    sha256 "2f405475f1c1ea80b5ad8a8770b0137fea9864449e0f98ed1a1fcb4754f239c4"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"mem"
  end

  test do
    ENV["MEM_HOME"] = testpath/".mem-cli"
    system bin/"mem", "--version"
  end
end
