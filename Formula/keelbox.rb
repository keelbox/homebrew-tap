# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.3/keelbox-darwin-arm64"
      sha256 "427478ca1aa2823561816327b06e33ff4a63f544207a638cae6d9ec67999d0ed"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.3/keelbox-darwin-amd64"
      sha256 "3170a248e0730df49107b43062630fd6993fb6d413ba1818d86f0148bae596e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.3/keelbox-linux-arm64"
      sha256 "3ac01a4e2bda9d886da017cd5c842ef1b038f0467975e640e9d94c940d6116a0"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.3/keelbox-linux-amd64"
      sha256 "5cfc352212991c50e21c7cfdcaa9a0105d5e4b0ed53b4091a5ab26024bb0410a"
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
