cask "cue" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "cdb29f52033b40b37b330309393045952e5b576e614ed8ca3ada0c2640a3f0f2",
         intel: "0346871227da65510e169168fcb75d833065ce6a2467aa4c223aab59af79909f"

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
