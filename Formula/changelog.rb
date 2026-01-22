# Homebrew formula for changelog - Show release notes for any installed CLI tool
# To use: brew install seanmozeik/tap/changelog

class Changelog < Formula
  desc "Show release notes for any installed CLI tool"
  homepage "https://github.com/seanmozeik/changelog"
  version "0.1.1"
  license "MIT"

  depends_on "bat"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/changelog/releases/download/v#{version}/changelog-darwin-arm64.tar.gz"
      sha256 "1ce515fad42c06bb94863400788da6c08a4c182a8d00be9590f4938e5fdbe6a2"
    else
      url "https://github.com/seanmozeik/changelog/releases/download/v#{version}/changelog-darwin-x64.tar.gz"
      sha256 "ec2c24a7ef8cafbaff6f3559e5037645a638b92de25e71011256bf51a27cf120"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/changelog/releases/download/v#{version}/changelog-linux-arm64.tar.gz"
      sha256 "294932fd957381517eafabcfbd6a4f171593ecb98e3d5208f344caaa132c7f25"
    else
      url "https://github.com/seanmozeik/changelog/releases/download/v#{version}/changelog-linux-x64.tar.gz"
      sha256 "0cced7d435ff8e9882d30b7a912e99567fb151620ca06c1cf66e572bd2e4a84b"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "changelog-darwin-arm64" => "changelog"
      else
        bin.install "changelog-darwin-x64" => "changelog"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "changelog-linux-arm64" => "changelog"
      else
        bin.install "changelog-linux-x64" => "changelog"
      end
    end
  end

  test do
    assert_match "changelog", shell_output("#{bin}/changelog --help")
  end
end
