local colors = require("colors")

local apps = {
  ["com.apple.Music"] = {
    whitelisted = true,
    scale = 0.07
  },
  ["com.spotify.client"] = {
    whitelisted = true,
    scale = 0.07
  },
  ["ru.yandex.desktop.music"] = {
    whitelisted = true,
    scale = 0.25
  },
}

local music = sbar.add("item", "music", {
	position = "right",
	background = {
		color = 0x00ffffff,
		image = {
			scale = 0.25,
			border_color = colors.bar.border,
			border_width = 1,
			corner_radius = 10,
		},
	},
	label = {
		string = "123",
		color = 0x00ffffff,
	},
  update_freq = 2,
})

music:subscribe({ "forced", "routine", "system_woke" }, function()
	sbar.exec("media-control get", function(info)
		if apps[info.bundleIdentifier].whitelisted then
			if info.playing then
				artworkBase64 = info.artworkData
				tmpDir = "/tmp/cover.jpeg"

				if artworkBase64 then
					sbar.exec("echo " .. artworkBase64 .. " | base64 -D >" .. tmpDir, function()
						music:set({
              drawing = "on",
							background = {
								image = tmpDir,
                scale = apps[info.bundleIdentifier].scale,
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
