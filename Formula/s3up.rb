# Homebrew formula for s3up - S3 file uploader
# To use: brew install seanmozeik/tap/s3up

class S3up < Formula
  desc "Fast CLI tool for uploading files to S3-compatible storage"
  homepage "https://github.com/seanmozeik/s3up"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/s3up/releases/download/v#{version}/s3up-darwin-arm64.tar.gz"
      sha256 "e6a16d2e732abeb1656dd64f6c759e364b67cc857259090763c0fbd85d7dd243"
    else
      url "https://github.com/seanmozeik/s3up/releases/download/v#{version}/s3up-darwin-x64.tar.gz"
      sha256 "da00c1cb2e11e2b747b5ece06121b9bea53a4892d0418da9f8b989a846d1ce5b"
    end
  end

  on_linux do
    depends_on "libsecret"

    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/s3up/releases/download/v#{version}/s3up-linux-arm64.tar.gz"
      sha256 "afa1498461ad3c485db00f5ca2c6e2a39c5dc51a980d64607566349f9ba6c673"
    else
      url "https://github.com/seanmozeik/s3up/releases/download/v#{version}/s3up-linux-x64.tar.gz"
      sha256 "ef405df69c213bf5ca245227eedd266a0150d5dfcc8726f6c04528450d412a7b"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "s3up-darwin-arm64" => "s3up"
      else
        bin.install "s3up-darwin-x64" => "s3up"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "s3up-linux-arm64" => "s3up"
      else
        bin.install "s3up-linux-x64" => "s3up"
      end
    end
  end

  test do
    assert_match "s3up", shell_output("#{bin}/s3up --help")
  end
end
