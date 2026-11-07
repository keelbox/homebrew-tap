# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.1.0-rc.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0-rc.3/keelbox-darwin-arm64"
      sha256 "214e6709c0602adb3daf3e965cda8dc14d5bcb884d4c21857ca71ce57c928c5f"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0-rc.3/keelbox-darwin-amd64"
      sha256 "ded52ac0f9601f75125d2bcad3df40592f60291552729375b0d794471a827a4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0-rc.3/keelbox-linux-arm64"
      sha256 "bdccc83b9f44824e831f989ce5abb02b1c5bc2fdffa60277aec9fb5a696d94d9"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.1.0-rc.3/keelbox-linux-amd64"
      sha256 "96593cf2390d50c9a8a41c724529adcd905e91edfee759d4ba92c5b5c3e69dd7"
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
