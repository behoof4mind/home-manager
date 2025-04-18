{ XDG_PATH }:

let
  neovimFiles = import ./neovim-files.nix { inherit XDG_PATH; };
  k9sFiles = import ./k9s-files.nix { inherit XDG_PATH; };
in
{
  "${XDG_PATH}/cz/config.yaml".source = ../apps-configs/git/commitizen-config.yaml;
  "${builtins.getEnv "HOME"}/.atac_vim_key_bindings.toml".source = ../apps-configs/atac_vim_key_bindings.toml;
  "${builtins.getEnv "HOME"}/.config/gh-dash/config.yml".source = ../apps-configs/gh-dash/config.yml;
  "${builtins.getEnv "HOME"}/.config/karabiner/karabiner.json" = {
    source = ../apps-configs/karabiner.json;
    force = true;
  };
  "${builtins.getEnv "HOME"}/.ctags".source = ../apps-configs/.ctags;
  "${builtins.getEnv "HOME"}/.gitconfig-ftapi-github".source = ../apps-configs/git/.gitconfig-ftapi-github;
  "${builtins.getEnv "HOME"}/.gitconfig-my-github".source = ../apps-configs/git/.gitconfig-my-github;
  "${builtins.getEnv "HOME"}/.ssh/config".source = ../apps-configs/.ssh-config;
  "${builtins.getEnv "HOME"}/Library/Application Support/Code/User/keybindings.json".source = ../apps-configs/vscode/keybindings.json;
  "${builtins.getEnv "HOME"}/Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json".source = ../apps-configs/iterm2/DynamicProfiles/Profiles.json;
}
// neovimFiles
// k9sFiles
