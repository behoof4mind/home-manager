{ pkgs, ... }:

{
  home.username = "dlavrushko";
  home.homeDirectory = "/Users/dlavrushko";

  home.packages = with pkgs; [
    air
    argocd
    bash
    cargo
    coreutils-full
    ctags
    delve
    direnv
    docker-compose
    dive
    fd
    gnugrep
    gnupg
    gnused
    go
    golangci-lint
    golangci-lint-langserver
    gopls
    go-swagger
    grc
    jq
    k9s
    kubecolor
    kubectl
    julia-bin
    kubectl-doctor
    kubectl-example
    kubectl-tree
    kubernetes-helm
    kustomize
    lazygit
    lemonade
    lsd
    luajitPackages.luarocks
    neovim
    nix-prefetch-git
    nixpkgs-fmt
    nixfmt
    nodejs
    oh-my-fish
    openjdk
    openssh
    php
    php81Packages.composer
    python310Packages.pip
    ranger
    ripgrep
    ruby
    terragrunt
    terraform-ls
    tflint
    tree
    vault
    vim
    watch
    wget
  ];

  # Crossplatform
  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.git = (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux.nix { }).programs.tmux;
  programs.vscode = (pkgs.callPackage ./apps/vscode.nix { }).programs.vscode;
  home.file."/Users/dlavrushko/.gitconfig-my-github".source = ./apps/configs/.gitconfig-my-github;
  home.file."/Users/dlavrushko/.gitconfig-iits-github".source = ./apps/configs/.gitconfig-iits-github;
  home.file."/Users/dlavrushko/.gitconfig-iits-gitlab".source = ./apps/configs/.gitconfig-iits-gitlab;
  home.file."/Users/dlavrushko/.ssh/config".source = ./apps/configs/.ssh-config;
  home.file."/Users/dlavrushko/.ctags".source = ./apps/configs/.ctags;
  home.file."/Users/dlavrushko/.config/nvim/init.lua".source = ./apps/configs/neovim/init.lua;
  home.file."/Users/dlavrushko/.config/nvim/lua/config/autocmds.lua".source = ./apps/configs/neovim/lua/config/autocmds.lua;
  home.file."/Users/dlavrushko/.config/nvim/lua/config/keymaps.lua".source = ./apps/configs/neovim/lua/config/keymaps.lua;
  home.file."/Users/dlavrushko/.config/nvim/lua/config/lazy.lua".source = ./apps/configs/neovim/lua/config/lazy.lua;
  home.file."/Users/dlavrushko/.config/nvim/lua/config/options.lua".source = ./apps/configs/neovim/lua/config/options.lua;
  home.file."/Users/dlavrushko/.config/nvim/lua/plugins/example.lua".source = ./apps/configs/neovim/lua/plugins/example.lua;
  home.file."/Users/dlavrushko/.config/nvim/lua/plugins/colorscheme.lua".source = ./apps/configs/neovim/lua/plugins/colorscheme.lua;
  home.file."/Users/dlavrushko/.config/nvim/lua/plugins/disabled.lua".source = ./apps/configs/neovim/lua/plugins/disabled.lua;
  home.file."/Users/dlavrushko/.config/nvim/lua/plugins/file-editor.lua".source = ./apps/configs/neovim/lua/plugins/file-editor.lua;

  # MacOS specific
  home.file."/Users/dlavrushko/Library/Application\ Support/Code/User/keybindings.json".source = ./apps/configs/vscode/keybindings.json;
  home.file."/Users/dlavrushko/.config/iterm2/DynamicProfiles/iterm-profiles.json".source = ./apps/configs/iterm2-profiles.json;

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
