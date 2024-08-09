{ XDG_PATH }:

let
  neovimFiles = import ./neovim-files.nix { inherit XDG_PATH; };
  k9sFiles = import ./k9s-files.nix { inherit XDG_PATH; };
in
{
  "${builtins.getEnv "HOME"}/.gitconfig-my-github".source = ../apps-configs/git/.gitconfig-my-github;
  "${builtins.getEnv "HOME"}/.gitconfig-ftapi-github".source = ../apps-configs/git/.gitconfig-ftapi-github;
  "${builtins.getEnv "HOME"}/.ssh/config".source = ../apps-configs/.ssh-config;
  "${builtins.getEnv "HOME"}/.ctags".source = ../apps-configs/.ctags;
  "${XDG_PATH}/cz/config.yaml".source = ../apps-configs/git/commitizen-config.yaml;
  "${builtins.getEnv "HOME"}/Library/Application Support/Code/User/keybindings.json".source = ../apps-configs/vscode/keybindings.json;
  "${XDG_PATH}/iterm2/DynamicProfiles/iterm-profiles.json".source = ../apps-configs/iterm2-profiles.json;
}
// neovimFiles
// k9sFiles
