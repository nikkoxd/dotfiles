local colors = require("colors")

sbar.add("event", "aerospace_workspace_change")

sbar.exec("aerospace list-workspaces --all", function(spaces)
	for name in spaces:gmatch("[^\r\n]+") do
		local space = sbar.add("item", "space." .. name, {
			position = "left",
			padding_left = 0,
			padding_right = 5,
			label = {
				string = name,
				align = "center",
				width = 25,
				color = colors.text.normal,
			},
			background = {
				drawing = true,
				color = colors.workspace.unfocused,
				corner_radius = 5,
			},
		})

		space:subscribe("mouse_clicked", function()
			sbar.exec("aerospace workspace " .. name)
		end)

    local update = function(env)
			focused = env.FOCUSED_WORKSPACE
			if name == focused then
				sbar:animate("circ", 15, function()
					space:set({
						drawing = "on",
						label = {
              string = name,
              width = 35,
              color = colors.text.focused
            },
						background = { color = colors.workspace.focused },
					})
				end)
			else
				sbar.exec("aerospace list-windows --workspace " .. name, function(windows)
					local count = select(2, windows:gsub("[^\r\n]+", ""))
					if count == 0 then
						sbar:animate("circ", 15, function()
							space:set({
								drawing = "on",
								label = {
                  string = name,
                  width = 25,
                  color = colors.text.normal
                },
								background = { color = colors.workspace.unfocused },
							})
						end)
					else
            sbar:animate("circ", 15, function()
              space:set({
                drawing = "on",
                label = {
                  string = name,
                  width = 25,
                  color = colors.text.has_windows
                },
                background = { color = colors.workspace.has_windows },
              })
            end)
					end
				end)
			end
    end

		space:subscribe("aerospace_workspace_change", update)

    update({
      FOCUSED_WORKSPACE = 1
    })
	end
end)
