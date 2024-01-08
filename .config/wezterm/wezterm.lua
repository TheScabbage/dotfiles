local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Catppuccin Macchiato'

config.window_background_opacity = 0.8

config.window_background_gradient = {
    orientation = {
        Radial = {
            cx = 0.2,
            cy = 0.3,
        }
    },
    colors = {
        --'#100b33',
        --'#251a36',
        '#2f1c52',
        '#100b33',
    },
}

return config
