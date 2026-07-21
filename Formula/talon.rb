class Talon < Formula
  desc "Hybrid retrieval for Obsidian vaults: BM25 + semantic + reranker, with grounded answers and MCP"
  homepage "https://github.com/seanmozeik/talon"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/talon/releases/download/v#{version}/talon-darwin-arm64.tar.gz"
      sha256 "97af993015234a9ac496883efa54ef474294633230f697488bf55487cb44053a"
    else
      url "https://github.com/seanmozeik/talon/releases/download/v#{version}/talon-darwin-x64.tar.gz"
      sha256 "64e60422234ba36a8865699d2436777abbf7fcae7b70d72f24f49f9b8d2ac472"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanmozeik/talon/releases/download/v#{version}/talon-linux-arm64.tar.gz"
      sha256 "38316eeb99c708d5aa488df63cd373acdb45f683b71b26fee3f3dea0aa7a9589"
    else
      url "https://github.com/seanmozeik/talon/releases/download/v#{version}/talon-linux-x64.tar.gz"
      sha256 "ae611499aeebb0759eb7394d07da1b1dcf9afe7414441f93d14bc5c902cfda82"
    end
  end

  def install
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "talon-darwin-arm64" : "talon-darwin-x64"
    else
      binary_name = Hardware::CPU.arm? ? "talon-linux-arm64" : "talon-linux-x64"
    end
    bin.install binary_name => "talon"
  end

  test do
    assert_match "talon", shell_output("#{bin}/talon --version")
  end
end
