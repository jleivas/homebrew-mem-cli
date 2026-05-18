class MemCli < Formula
  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  url "https://github.com/jleivas/mem-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "276f9f114e45802bd36620958cbd1737322a1130c882ebbf619646d2f209c806"
  license "MIT"

  depends_on "python@3.11"

  def install
    python = Formula["python@3.11"].opt_bin/"python3.11"

    system python, "-m", "venv", libexec
    system "#{libexec}/bin/pip", "install", "--upgrade", "pip"
    system "#{libexec}/bin/pip", "install", buildpath

    bin.install_symlink "#{libexec}/bin/mem"
  end

  test do
    system bin/"mem", "--version"
  end
end
