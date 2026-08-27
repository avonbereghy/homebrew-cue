cask "cue" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.1"
  sha256 arm:   "58d8670f424bea92f72f14ff49f6c3a7d7ed6ad6237b1c78a52dab8a4e2577ff",
         intel: "aecc596f7d313c2f73b0bcde6bc27069b9c6fdd0cde695db3d116f1865864620"

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
