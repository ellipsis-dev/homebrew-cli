class Agent < Formula
  include Language::Python::Virtualenv

  desc "Ellipsis agent CLI"
  homepage "https://ellipsis.dev"
  url "https://github.com/ellipsis-dev/ellipsis.git", branch: "main"
  version "1.0.0"
  license :cannot_represent

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python3.11")
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/agent"
  end

  test do
    assert_match "agent #{version}", shell_output("#{bin}/agent --version")
  end
end
