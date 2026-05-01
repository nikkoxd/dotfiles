local icons = require("icons")

local battery = sbar.add("item", "battery", {
	position = "right",
	label = {
    string = "100%",
    width = 0,
  },
  icon = {
    drawing = true,
    string = icons.battery._100,
    font = { size = 18 }
  },
	update_freq = 2,
})

battery:subscribe({ "mouse.entered" }, function()
	sbar:animate("circ", 15, function()
		battery:set({
			label = { width = "dynamic" },
			icon = { padding_right = 5 },
		})
	end)
end)

battery:subscribe({ "mouse.exited" }, function()
	sbar:animate("circ", 15, function()
		battery:set({
			label = { width = 0 },
			icon = { padding_right = 0 },
		})
	end)
end)

battery:subscribe({ "routine", "system_woke", "power_source_change" }, function()
	---@param info string
	sbar.exec("pmset -g batt", function(info)
		local icon = icons.battery._100
		local label = ""

		local found, _, charge = info:find("(%d+)%%")
		if found then
			charge = tonumber(charge)
			label = tostring(charge)
		end

    if charge == 100 then
      icon = icons.battery._100
    elseif charge > 75 then
      icon = icons.battery._75
    elseif charge > 50 then
      icon = icons.battery._50
    elseif charge > 25 then
      icon = icons.battery._25
    elseif charge > 0 then
      icon = icons.battery._0
    end

		local charging = info:find("AC Power")
		if charging then
			icon = icons.battery.charging
		end

		battery:set({
			label = label .. "%",
			icon = { string = icon },
		})
	end)
end)
