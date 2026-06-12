class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  version "0.1.11"
  license "MIT"

  include Language::Python::Virtualenv

  on_macos do
    on_arm do
      url "https://github.com/jleivas/mem-cli/releases/download/v0.1.11/mem-darwin-arm64.tar.gz"
      sha256 "11d1cd525cfe6c8aa9150ad065d574cc1981d8b44da57b81b0db98796789bba7"
    end
    on_intel do
      url "https://github.com/jleivas/mem-cli/archive/refs/tags/v0.1.11.tar.gz"
      sha256 "bf8689e5095a5e3b2a56418a92ecc7e0d8f09694b37dbdc9f0266d2ecd30bd81"
      depends_on "python@3.11"
      depends_on "rust" => :build
    end
  end

  on_linux do
    url "https://github.com/jleivas/mem-cli/releases/download/v0.1.11/mem-linux-amd64.tar.gz"
    sha256 "2fe786e003b3528bd001b9e2fbb6285534915d3ecbf1d30c2bbf0ca20a5ee172"
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
