local cfg = {}
local wezterm = require 'wezterm'

cfg.font = wezterm.font_with_fallback { 'Fira Code', 'Helvetica Neue LT Std' }
cfg.font_size = 16.0

cfg.color_scheme = 'Hybrid'

cfg.default_cursor_style = 'BlinkingBar'
cfg.window_decorations = 'RESIZE'
cfg.window_background_opacity = 0.5

cfg.enable_tab_bar = false

cfg.window_background_gradient = {
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

return cfg
