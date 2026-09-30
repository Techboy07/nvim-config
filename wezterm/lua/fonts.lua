-- Fonts, fallback chain and glyph handling.

local wezterm = require("wezterm")

local M = {}

function M.apply(config)
  -- Silence the missing glyph warnings
  config.warn_about_missing_glyphs = false
  config.custom_block_glyphs = true

  -- Exact system font fallback chain
  config.font = wezterm.font_with_fallback({
    -- Your primary font choice
    {
      family = "0xProto Nerd Font",
      weight = "Regular",
      stretch = "Normal",
      style = "Normal",
    },
    -- Explicit local Nerd Font symbols from your fc-list
    { family = "Symbols Nerd Font Mono" },
    -- System emoji backup
    { family = "Noto Color Emoji" },
  })
end

return M
