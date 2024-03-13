local config = {}
local wezterm = require 'wezterm'

config.font_size = 15.0
-- config.color_scheme = 'Catppuccin Machiato'
config.color_scheme = 'Hybrid'
-- config.color_scheme = 'Everforest Dark (Gogh)'

config.default_cursor_style = 'BlinkingBar'
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.80

config.enable_tab_bar = false

-- config.window_background_gradient = {
--     orientation = {
--             cx = 1.0,
--         Radial = {
--             cy = 0.8,
--             radius = 0.8,
--         }
--     },
--     colors = {
--         '#100610',
--         '#030208',
--     },
-- }

return config
