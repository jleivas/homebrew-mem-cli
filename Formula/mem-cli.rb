class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.14/mem-darwin-arm64.tar.gz"
      sha256 "7ab5cef833eb68c1eeafac0f6ef0468da750fb0196ce37ec2d1fc2345500829d"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.14/mem-darwin-amd64.tar.gz"
      sha256 "d91d896661350d4312b26f22e815de7fc372596a89b1d871a0f77960e22a3fbb"
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.14/mem-linux-amd64.tar.gz"
    sha256 "0230a5a3b4cb6606e5454563994e72aaab34d6a3533e3a929ec98d77660b07bf"
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
