-- tmux-default pane / tab / workspace controls for WezTerm.
-- Mirrors tmux's built-in prefix table (`tmux -f /dev/null list-keys -T prefix`),
-- plus a few extras on keys tmux leaves unbound (marked "extra").
-- Usage (in wezterm.lua):  require("lua.panes").apply(config)
--
-- tmux -> WezTerm naming: window = tab, session = workspace.

local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

-- tmux repeat-time: after a repeatable (-r) key, more presses within this
-- window work without the prefix. Each press re-arms the timer.
local REPEAT_MS = 500

local ARROWS = { LeftArrow = "Left", DownArrow = "Down", UpArrow = "Up", RightArrow = "Right" }
local HJKL   = { h = "Left", j = "Down", k = "Up", l = "Right" }

-- Wrap an action so it (re)enters the "repeat" key table, like tmux bind -r
local function repeatable(action)
  return act.Multiple({
    action,
    act.ActivateKeyTable({
      name = "repeat",
      one_shot = false,
      until_unknown = true,
      replace_current = true,
      timeout_milliseconds = REPEAT_MS,
    }),
  })
end

------------------------------------------------------------------------
-- History for tmux's "last pane" (;) and "last session" (L)
------------------------------------------------------------------------
local pane_hist = {} -- tab_id -> { cur = pane_id, prev = pane_id }
local ws_hist = { cur = nil, prev = nil }

local function track(window)
  local tab = window:active_tab()
  local pane = window:active_pane()
  if tab and pane then
    local h = pane_hist[tab:tab_id()] or {}
    if h.cur ~= pane:pane_id() then
      h.prev, h.cur = h.cur, pane:pane_id()
    end
    pane_hist[tab:tab_id()] = h
  end
  local ws = window:active_workspace()
  if ws_hist.cur ~= ws then
    ws_hist.prev, ws_hist.cur = ws_hist.cur, ws
  end
end

local last_pane = wezterm.action_callback(function(window, _)
  local tab = window:active_tab()
  local h = pane_hist[tab:tab_id()]
  if not (h and h.prev) then return end
  for _, p in ipairs(tab:panes()) do
    if p:pane_id() == h.prev then
      p:activate()
      return
    end
  end
end)

local last_workspace = wezterm.action_callback(function(window, pane)
  if ws_hist.prev then
    window:perform_action(act.SwitchToWorkspace({ name = ws_hist.prev }), pane)
  end
end)

-- Prompt that is pre-filled at the moment it opens (tmux: command-prompt -I)
local function prompt(description, initial, on_line)
  return wezterm.action_callback(function(window, pane)
    window:perform_action(act.PromptInputLine({
      description = description,
      initial_value = initial(window),
      action = wezterm.action_callback(function(w, p, line)
        if line and line ~= "" then on_line(w, p, line) end
      end),
    }), pane)
  end)
end

