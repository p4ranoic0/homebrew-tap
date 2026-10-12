# Homebrew tap for AI·mana

```sh
brew install p4ranoic0/tap/usage-relay
```

`usage-relay` publishes your Claude Code and Codex usage to a file that the
[AI·mana](https://github.com/p4ranoic0/AI-mana) app reads on iPhone, iPad and Apple Watch.
The formula installs the prebuilt binaries from the
[AI·mana releases](https://github.com/p4ranoic0/AI-mana/releases) (macOS universal, Linux x86_64 and aarch64).

```sh
usage-relay run --output /path/to/synced/usage-relay.json
```

The formula follows the AI·mana releases on its own: a daily workflow points it at the newest release,
installs and tests it on macOS, and commits the change. Run it by hand from the Actions tab (`update`) right
after a release.

The Mac menu bar app is not in this tap yet. Build it from the main repository.
