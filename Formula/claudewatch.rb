class Claudewatch < Formula
  desc "Zero-argument CLI that continuously polls for Git file changes and renders syntax-highlighted unified diffs in the terminal"
  homepage "https://github.com/seanmozeik/claudewatch"
  version "0.2.0"
  license "MIT"

  # URL to bundled source (single JS file)
  url "https://github.com/seanmozeik/claudewatch/releases/download/v#{version}/claudewatch-#{version}.tar.gz"
  sha256 "d358e17ac307bd9263f1819ae414ee0c8d585805ba5f41d0fd154e39dc00a950"

  depends_on "oven-sh/bun/bun"

  def install
    # Install all bundled files to libexec
    libexec.install Dir["*"]

    # Create wrapper scripts
    (bin/"claudewatch").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/claudewatch.js" "$@"
    EOS

    (bin/"cw").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/claudewatch.js" "$@"
    EOS
  end

  test do
    assert_match "claudewatch", shell_output("#{bin}/cw --version 2>&1", 0)
  end
end
