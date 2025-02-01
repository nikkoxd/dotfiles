local space_icons = {
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
}

for i, icon in ipairs(space_icons) do
  local space = sbar.add("space", "space." .. i, {
    space = i,
    padding_left = 0,
    padding_right = 0,
    icon = {
      string = icon,
      highlight_color = "#f5f5f5",
    },
    width = 30,
    label = {
      drawing = "off",
    },
  })
end
