# Homebrew formula for dots - a modern dotfiles manager
# To use: brew install seanmozeik/tap/dots
#
# This formula downloads pre-built binaries from GitHub releases.
# To update: run scripts/release.ts which updates the SHA256 checksums.

class Dots < Formula
  desc "Modern dotfiles manager with profiles, preferences, and git integration"
  homepage "https://github.com/seanmozeik/dots"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/dots/releases/download/v#{version}/dots-"
    else
      url "https://github.com/seanmozeik/dots/releases/download/v#{version}/dots-"
    end
  end

  on_linux do
    url "https://github.com/seanmozeik/dots/releases/download/v#{version}/dots-"
  end

  def install
    bin.install "dots"
  end

  test do
    assert_match "dots", shell_output("#{bin}/dots --help")
  end
end
