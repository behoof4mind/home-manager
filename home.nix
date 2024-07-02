{ pkgs, ... }:

let
  packageList = import ./packages.nix { inherit pkgs; };
  configPath = "${builtins.getEnv "HOME"}/.config";
in {
  home.username = "dlavrushko";
  home.homeDirectory = "/Users/dlavrushko";
  home.packages = packageList;

  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.git = (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux.nix { }).programs.tmux;
  programs.vscode = (pkgs.callPackage ./apps/vscode.nix { }).programs.vscode;
  home.file = {
    "${builtins.getEnv "HOME"}/.gitconfig-my-github".source =
      ./apps/configs/git/.gitconfig-my-github;
    "${builtins.getEnv "HOME"}/.gitconfig-ftapi-github".source =
      ./apps/configs/git/.gitconfig-ftapi-github;
    "${builtins.getEnv "HOME"}/.ssh/config".source = ./apps/configs/.ssh-config;
    "${builtins.getEnv "HOME"}/.ctags".source = ./apps/configs/.ctags;
    "${configPath}/nvim/init.lua".source = ./apps/configs/neovim/init.lua;
    "${configPath}/nvim/lua/config/autocmds.lua".source =
      ./apps/configs/neovim/lua/config/autocmds.lua;
    "${configPath}/nvim/lua/config/keymaps.lua".source =
      ./apps/configs/neovim/lua/config/keymaps.lua;
    "${configPath}/nvim/lua/config/lazy.lua".source =
      ./apps/configs/neovim/lua/config/lazy.lua;
    "${configPath}/lazygit/config.yml".source =
      ./apps/configs/neovim/lazygit_config.yml;
    "${configPath}/nvim/lua/config/options.lua".source =
      ./apps/configs/neovim/lua/config/options.lua;
    "${configPath}/nvim/lua/plugins/obsidian.lua".source =
      ./apps/configs/neovim/lua/plugins/obsidian.lua;
    "${configPath}/nvim/lua/plugins/coding.lua".source =
      ./apps/configs/neovim/lua/plugins/coding.lua;
    "${configPath}/nvim/lua/plugins/lsp.lua".source =
      ./apps/configs/neovim/lua/plugins/lsp.lua;
    "${configPath}/nvim/lua/plugins/colorscheme.lua".source =
      ./apps/configs/neovim/lua/plugins/colorscheme.lua;
    "${configPath}/nvim/lua/plugins/lang/terraform.lua".source =
      ./apps/configs/neovim/lua/plugins/lang/terraform.lua;
    "${configPath}/nvim/lua/plugins/lang/yaml.lua".source =
      ./apps/configs/neovim/lua/plugins/lang/yaml.lua;
    "${configPath}/nvim/lua/plugins/copilot.lua".source =
      ./apps/configs/neovim/lua/plugins/copilot.lua;
    "${configPath}/nvim/lua/plugins/lualine.lua".source =
      ./apps/configs/neovim/lua/plugins/lualine.lua;
    "${configPath}/nvim/lua/plugins/lang/docker.lua".source =
      ./apps/configs/neovim/lua/plugins/lang/docker.lua;
    "${configPath}/nvim/lua/plugins/lang/markdown.lua".source =
      ./apps/configs/neovim/lua/plugins/lang/markdown.lua;
    "${configPath}/nvim/lua/plugins/lang/java.lua".source =
      ./apps/configs/neovim/lua/plugins/lang/java.lua;
    "${configPath}/nvim/lua/plugins/lang/json.lua".source =
      ./apps/configs/neovim/lua/plugins/lang/json.lua;
    "${configPath}/nvim/lua/plugins/databases.lua".source =
      ./apps/configs/neovim/lua/plugins/databases.lua;
    "${configPath}/nvim/lua/plugins/disabled.lua".source =
      ./apps/configs/neovim/lua/plugins/disabled.lua;
    "${configPath}/nvim/lua/plugins/file-editor.lua".source =
      ./apps/configs/neovim/lua/plugins/file-editor.lua;
    "${configPath}/nvim/lua/plugins/git.lua".source =
      ./apps/configs/neovim/lua/plugins/git.lua;

    # MacOS specific
    "${
      builtins.getEnv "HOME"
    }/Library/Application Support/Code/User/keybindings.json".source =
      ./apps/configs/vscode/keybindings.json;
    "${configPath}/iterm2/DynamicProfiles/iterm-profiles.json".source =
      ./apps/configs/iterm2-profiles.json;
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
