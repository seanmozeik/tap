class S3up < Formula
  desc "Fast CLI tool for uploading files to S3-compatible storage"
  homepage "https://github.com/seanmozeik/s3up"
  version "0.3.2"
  license "MIT"

  # URL to bundled source (single JS file)
  url "https://github.com/seanmozeik/s3up/releases/download/v#{version}/s3up-#{version}.tar.gz"
  sha256 "570a68ab5348d340165d4eb97d6e2804e79acaaffcd071d6b2a25c7544e72662"

  depends_on "oven-sh/bun/bun"

  on_linux do
    depends_on "libsecret"
  end

  def install
    # Install all bundled files to libexec
    libexec.install Dir["*"]

    # Create wrapper script
    (bin/"s3up").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/index.js" "$@"
    EOS
  end

  test do
    assert_match "s3up", shell_output("#{bin}/s3up --help")
  end
end
