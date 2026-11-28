# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.2/keelbox-darwin-arm64"
      sha256 "48aea4d67ce37e40b0db39b80f4967d02e9b52161b49baeffa231380d87989e9"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.2/keelbox-darwin-amd64"
      sha256 "fe784b324092811d4039b0e3917aaff0c648356988d2efc0e0236b3b282bd1f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.2/keelbox-linux-arm64"
      sha256 "7401602df76c86dce5c9033932843eb8dccc590d9146496f0f39aca8a3b78602"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.2/keelbox-linux-amd64"
      sha256 "a75d874adcd6d6ce0d0d08ffd87e2b6d0ea4a981e6a3b882320ce288e2fa1902"
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
