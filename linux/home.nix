{ pkgs, ... }:

{
  home.username = "denny";
  home.homeDirectory = "/home/denny";

  home.packages = with pkgs; [
    air
    cargo
    ctags
    delve
    deno
    direnv
    dive
    docker-compose
    fd
    gcc_multi
    go
    golangci-lint
    golangci-lint-langserver
    gomplate
    gopls
    grc
    jq
    k9s
    kubectl
    kubectl-doctor
    kubectl-example
    kubectl-tree
    kubernetes-helm
    kustomize
    lemonade
    lsd
    luajitPackages.luarocks
    nix-prefetch-git
    nixfmt
    nixpkgs-fmt
    pnpm
    yaml-language-server
    nodejs
    oh-my-fish
    openjdk
    php
    phpPackages.composer
    ranger
    ripgrep
    ruby
    terraform-ls
    terragrunt
    tree
    vault
    watch
    xsel
    keyd
    gh
    zoxide
    kubecolor
    fzf
    copyq
    nerd-fonts.jetbrains-mono
  ];

  # Crossplatform
  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.git = (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux.nix { }).programs.tmux;
  programs.neovim = (pkgs.callPackage ./apps/neovim.nix { }).programs.neovim;
  home.file."/home/denny/.gitconfig-my-github".source = ./apps/configs/.gitconfig-my-github;
  home.file."/home/denny/.gitconfig-iits-github".source = ./apps/configs/.gitconfig-iits-github;
  home.file."/home/denny/.gitconfig-iits-gitlab".source = ./apps/configs/.gitconfig-iits-gitlab;
  # home.file."/home/denny/.ssh/config".source = ./apps/configs/.ssh-config;
  home.file."/home/denny/.ctags".source = ./apps/configs/.ctags;
  home.file."/home/denny/.config/wezterm/wezterm.lua".source = ./apps/configs/wezterm.lua;
  home.file."/home/denny/.config/nvim" = {
    source = ../apps-configs/neovim;
    recursive = true;
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
