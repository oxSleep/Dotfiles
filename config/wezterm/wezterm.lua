-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Oxocarbon Dark (Gogh)'
config.font = wezterm.font 'ComicShannsMono Nerd Font'
config.font_size = 16.0


config.default_prog = { 'powershell', "-NoLogo" }
config.default_cwd = "D:/V/Documents/Dev/"
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}


-- and finally, return the configuration to wezterm
return config
