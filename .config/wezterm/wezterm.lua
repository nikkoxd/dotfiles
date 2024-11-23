-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local home = wezterm.home_dir
local config = wezterm.config_builder()

wezterm.add_to_config_reload_watch_list(home .. "/.cache/wal/colors-wezterm.toml")

config.audible_bell = "Disabled"

config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", weight = "Medium" },
  "Apple Color Emoji",
  "Symbols Nerd Font",
  "SF Pro"
})
config.font_size = 14
config.line_height = 1.1

config.color_scheme_dirs = { home .. "/.cache/wal" }
config.color_scheme = "colors-wezterm"

config.enable_tab_bar = false

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.window_decorations = "RESIZE"

config.default_prog = { "/opt/homebrew/bin/tmux", "a" }

return config
