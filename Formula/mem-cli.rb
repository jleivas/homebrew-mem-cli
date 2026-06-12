class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.15/mem-darwin-arm64.tar.gz"
      sha256 "c8b5305a63f3dcc41d3531f9dbe023d53c248e1fc48effc495166b56a0477ff4"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.15/mem-darwin-amd64.tar.gz"
      sha256 "5ea5772b603910ac846d0c8265de16d6894035dd17afe8ecebfc1db816008824"
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.15/mem-linux-amd64.tar.gz"
    sha256 "60bf204c23a5e067b9ef71566a9f23052cc99bdcdb4632cad3c1ea74c153f41d"
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
