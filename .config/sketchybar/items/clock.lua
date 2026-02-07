local clock = sbar.add("item", "clock", {
  position = "left",
  label = "0:00",
  update_freq = 2,
  click_script = "open -a Calendar"
})

clock:subscribe({ "forced", "routine", "system_woke" }, function()
  local time = os.date("%H:%M")
  clock:set({ label = time })
end)
