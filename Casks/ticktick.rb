cask "ticktick" do
  version "4.0.00,184"
  sha256 "59dfccecac12f126bab22348b8a4d75ef2e3c6144824b53a26236cf0df1a05a5"

  url "https://appest-public.s3.amazonaws.com/download/mac/TickTick_#{version.before_comma}_#{version.after_comma}.dmg",
      verified: "appest-public.s3.amazonaws.com/"
  name "TickTick"
  desc "To-do & task list manager"
  homepage "https://www.ticktick.com/home"

  livecheck do
    url "https://www.ticktick.com/static/getApp/download?type=mac"
    strategy :header_match do |headers|
      match = headers["location"].match(/TickTick[._-]v?(\d+(?:\.\d+)+)[_-](\d+)\.dmg/i)
      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "TickTick.app"

  zap trash: [
    "~/Library/Application Scripts/com.TickTick.task.mac.MainWidget",
    "~/Library/Application Scripts/com.TickTick.task.mac.TickTick-Safari-Extension",
    "~/Library/Application Scripts/com.TickTick.task.mac.TickTick-Today-Widget",
    "~/Library/Application Scripts/com.TickTick.task.mac.TickTick-WidgetConfiguration-Extension",
    "~/Library/Application Support/com.TickTick.task.mac",
    "~/Library/Caches/TickTick",
    "~/Library/Caches/com.TickTick.task.mac",
    "~/Library/Containers/com.TickTick.task.mac.MainWidget",
    "~/Library/Containers/com.TickTick.task.mac.TickTick-Safari-Extension",
    "~/Library/Containers/com.TickTick.task.mac.TickTick-Today-Widget",
    "~/Library/Containers/com.TickTick.task.mac.TickTick-WidgetConfiguration-Extension",
    "~/Library/Group Containers/75TY9UT8AY.com.TickTick.task.mac",
    "~/Library/Preferences/com.TickTick.task.mac.plist",
    "~/Library/Saved Application State/com.TickTick.task.mac.savedState",
  ]
end
