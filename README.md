# homebrew-cue

A [Homebrew](https://brew.sh) tap for **[Cue](https://github.com/avonbereghy/cue)** — a
real-time menu-bar monitor for Claude Code sessions (macOS).

## Install

```sh
brew install --cask avonbereghy/cue/cue
```

That one command taps this repo and installs the latest Cue. Equivalently:

```sh
brew tap avonbereghy/cue
brew install --cask cue
```

### First launch (Gatekeeper)

Cue is free and open-source and is **not signed with an Apple Developer ID**, so
macOS Gatekeeper blocks it the first time. Clear the quarantine flag once:

```sh
xattr -dr com.apple.quarantine "/Applications/Cue.app"
```

(`brew` also prints this in the cask caveats after install.)

## Updating

Cue updates **itself** in place via its built-in updater, so the cask is marked
`auto_updates true` — Homebrew only delivers the initial install and won't fight
the app's own updater. To force Homebrew to re-fetch the newest packaged build:

```sh
brew upgrade --cask cue --greedy
```

## Uninstall

```sh
brew uninstall --cask cue          # remove the app
brew uninstall --zap --cask cue    # also remove app data/preferences
```

## How this tap stays current

The cask is generated, never hand-edited. When a new Cue release is published,
a GitHub Action in the main repo
([`update-homebrew-tap.yml`](https://github.com/avonbereghy/cue/blob/main/.github/workflows/update-homebrew-tap.yml))
re-runs [`render-cask.sh`](https://github.com/avonbereghy/cue/blob/main/scripts/homebrew/render-cask.sh)
with the new version and the two macOS `.dmg` hashes and pushes the updated
`Casks/cue.rb` here.

## License

MIT — see [LICENSE](LICENSE).
