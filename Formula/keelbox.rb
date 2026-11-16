# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.9/keelbox-darwin-arm64"
      sha256 "6184b9c960a1a1823d817d38164f262975d187932559009e7a2a7669dbe65784"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.9/keelbox-darwin-amd64"
      sha256 "15593d55c22502b09c22f0ca7dac42c8f72ca3793e959db6194b50dd69873483"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.9/keelbox-linux-arm64"
      sha256 "e1c75e44a7ff779533905188bbbb9cc6bbd06335b7a0604ea382cf2d13ef1f79"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.9/keelbox-linux-amd64"
      sha256 "48f0fe6e0866d436ae9a6bf495224032f454fcc6b0fbb1dcc400993dc45b563c"
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
