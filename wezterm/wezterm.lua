local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Import and apply modules from the lua/ folder
require("lua.window").apply(config)
require("lua.fonts").apply(config)
require("lua.panes").apply(config)

return config
