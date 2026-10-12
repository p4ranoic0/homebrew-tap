#!/usr/bin/env python3
"""Point Formula/usage-relay.rb at an AI·mana release.

Usage: Scripts/update-formula.py [TAG]   (default: the latest release)
Reads the release's SHA256SUMS.txt and rewrites every url/sha256 pair.
Prints the new version, or nothing when the formula is already current.
"""
import json, pathlib, re, sys, urllib.request

REPO = "p4ranoic0/AI-mana"
FORMULA = pathlib.Path(__file__).resolve().parent.parent / "Formula" / "usage-relay.rb"


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": "homebrew-tap-updater"})
    with urllib.request.urlopen(request, timeout=60) as response:
        return response.read().decode()


tag = sys.argv[1] if len(sys.argv) > 1 else json.loads(
    fetch(f"https://api.github.com/repos/{REPO}/releases/latest"))["tag_name"]
if not re.fullmatch(r"v\d+\.\d+\.\d+", tag):
    sys.exit(f"Unexpected tag: {tag}")
version = tag[1:]

sums = {}
for line in fetch(f"https://github.com/{REPO}/releases/download/{tag}/SHA256SUMS.txt").splitlines():
    digest, name = line.split()
    sums[name.removeprefix("./")] = digest

url_pattern = re.compile(
    r'url "https://github\.com/' + re.escape(REPO) +
    r'/releases/download/v[^/]+/usage-relay-[^-]+-([a-z0-9_-]+)\.tar\.gz"')
lines = FORMULA.read_text().splitlines(keepends=True)
old = "".join(lines)
pending = None
for index, line in enumerate(lines):
    match = url_pattern.search(line)
    if match:
        asset = f"usage-relay-{version}-{match.group(1)}.tar.gz"
        if asset not in sums:
            sys.exit(f"{asset} is missing from {tag}/SHA256SUMS.txt")
        lines[index] = line[:match.start()] + \
            f'url "https://github.com/{REPO}/releases/download/{tag}/{asset}"' + line[match.end():]
        pending = sums[asset]
    elif pending and line.strip().startswith("sha256 "):
        lines[index] = re.sub(r'sha256 "[0-9a-f]{64}"', f'sha256 "{pending}"', line)
        pending = None
if pending:
    sys.exit("A url line has no sha256 line after it")

new = "".join(lines)
if new != old:
    FORMULA.write_text(new)
    print(version)
