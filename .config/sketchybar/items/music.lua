local icons = require("icons")

local music = sbar.add("item", "music", {
	position = "center",
	label = {
		string = "Nothing is playing",
    max_chars = 75,
    scroll_duration = 200,
	},
  scroll_texts = true,
	update_freq = 2,
})

music:subscribe({ "forced", "routine", "system_woke" }, function()
	sbar.exec("media-control get", function(info)
		if info.playing then
      local artist = info.artist
      local title = info.title
			music:set({
				drawing = "on",
				label = {
					string = artist .. " - " .. title,
				},
			})
		else
			music:set({
				drawing = "off",
			})
		end
	end)
end)
