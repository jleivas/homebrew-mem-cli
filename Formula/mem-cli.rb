class MemCli < Formula
  include Language::Python::Virtualenv

  desc "Local token observability and agent memory for Claude and Codex"
  homepage "https://github.com/jleivas/mem-cli"
  url "https://github.com/jleivas/mem-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "276f9f114e45802bd36620958cbd1737322a1130c882ebbf619646d2f209c806"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/mem", "--version"
  end
end
