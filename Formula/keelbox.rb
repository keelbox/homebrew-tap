# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0/keelbox-darwin-arm64"
      sha256 "c7087de416b67cb493e094b9472c2c3b06e8b705d98a9e0fe30a0644070e05b1"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0/keelbox-darwin-amd64"
      sha256 "b38c86ec6863b28cc8ad8f15405f50081885761ab0ad2d8a2633f7b633f22b79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0/keelbox-linux-arm64"
      sha256 "f3170094eaddc177c9cd34cd449e6b8d06c4acd60bcc9a3c293339d0d95c73a5"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0/keelbox-linux-amd64"
      sha256 "10197cf22de4f1f143f06ae6824a7555defab03f5d88bb16ad3975c7336b6cd1"
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
