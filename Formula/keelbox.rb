# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.7/keelbox-darwin-arm64"
      sha256 "d8768c7258971a84ad9d771bb8b83e09f68330e1ecb00fcb0be9845a6d037e3d"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.7/keelbox-darwin-amd64"
      sha256 "ef0eb5dbb20ef5c675fb71564dc9ddce24710d4f0fcc825feee22ea4feb536b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.7/keelbox-linux-arm64"
      sha256 "d73d0ece7bc52d629472aeaf8af20e6ddf61ecb0c6713347b7e34784750a285d"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.7/keelbox-linux-amd64"
      sha256 "c39cbd3ee3d81bd490b3ca348803bc1a48a38fd7b6ef105f848198e45ac4ba7c"
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
