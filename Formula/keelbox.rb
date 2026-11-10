# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.2/keelbox-darwin-arm64"
      sha256 "0115d720d19942804e67424f2b59554f10dcdf4249c1c34d96e0445df68da0e5"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.2/keelbox-darwin-amd64"
      sha256 "e51f571b60e5ac99f6893487bd68f6331811c71d35f202a36223c649efa2da8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.2/keelbox-linux-arm64"
      sha256 "07c91ca01004e906b10b391379d2634aacffe437d734439a39741b2bd7f8b2a0"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.2/keelbox-linux-amd64"
      sha256 "7820f2f423324467ef894bd19fc2d224492367601b73f80fc3ff95d7dbe42e75"
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
