-- Window, backend and rendering settings.

local M = {}

function M.apply(config)
  config.window_decorations = "RESIZE"
  config.term = "wezterm"
  config.enable_wayland = true
  config.front_end = "OpenGL"
  -- config.window_background_opacity = 0.85
  config.enable_kitty_graphics = true
end

return M
