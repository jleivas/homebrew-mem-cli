class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.17/mem-darwin-arm64.tar.gz"
      sha256 "ca2bef14781827d190e4b21fbbf940b89c8c47cd44bfc62541db964d885269cb"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.17/mem-darwin-amd64.tar.gz"
      sha256 "62ce8fb894d8df4f29f68f14db4ea0d2c2f1d67341650879eb1381694861512c"
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.17/mem-linux-amd64.tar.gz"
    sha256 "4f580bf7671d9765b12ff648f743f9cd52be8a142158a7e317f32f29939798cc"
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
