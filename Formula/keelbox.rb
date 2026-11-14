# Written by scripts/homebrew-formula.sh in keelbox/keelbox from the
# release's signed SHA256SUMS; publish.sh replaces it on every release.
class Keelbox < Formula
  desc "Set up an Ubuntu machine as a box for AI coding agents"
  homepage "https://keelbox.dev"
  version "0.2.0-rc.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.5/keelbox-darwin-arm64"
      sha256 "5b6213a0e36c1ec0edde4398fe0ea701dce9b87f1fd707430a70e15043a7cafa"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.5/keelbox-darwin-amd64"
      sha256 "44a6c29162cc7bb90090deb0cdeb1d825d60bcc9717ea379de283aff65efd11a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.5/keelbox-linux-arm64"
      sha256 "36828c99b7d854e4b3b45c9b362338d5a9c8e58889afff97485b468925c40d9c"
    end
    on_intel do
      url "https://github.com/keelbox/releases/releases/download/v0.2.0-rc.5/keelbox-linux-amd64"
      sha256 "543085dd70be8c3ec95581d068feb62bc11fd0d1f7017e8da494e17057c9e996"
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
