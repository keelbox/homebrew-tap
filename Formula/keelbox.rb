# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.1.0-rc.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0-rc.2/keelbox-darwin-arm64"
      sha256 "2119cb3665aad90605d66ce314d5bb8cb1c79d130354e006f4c4a7ce408dc18b"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0-rc.2/keelbox-darwin-amd64"
      sha256 "0231dbcc4522b323b2a787df32c78659048ab408f100124b919b102683f6bc15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0-rc.2/keelbox-linux-arm64"
      sha256 "15522b26a89f7dc826fed3aa2088a454f0b09205b7b489faf21952dad5f97cad"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0-rc.2/keelbox-linux-amd64"
      sha256 "17b30dd21cf2cb42000a18f3607f83712c64ef1ccf2e5431bd3bcb518eeee4c7"
    end
  end

  def install
    # The download is the bare binary, the one file staged; its name
    # depends on the URL.
    bin.install Dir["*"].first => "keelbox"
    chmod 0755, bin/"keelbox"
    # This release predates keelbox completion.
  end

  test do
    assert_match "keelbox v#{version} ", shell_output("#{bin}/keelbox version")
  end
end
