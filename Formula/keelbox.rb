# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.8/keelbox-darwin-arm64"
      sha256 "4d9ebb55c298a39b1ecfde1c17a7fb5862a01c84618a3067ac4e16a23075d2c4"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.8/keelbox-darwin-amd64"
      sha256 "4e41252b72dbca346bcb52c38cc7d45079c8d90f4774d8d4a296231eec8bb433"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.8/keelbox-linux-arm64"
      sha256 "46f75b432add9b89c1bbf9321fe399a9d3caac1d7e1c73968c4a5ea5bb8339c1"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.8/keelbox-linux-amd64"
      sha256 "37cf063ad1561907b257e54a14cb81bdcc19dd0fc648e4bd482bcd4445e2cce3"
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
