# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.4/keelbox-darwin-arm64"
      sha256 "35d9ec17dbc5106fd1b67fb63d9579436bb4ae20bb946bce6481aea3af0308aa"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.4/keelbox-darwin-amd64"
      sha256 "067b610157b6db3570d1b61f4d5520855d7fa129c2ebdf4f54c50c1d751ad116"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.4/keelbox-linux-arm64"
      sha256 "7a01c134cd8ad4503ff2fc461c0e0ae5bd6d2b57374b4216621b9a57ec5e778c"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.4/keelbox-linux-amd64"
      sha256 "f67613022878445478751e62cdb88225f18f81631bd19a50795991e4c7976fe2"
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
