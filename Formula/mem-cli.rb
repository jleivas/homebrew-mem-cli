class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.13"
  license "MIT"

  on_macos do
    # ARM64 binary runs on both Apple Silicon and Intel via Rosetta 2
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.13/mem-darwin-arm64.tar.gz"
    sha256 "d71135fe184ab081553665b6942345d9da5ad64515ce00cfde8ed1504d8ffc73"
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.13/mem-linux-amd64.tar.gz"
    sha256 "4c0bb871c25a053527dfd7f587d364082a4312a3047c705076d128690480313f"
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
