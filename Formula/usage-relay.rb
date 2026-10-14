class UsageRelay < Formula
  desc "Publishes Claude Code and Codex usage for the AI·mana iPhone app"
  homepage "https://github.com/p4ranoic0/AI-mana"
  license "MIT"

  # The macOS tarball is a universal binary (arm64 and x86_64).
  on_macos do
    on_arm do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.2.0/usage-relay-1.2.0-macos-universal.tar.gz"
      sha256 "ce0c472361758af2db1384090d8c9ec8eaec8cb94dd9be77148b7f011224d884"
    end
    on_intel do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.2.0/usage-relay-1.2.0-macos-universal.tar.gz"
      sha256 "ce0c472361758af2db1384090d8c9ec8eaec8cb94dd9be77148b7f011224d884"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.2.0/usage-relay-1.2.0-linux-x86_64.tar.gz"
      sha256 "db07d17b9a41cb87ee8f1706ba21d2aca58d1169a8674da79d2d7aa70ead5922"
    end
    on_arm do
      url "https://github.com/p4ranoic0/AI-mana/releases/download/v1.2.0/usage-relay-1.2.0-linux-aarch64.tar.gz"
      sha256 "c8631d58c8d56066096d261c62ee73522ddd75b3c9c454d2892feaee33ec4fdb"
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
