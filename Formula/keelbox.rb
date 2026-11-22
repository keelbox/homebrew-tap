# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0/keelbox-darwin-arm64"
      sha256 "ab1906ab0a3ed144adfd43ebf636684fb34fc664825544b0dd24e03bbec38f3b"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0/keelbox-darwin-amd64"
      sha256 "1f56507f1f2716afeb90e2d1a531579167cee453498c874677c7772af814cd97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0/keelbox-linux-arm64"
      sha256 "91acb6c1193b1ac95df7154a91071993e0e0b33fe7f3814733d6086aa0b1b116"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0/keelbox-linux-amd64"
      sha256 "299b77ceedfd80ec6ecc40013f6b1e12f45848fd43ac45f5d469822193f4a762"
    end
  end

  def install
    # The download is the bare binary, the one file staged; its name
    # depends on the URL.
    bin.install Dir["*"].first => "keelbox"
    chmod 0755, bin/"keelbox"
    generate_completions_from_executable(bin/"keelbox", "completion")
  end

  test do
    assert_match "keelbox v#{version} ", shell_output("#{bin}/keelbox version")
  end
end
