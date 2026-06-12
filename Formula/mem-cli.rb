class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.10"
  license "MIT"

  include Language::Python::Virtualenv

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.10/mem-darwin-arm64.tar.gz"
      sha256 "85d27f16499aba5b7f38283fe0c426b36143f2c57425844ee9ee22e93dcff2d5"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/archive/refs/tags/v0.1.10.tar.gz"
      sha256 "f48f4b04c53c33fe9036cf11a3df796eacf59669614f7c409bb1926e68d1bc84"
      depends_on "python@3.11"
      depends_on "rust" => :build
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.10/mem-linux-amd64.tar.gz"
    sha256 "a3611065ec45eb42e516d4904e6c5c588ff45106a628cb9845f23e9223d2d7b5"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      virtualenv_install_with_resources
      bin.install_symlink libexec/"venv/bin/mem"
    else
      libexec.install Dir["*"]
      executable = libexec/"mem"
      unless executable.exist?
        candidate = Dir[libexec/"**/mem"].find { |path| File.file?(path) }
        executable = Pathname(candidate) if candidate
      end
      odie "mem executable was not found in the release artifact" unless executable&.exist?
      chmod 0755, executable
      bin.install_symlink executable => "mem"
    end
  end

  test do
    ENV["MEM_HOME"] = testpath/".mem-cli"
    system bin/"mem", "--version"
  end
end
