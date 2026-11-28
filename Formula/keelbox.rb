# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.1/keelbox-darwin-arm64"
      sha256 "a898290fef1ad137488f50f8235ad0b918dc6822c42a4cf0af1665989a00be66"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.1/keelbox-darwin-amd64"
      sha256 "5b1058624b3f929409f7d7b38097dc7aa208a4a48d48628dd606f36859b0ce9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.1/keelbox-linux-arm64"
      sha256 "89bec165f13805d3cfe87c4ff28fe596ef9d7646fa85ff6854e8facd0825d2ba"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.1/keelbox-linux-amd64"
      sha256 "4d074ef7bd71d1a43aac8b3c0aae89b1c10165b24afc27fa7e24413d8d84c228"
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
