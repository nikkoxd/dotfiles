local icons = require("icons")

sbar.add("event", "bluetooth_change", "com.apple.bluetooth.status")

local airpods = sbar.add("item", "airpods", {
	position = "right",
	label = {
		string = "100%",
		width = 0,
	},
	icon = {
		drawing = "on",
		string = icons.airpods.both,
		padding_right = 0,
	},
})

airpods:subscribe({ "mouse.entered" }, function()
	sbar:animate("circ", 15, function()
		airpods:set({
			label = { width = "dynamic" },
			icon = { padding_right = 5 },
		})
	end)
end)

airpods:subscribe({ "mouse.exited" }, function()
	sbar:animate("circ", 15, function()
		airpods:set({
			label = { width = 0 },
			icon = { padding_right = 0 },
		})
	end)
end)

airpods:subscribe({ "forced", "bluetooth_change" }, function()
	sbar.exec("system_profiler SPBluetoothDataType -json -detailLevel basic", function(data)
		local connected = data.SPBluetoothDataType[1].device_connected

		for _, device in ipairs(connected) do
			for device_name, device_info in pairs(device) do
				if device_info.device_minorType == "Headphones" and device_name:match("AirPods") then
					local left = tonumber(device_info.device_batteryLevelLeft:match("(%d+)"))
					local right = tonumber(device_info.device_batteryLevelRight:match("(%d+)"))

					local label = ""
					local icon = icons.airpods.both

					if left and right then
						if left < right then
							label = tostring(left)
						else
							label = tostring(right)
						end
					elseif left then
						label = tostring(left)
						icon = icons.airpods.left
					else
						label = tostring(right)
						icon = icons.airpods.right
					end

					airpods:set({
						label = label .. "%",
						icon = { string = icon },
					})
				end
			end
		end
	end)
end)
