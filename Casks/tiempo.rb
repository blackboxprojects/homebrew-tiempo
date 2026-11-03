cask "tiempo" do
  version "1.1"
  sha256 "8158ac7eaeb977445be2c7de111b9bb6ed0eedaa93233d02afaaf0e3c105222e"

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
