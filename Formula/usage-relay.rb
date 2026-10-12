class UsageRelay < Formula
  desc "Publishes Claude Code and Codex usage for the AI·mana iPhone app"
  homepage "https://github.com/p4ranoic0/AI-mana"
  license "MIT"

  # The macOS tarball is a universal binary (arm64 and x86_64).
  on_macos do
    on_arm do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.0.0/usage-relay-1.0.0-macos-universal.tar.gz"
      sha256 "7b6c97556dec901edd3f6f4880ba7e793d09142d2a90177e28825fffd6e96d45"
    end
    on_intel do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.0.0/usage-relay-1.0.0-macos-universal.tar.gz"
      sha256 "7b6c97556dec901edd3f6f4880ba7e793d09142d2a90177e28825fffd6e96d45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.0.0/usage-relay-1.0.0-linux-x86_64.tar.gz"
      sha256 "c823916df9e482b2013f31232676315936eeffa900d5f92c2a7cb39bcdeb7cee"
    end
    on_arm do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.0.0/usage-relay-1.0.0-linux-aarch64.tar.gz"
      sha256 "060f1f3296fa048d73bc7b0d97579e4703b5378c56cafaa3689370610eefba84"
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
