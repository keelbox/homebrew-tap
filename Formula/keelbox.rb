# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.6/keelbox-darwin-arm64"
      sha256 "3f9198d90e69852b56c69b2d52f482054a38435825b90e70eb0a58e288394e52"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.6/keelbox-darwin-amd64"
      sha256 "8446fa5eba673797d88bdd925fc79106d13b63f9de71bd26bc3320cf356d4b2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.6/keelbox-linux-arm64"
      sha256 "29b5ede7a867a00ae0e8c011ae7ec43449404145ea0d01f75a502b08e2a608d1"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.6/keelbox-linux-amd64"
      sha256 "d1c46a38fa08fb06b2384348e3d3f3453d52f358584660429cc66adae27f60a8"
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
