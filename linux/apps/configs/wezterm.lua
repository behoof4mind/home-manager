local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.default_prog = { "/home/denny/.nix-profile/bin/fish" }
config.automatically_reload_config = true

-- Appearance
config.color_scheme = "tokyonight_night"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14
config.enable_tab_bar = true
config.window_decorations = "NONE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 20
config.scrollback_lines = 1000000
config.window_padding = { left = 0, right = 0, top = 8, bottom = 0 }

-- Leader: RightAlt, tap then key within 1500ms
config.use_ime = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.use_dead_keys = false
config.leader = { key = "RightAlt", mods = "NONE", timeout_milliseconds = 1500 }

config.keys = {
  { key = "c", mods = "ALT", action = act.CopyTo("Clipboard") },
  { key = "1", mods = "SUPER", action = act.ActivateTab(0) },
  { key = "2", mods = "SUPER", action = act.ActivateTab(1) },
  { key = "3", mods = "SUPER", action = act.ActivateTab(2) },
  { key = "4", mods = "SUPER", action = act.ActivateTab(3) },
  { key = "5", mods = "SUPER", action = act.ActivateTab(4) },
  { key = "6", mods = "SUPER", action = act.ActivateTab(5) },
  { key = "7", mods = "SUPER", action = act.ActivateTab(6) },
  { key = "8", mods = "SUPER", action = act.ActivateTab(7) },
  { key = "9", mods = "SUPER", action = act.ActivateTab(8) },
  { key = "e", mods = "LEADER", action = act.ShowLauncher },
  { key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = "LEADER", action = act.ShowTabNavigator },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "s", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "f", mods = "LEADER", action = act.Search({ CaseSensitiveString = "" }) },
  { key = "q", mods = "LEADER", action = act.PaneSelect },
  { key = "q", mods = "LEADER|CTRL", action = act.PaneSelect({ mode = "MoveToNewTab" }) },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
  {
    key = ",",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = "Enter new name for tab",
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
  {
    key = "d",
    mods = "LEADER",
    action = wezterm.action_callback(function(window, _)
      local datetime = wezterm.strftime("%A, %B %d %Y\n%H:%M:%S")
      window:toast_notification("Current Time", datetime, nil, 5000)
    end),
  },
  {
    key = "K",
    mods = "LEADER",
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(
        act.SpawnCommandInNewTab({
          args = { "/home/denny/.nix-profile/bin/fish", "-c", "k9s" },
          set_environment_variables = {
            KUBECONFIG = os.getenv("HOME") .. "/.config/kube/config",
          },
          cwd = os.getenv("HOME"),
        }),
        pane
      )
      wezterm.sleep_ms(10)
      local tab = window:active_tab()
      if tab then
        tab:set_title("K9S")
      end
    end),
  },
}

config.key_tables = {
  resize_pane = {
    { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "Escape", action = "PopKeyTable" },
  },
  copy_mode = {
    { key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
    { key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
    { key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
    { key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
    { key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
    { key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
    { key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
    { key = "4", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
    { key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
    { key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
    { key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
    { key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
    {
      key = "y",
      mods = "NONE",
      action = wezterm.action.Multiple({
        { CopyTo = "ClipboardAndPrimarySelection" },
        { CopyMode = "Close" },
      }),
    },
    { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
    { key = "q", mods = "NONE", action = act.CopyMode("Close") },
  },
}

return config
