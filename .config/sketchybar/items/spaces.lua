local colors = require("colors")
local icons = require("icons")

sbar.add("event", "aerospace_workspace_change")

sbar.exec("aerospace list-workspaces --all", function(spaces)
	for name in spaces:gmatch("[^\r\n]+") do
		local space = sbar.add("item", "space." .. name, {
			position = "left",
			label = name,
			icon = {
				string = icons.active_workspace,
			},
		})

		space:subscribe("aerospace_workspace_change", function(env)
			focused = env.FOCUSED_WORKSPACE
			if name == focused then
				space:set({
					drawing = "on",
					label = { color = colors.icon },
					icon = { drawing = "on" },
				})
			else
				---@param windows string
				sbar.exec("aerospace list-windows --workspace " .. name, function(windows)
					local count = select(2, windows:gsub("[^\r\n]+", ""))
					if count == 0 then
						space:set({ drawing = "off" })
					else
						space:set({
							drawing = "on",
							label = { color = colors.text },
							icon = { drawing = "off" },
						})
					end
				end)
			end
		end)
	end
end)
