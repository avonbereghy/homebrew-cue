cask "cue" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "41594fe33af26bc839b50273aa9d079de7cbd1291a23f8864975ca5fc30994c0",
         intel: "656b25a59e65e6f818cf8a8577fbf7b9db3af7343e6e8fba148515001bb594bd"

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
