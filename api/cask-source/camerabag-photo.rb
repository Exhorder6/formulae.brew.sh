cask "camerabag-photo" do
  version "2021.5.0"
  sha256 "50eeca460c8425604daa9e9032c1ddb331fee802118066a282c048d1954dd874"

  url "https://nevercenter.com/camerabag/download/filearchive/Install_CameraBag_Photo_#{version.dots_to_underscores}_mac.dmg"
  name "CameraBag"
  desc "Filter and edit photos"
  homepage "https://nevercenter.com/camerabag/photo/"

  livecheck do
    url "https://nevercenter.com/camerabag/download/?filetype=mac"
    regex(/href=.*?Install[._-]?CameraBag[._-]?Photo[._-]?v?(\d+(?:[._]\d+)+)[._-]?mac\.dmg/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match[0].tr("_", ".") }
    end
  end

  depends_on macos: ">= :catalina"

  app "CameraBag Photo.app"

  zap trash: "~/Library/Saved Application State/com.nevercenter.camerabagphoto.savedState"
end
