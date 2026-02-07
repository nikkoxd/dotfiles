local kblayout = sbar.add("item", "kblayout.label", {
	position = "right",
	label = "EN",
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
				layout = "РУ"
			elseif layout == "ABC" then
				layout = "EN"
			end
			kblayout:set({ label = layout })
		end
	end)
end)
