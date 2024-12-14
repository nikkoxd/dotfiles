-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local home = wezterm.home_dir
local config = wezterm.config_builder()

wezterm.add_to_config_reload_watch_list(home .. "/.dotfiles/.config/wezterm/colorschemes/colors-wezterm.toml")

config.audible_bell = "Disabled"

config.font = wezterm.font_with_fallback({
  "BerkeleyMono Nerd Font",
  "JetBrains Mono",
  "Apple Color Emoji",
  "SF Pro"
})
config.font_size = 14
config.line_height = 1.1

config.color_scheme_dirs = { home .. "/.dotfiles/.config/wezterm/colorschemes" }
config.color_scheme = "colors-wezterm"

config.enable_tab_bar = false

config.window_background_opacity = 1
config.macos_window_background_blur = 50

config.window_padding = {
  top = 20,
}

config.window_decorations = "RESIZE"

config.default_prog = { "/opt/homebrew/bin/tmux", "a" }

return config
