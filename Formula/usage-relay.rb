class UsageRelay < Formula
  desc "Publishes Claude Code and Codex usage for the AI·mana iPhone app"
  homepage "https://github.com/p4ranoic0/AI-mana"
  license "MIT"

  # The macOS tarball is a universal binary (arm64 and x86_64).
  on_macos do
    on_arm do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.1.1/usage-relay-1.1.1-macos-universal.tar.gz"
      sha256 "91819d83caa42e51c4e05eee3c6c8caaa5d1d51b669fd728587d103b59a3e7c4"
    end
    on_intel do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.1.1/usage-relay-1.1.1-macos-universal.tar.gz"
      sha256 "91819d83caa42e51c4e05eee3c6c8caaa5d1d51b669fd728587d103b59a3e7c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.1.1/usage-relay-1.1.1-linux-x86_64.tar.gz"
      sha256 "d6acdd168e24cecf3ad6316421320304a0e7d1e1af26362fad3a7c794b24ebc4"
    end
    on_arm do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.1.1/usage-relay-1.1.1-linux-aarch64.tar.gz"
      sha256 "c90dee01fe065d4a22e292ce21ed747a6d7afc7d44169357aac153421e0a7950"
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
