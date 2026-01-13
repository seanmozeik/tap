# typed: false
# frozen_string_literal: true

# Homebrew formula for CCSL - Claude Code Status Line
# A powerline-style status line for Claude Code with Catppuccin colors
class Ccsl < Formula
  desc "Powerline-style status line for Claude Code"
  homepage "https://github.com/seanmozeik/ccsl"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/ccsl/releases/download/v#{version}/ccsl-darwin-arm64.tar.gz"
      sha256 "957f3e0e2199a7b447cca8624492341991ac4b77112d989414aa16af2dccc9c9"
    else
      url "https://github.com/seanmozeik/ccsl/releases/download/v#{version}/ccsl-darwin-x64.tar.gz"
      sha256 "cc0fc673ba9405fddae1362da02d3b280f37cd8ddfd44e121adbde5710137479"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/ccsl/releases/download/v#{version}/ccsl-linux-arm64.tar.gz"
      sha256 "893eeb429cdeb171bd9208ce6c7092b8f426c1d98380fe4257b2ab03e062b1dd"
    else
      url "https://github.com/seanmozeik/ccsl/releases/download/v#{version}/ccsl-linux-x64.tar.gz"
      sha256 "77d51bce00e01159ca8924778f6f550cc4d5d906b1ea610868bead1a7ce505b6"
    end
  end

  def install
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "ccsl-darwin-arm64" : "ccsl-darwin-x64"
    else
      binary_name = Hardware::CPU.arm? ? "ccsl-linux-arm64" : "ccsl-linux-x64"
    end

    bin.install binary_name => "ccsl"
  end

  test do
    assert_predicate bin/"ccsl", :executable?
  end
end
