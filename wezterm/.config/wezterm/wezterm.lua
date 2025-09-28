-- Wezterm config file
local wezterm = require("wezterm")

local config = wezterm.config_builder()

--[[CONFIG START]]

config = {
	automatically_reload_config = true,
	--Window
	window_background_opacity = 0.93,
	kde_window_background_blur = true,
	window_decorations = "NONE",
	window_padding = {
		top = 0,
		right = 0,
		bottom = 0,
		left = 0,
	},
	hide_tab_bar_if_only_one_tab = true,
	--Font
	font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" }),
	font_size = 12,
	--Style
	color_scheme = "carbonfox",
}

--[[Actions]]
-- this line should be at the end
return config
