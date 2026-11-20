# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.10/keelbox-darwin-arm64"
      sha256 "a5b37be33e47d97e70d03a899aad749141efba40d3387e662d38463b28716570"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.10/keelbox-darwin-amd64"
      sha256 "93753e6395ddfee23fb3d04b0eab54f5b654fbb3701676ec61f14a02adb1a198"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.10/keelbox-linux-arm64"
      sha256 "997b14ce91f18ba22fe8be58fa482dfaa40db82479fb64fe08fa4b85cee6a7fd"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.10/keelbox-linux-amd64"
      sha256 "2ff6d24be08819ff40dd858588cdfc7c275954d3cc9852697bd703ac71860883"
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
