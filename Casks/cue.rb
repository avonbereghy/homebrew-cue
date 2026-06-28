cask "cue" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.3"
  sha256 arm:   "a96691fd2196acf964d63eee36d59715d1b7b5eb765d31e1550b2e2b7b7bcf72",
         intel: "67d97172cd07cd3cd2ab4d69a6a78cde00a0a012e2975fc608f559cb28c7c199"

  url "https://github.com/avonbereghy/cue/releases/download/v#{version}/Cue_#{version}_#{arch}.dmg"
  name "Cue"
  desc "Real-time menu-bar monitor for Claude Code sessions"
  homepage "https://github.com/avonbereghy/cue"

  # Cue updates itself in place via the Tauri updater, so Homebrew should not try
  # to manage upgrades; it only delivers the initial install.
  auto_updates true
  depends_on macos: :sonoma

  app "Cue.app"

  zap trash: [
    "~/Library/Application Support/com.cueapp.desktop",
    "~/Library/Caches/com.cueapp.desktop",
    "~/Library/HTTPStorages/com.cueapp.desktop",
    "~/Library/Preferences/com.cueapp.desktop.plist",
    "~/Library/Saved Application State/com.cueapp.desktop.savedState",
    "~/Library/WebKit/com.cueapp.desktop",
  ]

  caveats <<~CAVEATS
    Cue is a free, open-source app and is not signed with an Apple Developer ID,
    so macOS Gatekeeper blocks it on first launch. Clear the quarantine flag once:

      xattr -dr com.apple.quarantine "#{appdir}/Cue.app"

    On first launch Cue's onboarding wizard installs its Claude Code hook into
    ~/.claude (a backup of your settings is kept). It then keeps itself up to
    date automatically.
  CAVEATS
end
