-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local home = wezterm.home_dir
local config = wezterm.config_builder()

wezterm.add_to_config_reload_watch_list(home .. "/.cache/wal/colors-wezterm.toml")

config.audible_bell = "Disabled"

config.font = wezterm.font_with_fallback({ "MesloLGS Nerd Font", "SF Pro" })
config.font_size = 16
config.line_height = 1.1

config.color_scheme_dirs = { home .. "/.cache/wal" }
config.color_scheme = "colors-wezterm"

config.enable_tab_bar = false

config.window_background_opacity = 0.8

config.window_decorations = "RESIZE"

return config
