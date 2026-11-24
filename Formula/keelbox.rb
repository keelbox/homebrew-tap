# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.1.1/keelbox-darwin-arm64"
      sha256 "d6bad83830860bc057ec1f2b03f930c1db3e03df32fc87bc68ad46c9ade88730"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.1.1/keelbox-darwin-amd64"
      sha256 "92e548a46d78e55687a1b136c926a92ad2b718f3ca08fa6745444b506e4e9006"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.1.1/keelbox-linux-arm64"
      sha256 "d5ef9897271782ebd279170e334aa60eb198c13e30c3eb028ed9c08e3e189139"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.1.1/keelbox-linux-amd64"
      sha256 "95e4d475abe28fea164ee054e2e34fc324a5c313dcb656fdddbe42850cecd557"
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
