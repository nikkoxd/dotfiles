local icons = require("icons")

local battery = sbar.add("item", "battery", {
	position = "right",
	label = "100",
	icon = {
		drawing = "off",
	},
	update_freq = 2,
})

battery:subscribe({ "routine", "system_woke", "power_source_change" }, function()
	---@param info string
	sbar.exec("pmset -g batt", function(info)
		local icon = ""
		local drawing = "off"
		local label = ""

		local found, _, charge = info:find("(%d+)%%")
		if found then
			charge = tonumber(charge)
			label = tostring(charge)
		end

		local charging = info:find("AC Power")
		if charging then
			drawing = "on"
			icon = icons.charging
		end

		battery:set({
			label = label,
			icon = { drawing = drawing, string = icon },
		})
	end)
end)
