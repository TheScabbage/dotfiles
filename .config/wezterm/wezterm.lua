local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Catppuccin Machiato'

config.window_background_opacity = 0.95

config.window_background_gradient = {
    orientation = {
        Radial = {
            cx = 1.0,
            cy = 0.8,
            radius = 0.8,
        }
    },
    colors = {
        '#100610',
        '#030208',
    },
}

return config
