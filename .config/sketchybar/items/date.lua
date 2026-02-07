local date = {
	weekday = sbar.add("item", "date.weekday", {
		label = "Sun",
		position = "left",
		update_freq = 30,
		click_script = "open -a Calendar",
	}),
	day = sbar.add("item", "date.day", {
		label = "01",
		position = "left",
		update_freq = 30,
		click_script = "open -a Calendar",
	}),
	month = sbar.add("item", "date.month", {
		label = "Dec",
		position = "left",
		update_freq = 30,
		click_script = "open -a Calendar",
	}),
}

date.weekday:subscribe({ "forced", "routine", "system_woke" }, function()
  local weekday = os.date("%a")
  date.weekday:set({ label = weekday })
end)

date.day:subscribe({ "forced", "routine", "system_woke" }, function()
  local day = os.date("%d")
  date.day:set({ label = day })
end)

date.month:subscribe({ "forced", "routine", "system_woke" }, function()
  local month = os.date("%b")
  date.month:set({ label = month })
end)
