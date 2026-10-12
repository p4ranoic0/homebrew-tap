class UsageRelay < Formula
  desc "Publishes Claude Code and Codex usage for the AI·mana iPhone app"
  homepage "https://github.com/p4ranoic0/AI-mana"
  license "MIT"

  # The macOS tarball is a universal binary (arm64 and x86_64).
  on_macos do
    on_arm do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.1.0/usage-relay-1.1.0-macos-universal.tar.gz"
      sha256 "b4b806f85b8ba4e622525e45058775679671ccc77d3d7303713e24f732f9f3e3"
    end
    on_intel do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.1.0/usage-relay-1.1.0-macos-universal.tar.gz"
      sha256 "b4b806f85b8ba4e622525e45058775679671ccc77d3d7303713e24f732f9f3e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.1.0/usage-relay-1.1.0-linux-x86_64.tar.gz"
      sha256 "24f2eb0945e20bc123cee4ca6993a0027074b942458e385cd78c95493f584700"
    end
    on_arm do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.1.0/usage-relay-1.1.0-linux-aarch64.tar.gz"
      sha256 "0f5f8214396567e7b1fe132dddb2bd05f03127e634a8e5ece71ceef2727e89e9"
    end
  end

  def install
    bin.install "usage-relay"
  end

  def caveats
    <<~EOS
      Publish your usage to a synced folder and choose that file in AI·mana on iPhone or iPad:
        usage-relay run --output /path/to/synced/usage-relay.json
      On Linux the binary needs the system libcurl (Ubuntu: apt install libcurl4).
    EOS
  end

  test do
    assert_equal "usage-relay #{version}", shell_output("#{bin}/usage-relay --version").strip
  end
end
