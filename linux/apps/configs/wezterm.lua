local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { '/home/denny/.nix-profile/bin/fish' }

-- Appearance
config.window_decorations = "NONE"
config.window_padding = { left = 4, right = 4, top = 4, bottom = 4 }
config.initial_cols = 220
config.initial_rows = 50
config.font = wezterm.font('JetBrainsMono Nerd Font Mono', { weight = 'Regular' })
config.font_size = 13.0
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.hide_tab_bar_if_only_one_tab = true

-- Leader: tap RightAlt then key within 500ms
config.leader = { key = 'RightAlt', mods = 'NONE', timeout_milliseconds = 500 }
config.send_composed_key_when_right_alt_is_pressed = false

config.keys = {
  -- Copy mode
  { key = '[', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
  { key = 'c', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },

  -- Tabs
  { key = 't', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = false } },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },

  -- Panes
  { key = 'v', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 's', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = false } },
  { key = 'q', mods = 'LEADER', action = wezterm.action.PaneSelect { alphabet = 'asdfghjkl', mode = 'Activate' } },
  { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },

  -- Resize mode
  { key = 'r', mods = 'LEADER', action = wezterm.action.ActivateKeyTable {
    name = 'resize_pane',
    one_shot = false,
    timeout_milliseconds = 3000,
  }},
}

config.key_tables = {
  resize_pane = {
    { key = 'h', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
    { key = 'l', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
    { key = 'k', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
    { key = 'j', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
    { key = 'Escape', action = wezterm.action.PopKeyTable },
    { key = 'q', action = wezterm.action.PopKeyTable },
  },
  copy_mode = {
    { key = 'h', mods = 'NONE', action = wezterm.action.CopyMode 'MoveLeft' },
    { key = 'j', mods = 'NONE', action = wezterm.action.CopyMode 'MoveDown' },
    { key = 'k', mods = 'NONE', action = wezterm.action.CopyMode 'MoveUp' },
    { key = 'l', mods = 'NONE', action = wezterm.action.CopyMode 'MoveRight' },
    { key = 'w', mods = 'NONE', action = wezterm.action.CopyMode 'MoveForwardWord' },
    { key = 'b', mods = 'NONE', action = wezterm.action.CopyMode 'MoveBackwardWord' },
    { key = '0', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfLine' },
    { key = '$', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToEndOfLineContent' },
    { key = 'g', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToScrollbackTop' },
    { key = 'G', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToScrollbackBottom' },
    { key = 'v', mods = 'NONE', action = wezterm.action.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'V', mods = 'NONE', action = wezterm.action.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'y', mods = 'NONE', action = wezterm.action.Multiple {
      { CopyTo = 'ClipboardAndPrimarySelection' },
      { CopyMode = 'Close' },
    }},
    { key = 'Escape', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },
    { key = 'q', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },
  },
}

return config
