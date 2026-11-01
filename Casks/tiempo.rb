cask "tiempo" do
  version "1.0"
  sha256 "b9bc08b86bb340066a8d976d73aaf24a2720898df0a3de24a038f3fdf8d55966"

  url "https://github.com/blackboxprojects/tiempo/releases/download/v#{version}/tiempo-#{version}.dmg"
  name "tiempo"
  desc "Menu bar world clock"
  homepage "https://github.com/blackboxprojects/tiempo"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "tiempo.app"

  # tiempo is signed ad hoc, not notarized, so macOS would block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/tiempo.app"]
  end

  uninstall quit: "app.tiempo"

  zap trash: "~/Library/Preferences/app.tiempo.plist"
end
