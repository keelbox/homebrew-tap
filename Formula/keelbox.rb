# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.11/keelbox-darwin-arm64"
      sha256 "20109a48d2e832de73b775131cf1b5a749ac94a81ad1a62856f403ac30fdafab"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.11/keelbox-darwin-amd64"
      sha256 "719ebf671f1fd53102051f8d6b54938dfcf87c336e21e413a062e971d4120db9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.11/keelbox-linux-arm64"
      sha256 "d6930e9e5ab39656bd14b524a9a259776ff2d4d8b4338ca354a4c2f4a38dc768"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.11/keelbox-linux-amd64"
      sha256 "1b4efcf5962efe948ca8080f0322d220c8cb5fa8851d4d6bfa8c55a5b542c8e9"
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
