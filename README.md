# homebrew-tiempo

Homebrew tap for [tiempo](https://github.com/blackboxprojects/tiempo), a world clock for your Mac's menu bar.

```bash
brew install --cask blackboxprojects/tiempo/tiempo
```

Requires a Mac with Apple silicon and macOS 14 Sonoma or later.

## Updating the cask for a new release

1. In the tiempo repo, bump `CFBundleShortVersionString` in `Info.plist`, run `./scripts/release.sh`, and publish the DMG as release `v<version>`.
2. Here, set `version` and `sha256` in `Casks/tiempo.rb` (the release script prints the SHA-256), then commit and push.
