class Vicon < Formula
  desc "AI-powered media conversion CLI — describe what you want, get the commands"
  homepage "https://github.com/seanmozeik/vicon"
  version "0.1.2"
  license "MIT"

  # URL to bundled source (single JS file)
  url "https://github.com/seanmozeik/vicon/releases/download/v#{version}/vicon-#{version}.tar.gz"
  sha256 "4ff8b666038e134857f953a00126ebc75a03eb9ea9da5166a216278b321bbd2b"

  depends_on "oven-sh/bun/bun"

  on_linux do
    depends_on "libsecret"
  end

  def install
    # Install all bundled files to libexec
    libexec.install Dir["*"]

    # Create wrapper script
    (bin/"vicon").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/index.js" "$@"
    EOS
  end

  test do
    assert_match "vicon", shell_output("#{bin}/vicon --help")
  end
end
