local clock = sbar.add("item", "clock", {
  position = "right",
  label = "0:00",
  update_freq = 2,
  click_script = "open -a Calendar"
})

clock:subscribe({ "forced", "routine", "system_woke" }, function()
  local time = os.date("%a %d %H:%M")
  clock:set({ label = time })
end)
