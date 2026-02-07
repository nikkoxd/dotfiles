local colors = require("colors")

sbar.add("event", "music_change", "com.apple.Music.playerInfo")

local music = sbar.add("item", "music", {
	position = "right",
	background = {
		color = 0x00ffffff,
		image = {
			scale = 0.07,
			border_color = colors.bar.border,
			border_width = 1,
			corner_radius = 10,
		},
	},
	label = {
		string = "123",
		color = 0x00ffffff,
	},
})

music:subscribe({ "forced", "music_change" }, function()
	sbar.exec("media-control get", function(info)
		if info.isMusicApp then
			if info.playing then
				artworkBase64 = info.artworkData
				tmpDir = "/tmp/cover.jpeg"

				if artworkBase64 then
					sbar.exec("echo " .. artworkBase64 .. " | base64 -D >" .. tmpDir, function()
						music:set({
              drawing = "on",
							background = {
								image = tmpDir,
							},
						})
					end)
				end
			else
				music:set({
          drawing = "off",
				})
			end
		end
	end)
end)
