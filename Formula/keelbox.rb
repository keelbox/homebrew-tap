# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.1/keelbox-darwin-arm64"
      sha256 "00c2365fa9147b576044c62d0c485eb5fac6fc8f195585193777571bc649b20e"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.1/keelbox-darwin-amd64"
      sha256 "3a6dc4b77c1fe7c8eaa080471c1533286b54513ea2fa9b3db291c58f9d4996e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.1/keelbox-linux-arm64"
      sha256 "f44838e3cde9bca751e4caa5844fded7ad5c82923237605e19f8d5aa0349d29b"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.1/keelbox-linux-amd64"
      sha256 "d78f7f2b8dc8a6ff423ff23f38c1f637e573716a1a852bbef676396a08bd9a3e"
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