local function keys()
  local split_h = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) -- left | right
  local split_v = act.SplitVertical({ domain = "CurrentPaneDomain" })   -- top / bottom

  local k = {
    -- C-b: send a literal Ctrl+b (send-prefix)
    { key = "b",        mods = "LEADER|CTRL",  action = act.SendKey({ key = "b", mods = "CTRL" }) },

    ------------------------------------------------------------------
    -- Panes
    ------------------------------------------------------------------
    { key = '"',        mods = "LEADER|SHIFT", action = split_v },
    { key = "%",        mods = "LEADER|SHIFT", action = split_h },
    { key = "o",        mods = "LEADER",       action = act.ActivatePaneDirection("Next") },
    { key = ";",        mods = "LEADER",       action = last_pane },
    { key = "q",        mods = "LEADER",       action = act.PaneSelect({ alphabet = "0123456789" }) },
    { key = "z",        mods = "LEADER",       action = act.TogglePaneZoomState },
    { key = "x",        mods = "LEADER",       action = act.CloseCurrentPane({ confirm = true }) },
    { key = "{",        mods = "LEADER|SHIFT", action = act.RotatePanes("CounterClockwise") },
    { key = "}",        mods = "LEADER|SHIFT", action = act.RotatePanes("Clockwise") },
    { key = "o",        mods = "LEADER|CTRL",  action = act.RotatePanes("Clockwise") },
    { key = "o",        mods = "LEADER|ALT",   action = act.RotatePanes("CounterClockwise") },
    {
      key = "!",
      mods = "LEADER|SHIFT",
      action = wezterm.action_callback(function(_, pane)
        pane:move_to_new_tab()
      end),
    },

    ------------------------------------------------------------------
    -- Windows (tabs)
    ------------------------------------------------------------------
    { key = "c",        mods = "LEADER",       action = act.SpawnTab("CurrentPaneDomain") },
    { key = "n",        mods = "LEADER",       action = act.ActivateTabRelative(1) },
    { key = "p",        mods = "LEADER",       action = act.ActivateTabRelative(-1) },
    { key = "l",        mods = "LEADER",       action = act.ActivateLastTab },
    { key = "w",        mods = "LEADER",       action = act.ShowTabNavigator },
    { key = "f",        mods = "LEADER",       action = act.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },
    { key = "&",        mods = "LEADER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
    {
      key = ",",
      mods = "LEADER",
      action = prompt("rename-window",
        function(w) return w:active_tab():get_title() end,
        function(w, _, line) w:active_tab():set_title(line) end),
    },
    {
      key = "'",
      mods = "LEADER",
      action = prompt("index", function() return "" end, function(w, p, line)
        local n = tonumber(line)
        if n then w:perform_action(act.ActivateTab(n), p) end
      end),
    },
    {
      key = ".",
      mods = "LEADER",
      action = prompt("move-window", function() return "" end, function(w, p, line)
        local n = tonumber(line)
        if n then w:perform_action(act.MoveTab(n), p) end
      end),
    },

    ------------------------------------------------------------------
    -- Sessions (workspaces)
    ------------------------------------------------------------------
    { key = "s",        mods = "LEADER",       action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
    { key = "(",        mods = "LEADER|SHIFT", action = act.SwitchWorkspaceRelative(-1) },
    { key = ")",        mods = "LEADER|SHIFT", action = act.SwitchWorkspaceRelative(1) },
    { key = "L",        mods = "LEADER|SHIFT", action = last_workspace },
    {
      key = "$",
      mods = "LEADER|SHIFT",
      action = prompt("rename-session",
        function(w) return w:active_workspace() end,
        function(_, _, line)
          wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
        end),
    },
    -- Detach (only meaningful when connected via the unix domain)
    { key = "d",        mods = "LEADER",       action = act.DetachDomain({ DomainName = "unix" }) },

    ------------------------------------------------------------------
    -- Copy mode / paste
    ------------------------------------------------------------------
    { key = "[",        mods = "LEADER",       action = act.ActivateCopyMode },
    { key = "PageUp",   mods = "LEADER",       action = act.Multiple({ act.ActivateCopyMode, act.CopyMode("PageUp") }) },
    { key = "]",        mods = "LEADER",       action = act.PasteFrom("Clipboard") },

    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------
    { key = ":",        mods = "LEADER|SHIFT", action = act.ActivateCommandPalette },
    { key = "?",        mods = "LEADER|SHIFT", action = act.ShowLauncherArgs({ flags = "FUZZY|KEY_ASSIGNMENTS" }) },
    { key = "~",        mods = "LEADER|SHIFT", action = act.ShowDebugOverlay },

    ------------------------------------------------------------------
    -- Extras (keys tmux leaves unbound by default)
    ------------------------------------------------------------------
    { key = "|",        mods = "LEADER|SHIFT", action = split_h },
    { key = "Tab",      mods = "LEADER",       action = act.ActivateLastTab },
    { key = "h",        mods = "LEADER",       action = act.ActivatePaneDirection("Left") },
    { key = "j",        mods = "LEADER",       action = act.ActivatePaneDirection("Down") },
    { key = "k",        mods = "LEADER",       action = act.ActivatePaneDirection("Up") },
    { key = "H",        mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
    { key = "J",        mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
    { key = "K",        mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
    { key = "R",        mods = "LEADER|SHIFT", action = act.ReloadConfiguration },
    {
      key = "S",
      mods = "LEADER|SHIFT",
      action = prompt("new-session", function() return "" end, function(w, p, line)
        w:perform_action(act.SwitchToWorkspace({ name = line }), p)
      end),
    },
  }

  -- 0..9 -> window 0..9 (tmux base-index 0)
  for i = 0, 9 do
    table.insert(k, { key = tostring(i), mods = "LEADER", action = act.ActivateTab(i) })
  end

  -- Repeatable: arrows select pane, C-arrows resize 1, M-arrows resize 5
  for key, dir in pairs(ARROWS) do
    table.insert(k, { key = key, mods = "LEADER",      action = repeatable(act.ActivatePaneDirection(dir)) })
    table.insert(k, { key = key, mods = "LEADER|CTRL", action = repeatable(act.AdjustPaneSize({ dir, 1 })) })
    table.insert(k, { key = key, mods = "LEADER|ALT",  action = repeatable(act.AdjustPaneSize({ dir, 5 })) })
  end
  -- Extra: C-hjkl resize 2, repeatable
  for key, dir in pairs(HJKL) do
    table.insert(k, { key = key, mods = "LEADER|CTRL", action = repeatable(act.AdjustPaneSize({ dir, 2 })) })
  end

  return k
end

-- Keys that keep working without the prefix during the repeat window
local function repeat_table()
  local t = {}
  for key, dir in pairs(ARROWS) do
    table.insert(t, { key = key,                action = repeatable(act.ActivatePaneDirection(dir)) })
    table.insert(t, { key = key, mods = "CTRL", action = repeatable(act.AdjustPaneSize({ dir, 1 })) })
    table.insert(t, { key = key, mods = "ALT",  action = repeatable(act.AdjustPaneSize({ dir, 5 })) })
  end
  for key, dir in pairs(HJKL) do
    table.insert(t, { key = key, mods = "CTRL", action = repeatable(act.AdjustPaneSize({ dir, 2 })) })
  end
  return t
end

-- Right status: PREFIX / key-table indicator + current workspace
wezterm.on("update-status", function(window, _)
  track(window)

  local status = ""
  if window:leader_is_active() then
    status = " PREFIX "
  elseif window:active_key_table() then
    status = " " .. window:active_key_table():upper() .. " "
  end
  window:set_right_status(wezterm.format({
    { Background = { Color = "#7aa2f7" } },
    { Foreground = { Color = "#1a1b26" } },
    { Text = status },
    { Background = { Color = "none" } },
    { Foreground = { Color = "#a9b1d6" } },
    { Text = "  " .. window:active_workspace() .. " " },
  }))
end)

function M.apply(config)
  -- No prefix timeout exists in tmux; WezTerm requires one
  config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

  config.keys = config.keys or {}
  for _, binding in ipairs(keys()) do
    table.insert(config.keys, binding)
  end

  config.key_tables = config.key_tables or {}
  config.key_tables["repeat"] = repeat_table()

  -- tmux-like look
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true
  config.hide_tab_bar_if_only_one_tab = false
  -- Poll often so ";" (last pane) and "L" (last session) track switches
  config.status_update_interval = 500

  config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.6 }
  config.scrollback_lines = 10000

  -- Persistent sessions (attach/detach like tmux)
  config.unix_domains = { { name = "unix" } }
  -- Uncomment to auto-attach to the mux server on launch:
  -- config.default_gui_startup_args = { "connect", "unix" }
end

return M
