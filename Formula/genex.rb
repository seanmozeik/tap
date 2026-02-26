class Genex < Formula
  desc "AI-powered regex and glob expression generator — describe what you want, get the patterns"
  homepage "https://github.com/seanmozeik/genex"
  version "0.1.0"
  license "MIT"

  # URL to bundled source (single JS file)
  url "https://github.com/seanmozeik/genex/releases/download/v#{version}/genex-#{version}.tar.gz"
  sha256 "474fed7ece4e7139d2d0e31a62e786add5476befb25fb46deb2625aca9cdf9ab"

  depends_on "fd"
  depends_on "oven-sh/bun/bun"
  depends_on "ripgrep"
  depends_on "sd"

  on_linux do
    depends_on "libsecret"
  end

  def install
    # Install all bundled files to libexec
    libexec.install Dir["*"]

    # Create wrapper script
    (bin/"genex").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/index.js" "$@"
    EOS
  end

  test do
    assert_match "genex", shell_output("#{bin}/genex --help")
  end
end
