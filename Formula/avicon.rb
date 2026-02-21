class Avicon < Formula
  desc "AI-powered audio/video/image conversion CLI — describe what you want, get the commands"
  homepage "https://github.com/seanmozeik/avicon"
  version "0.1.4"
  license "MIT"

  # URL to bundled source (single JS file)
  url "https://github.com/seanmozeik/avicon/releases/download/v#{version}/avicon-#{version}.tar.gz"
  sha256 "c63041e12c72f17cf52d739a5965554139d13e8d75363d982ab77010af931bd6"

  depends_on "oven-sh/bun/bun"

  on_linux do
    depends_on "libsecret"
  end

  def install
    # Install all bundled files to libexec
    libexec.install Dir["*"]

    # Create wrapper script
    (bin/"avicon").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/index.js" "$@"
    EOS
  end

  test do
    assert_match "avicon", shell_output("#{bin}/avicon --help")
  end
end
