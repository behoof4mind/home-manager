local wezterm = require("wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local act = wezterm.action
local config = wezterm.config_builder()
config.default_prog = { "/Users/denislavrushko/.nix-profile/bin/fish" }
config.automatically_reload_config = true

-- Custom kube context component
local function kube_context(mode)
  local yaml_path = os.getenv("HOME") .. "/.config/kube/config"
  local f = io.open(yaml_path, "r")
  if not f then
    return "no-kubeconfig"
  end

  local content = f:read("*a")
  f:close()

  local context = content:match("current%-context:%s*(.-)\n"):lower()

  -- Mode: return color only
  if mode == "color" then
    if context:match("prod") then
      return "#f7768e"
    elseif context:match("dev") then
      return "#9ece6a"
    elseif context:match("staging") then
      return "#e0af68"
    else
      return "#7aa2f7"
    end
  end

  -- Mode: return just the context string
  return " ⎈ " .. context .. " "
end

wezterm.on("update-right-status", function(window, _)
  window:set_right_status(" ") -- acts as a tick
end)

-- Get current Shell environment variables into WezTerm (because it is MacOS app)
local get_env_command = config.default_prog[1] .. " -lc 'env'"

local env = {}
for line in io.popen(get_env_command):lines() do
  local key, value = line:match("^(.-)=(.*)$")
  if key and value then
    env[key] = value
  end
end

config.set_environment_variables = env
local f = io.open("/tmp/env_debug.txt", "w")
if f then
  for key, value in pairs(config.set_environment_variables) do
    f:write("ENV[" .. key .. "] = " .. value .. "\n")
  end
  f:close()
end

-- APPEREANCE
config.color_scheme = "tokyonight_night"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 17
config.enable_tab_bar = true
config.window_decorations = "MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|MACOS_FORCE_SQUARE_CORNERS|RESIZE"
config.command_palette_bg_color = "#575757"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 20
config.scrollback_lines = 1000000
config.window_frame = {
  font = wezterm.font({ family = "Roboto", weight = "Bold" }),
  font_size = 14.0,
  active_titlebar_bg = "#333333",
  inactive_titlebar_bg = "#333333",
}
config.window_padding = {
  left = 0,
  right = 0,
  top = 8,
  bottom = 0,
}

config.status_update_interval = 3000
tabline.setup({
  options = {
    icons_enabled = false,
    theme = "Catppuccin Mocha",
    tabs_enabled = true,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = {},
    tabline_b = {},
    tabline_c = {},
    tab_active = {
      "index",
      "process",
      { "zoomed", padding = 0 },
    },
    tab_inactive = { "index", { "process", padding = { left = 0, right = 0 } } },
    tabline_x = {},
    -- tabline_x = {
    -- 	{ Foreground = { Color = kube_context("color") } },
    -- 	-- { Background = { Color = kube_context("color") } },
    -- 	kube_context(),
    -- 	throttle = 3,
    -- },
    tabline_y = {},
    tabline_z = {},
  },
  extensions = {},
})

-- KEYBINDINGS
config.use_ime = false -- disables macOS "dead keys" / composition
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.use_dead_keys = false
config.leader = { key = "F18", timeout_milliseconds = 1500 }
config.keys = {
  { key = "e", mods = "LEADER", action = wezterm.action.ShowLauncher },
  {
    key = "s",
    mods = "LEADER|CTRL",
    action = wezterm.action_callback(function(_, _)
      resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
    end),
  },
  {
    key = "r",
    mods = "LEADER|CTRL",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, _)
        local type = string.match(id, "^([^/]+)") -- match before '/'
        id = string.match(id, "([^/]+)$") -- match after '/'
        id = string.match(id, "(.+)%..+$") -- remove file extention
        local opts = {
          relative = true,
          restore_text = true,
          close_open_tabs = true,
          window = pane:window(),
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
        }
        if type == "workspace" then
          local state = resurrect.state_manager.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
          local state = resurrect.state_manager.load_state(id, "window")
          resurrect.window_state.restore_window(pane:window(), state, opts)
        elseif type == "tab" then
          local state = resurrect.state_manager.load_state(id, "tab")
          resurrect.tab_state.restore_tab(pane:tab(), state, opts)
        end
      end)
    end),
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
    }),
  },
  {
    key = "f",
    mods = "LEADER",
    action = act.Search({ CaseSensitiveString = "" }),
  },
  { key = "q", mods = "LEADER", action = act.PaneSelect },
  { key = "q", mods = "LEADER|CTRL", action = act.PaneSelect({
    mode = "MoveToNewTab",
  }) },
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "p",
    mods = "LEADER",
    action = act.ActivateTabRelative(-1),
  },
  {
    key = "n",
    mods = "LEADER",
    action = act.ActivateTabRelative(1),
  },
  {
    key = "w",
    mods = "LEADER",
    action = act.ShowTabNavigator,
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
    key = "t",
    mods = "LEADER",
    action = act.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "\\",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
  { key = "s", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
  {
    key = "K",
    mods = "LEADER",
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(
        wezterm.action.SpawnCommandInNewTab({
          args = {
            "/Users/denislavrushko/.nix-profile/bin/fish",
            "-c",
            "k9s",
          },
          set_environment_variables = {
            PATH = env["PATH"],
            KUBECONFIG = "/Users/denislavrushko/.config/kube/config",
            K9S_CONFIG_DIR = "/Users/denislavrushko/.config/k9s",
            EDITOR = "neovim",
          },
          cwd = env["HOME"],
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
    -- Cancel the mode by pressing escape
    { key = "Escape", action = "PopKeyTable" },
  },
}
return config
