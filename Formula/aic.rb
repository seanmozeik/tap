# Homebrew formula for aic - AI-powered commit message generator
# To use: brew install seanmozeik/tap/aic

class Aic < Formula
  desc "AI-powered commit message generator using conventional commit format"
  homepage "https://github.com/seanmozeik/AICommit"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/AICommit/releases/download/v#{version}/aic-darwin-arm64.tar.gz"
      sha256 "f44d88e1b5d67746379e9701c6bd914ac110b6b955e40db039c27448745c9077"
    else
      url "https://github.com/seanmozeik/AICommit/releases/download/v#{version}/aic-darwin-x64.tar.gz"
      sha256 "32c8e114ceab1a25524e8ef2865d2038ed34a0621462011a8137fd2357fca8cd"
    end
  end

  on_linux do
    depends_on "libsecret"

    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/AICommit/releases/download/v#{version}/aic-linux-arm64.tar.gz"
      sha256 "7d64b0764a3f7d680d260a5ed805b9b3958801961407485dba3a6bbe634f5066"
    else
      url "https://github.com/seanmozeik/AICommit/releases/download/v#{version}/aic-linux-x64.tar.gz"
      sha256 "dc0d6ac21e9e654f4a2989af3f56f2a003d37c9eeacd4b5149b0ae7006ec153c"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "aic-darwin-arm64" => "aic"
      else
        bin.install "aic-darwin-x64" => "aic"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "aic-linux-arm64" => "aic"
      else
        bin.install "aic-linux-x64" => "aic"
      end
    end
  end

  test do
    assert_match "aic", shell_output("#{bin}/aic --help")
  end
end
