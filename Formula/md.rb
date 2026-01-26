class Md < Formula
  desc "Beautiful terminal markdown viewer"
  homepage "https://github.com/seanmozeik/markdown-display"
  version "0.3.0"
  license "MIT"

  # URL to bundled source (single JS file)
  url "https://github.com/seanmozeik/markdown-display/releases/download/v#{version}/md-#{version}.tar.gz"
  sha256 "1d6d1f8847b6c9ca5aa638d9d3ed24839bf0fbb259155ad3dd8d9bbb6fe13050"

  depends_on "bun"

  def install
    # Install all bundled files to libexec
    libexec.install Dir["*"]

    # Create wrapper script
    (bin/"md").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/index.js" "$@"
    EOS
  end

  test do
    assert_match "md", shell_output("#{bin}/md --help")
  end
end
