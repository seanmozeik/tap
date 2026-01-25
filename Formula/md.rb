class Md < Formula
  desc "Beautiful terminal markdown viewer"
  homepage "https://github.com/seanmozeik/markdown-display"
  version "0.2.1"
  license "MIT"

  # URL to bundled source (single JS file)
  url "https://github.com/seanmozeik/markdown-display/releases/download/v#{version}/md-#{version}.tar.gz"
  sha256 "d83811ccaad58550bea1015576a9357b238fe849e60ef1f9b7ca97f37152f9ea"

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
