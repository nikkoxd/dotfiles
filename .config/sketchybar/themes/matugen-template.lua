local theme = {}

theme.bar = {
  bg = 0xe6{{ colors.background.default.hex_stripped }},
  border = 0x66{{ colors.outline.default.hex_stripped }},
}

theme.item = {
  bg = 0xff{{ colors.surface_container_high.default.hex_stripped }},
}

theme.workspace = {
  focused = 0xff{{ colors.primary.default.hex_stripped }},
  has_windows = 0xff{{ colors.primary_container.default.hex_stripped }},
  unfocused = 0x00000000,
}

theme.text = {
  normal = 0xff{{ colors.on_surface.default.hex_stripped }},
  has_windows = 0xff{{ colors.on_primary_container.default.hex_stripped }},
  focused = 0xff{{ colors.on_primary.default.hex_stripped }},
}

theme.icon = 0xff{{ colors.primary.default.hex_stripped }}

return theme
