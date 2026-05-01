local kblayout = sbar.add("item", "kblayout.label", {
	position = "right",
	icon = {
    drawing = true,
    font = {
      family = "Noto Color Emoji",
    },
    padding_right = 0,
  },
  label = {
    drawing = false,
  },
	update_freq = 2,
})

kblayout:subscribe({ "routine", "system_woke", "power_source_change" }, function()
	local plistDir = "~/Library/Preferences/com.apple.HIToolbox.plist"
	local plistKey = "AppleSelectedInputSources"
	---@param contents string
	sbar.exec("defaults read " .. plistDir .. " " .. plistKey, function(contents)
		local layout = contents:match('"KeyboardLayout Name"%s*=%s*([^;]+);')

		if layout then
			if layout == "Russian" then
				layout = "🇷🇺"
			elseif layout == "ABC" then
				layout = "🇬🇧"
			end
			kblayout:set({ icon = { string = layout } })
		end
	end)
end)
