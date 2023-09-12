{ pkgs, ... }:

{
  home.username = "dlavrushko";
  home.homeDirectory = "/Users/dlavrushko";

  home.packages = with pkgs; [
    argocd
    cargo
    coreutils-full
    ctags
    delve
    direnv
    docker-compose
    dive
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
    kubectl-doctor
    kubectl-example
    kubectl-tree
    kubernetes-helm
    kustomize
    lemonade
    lsd
    nix-prefetch-git
    nixpkgs-fmt
    nixfmt
    nodejs
    oh-my-fish
    openjdk
    python311
    ranger
    ruby
    terragrunt
    tree
    vault
    vim
    watch
    wget
  ];

  # Crossplatform
  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.git= (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux.nix { }).programs.tmux;
  programs.neovim = (pkgs.callPackage ./apps/neovim.nix { }).programs.neovim;
  programs.vscode = (pkgs.callPackage ./apps/vscode.nix { }).programs.vscode;
  home.file."/Users/dlavrushko/.gitconfig-my-github".source = ./apps/configs/.gitconfig-my-github;
  home.file."/Users/dlavrushko/.gitconfig-iits-github".source = ./apps/configs/.gitconfig-iits-github;
  home.file."/Users/dlavrushko/.gitconfig-iits-gitlab".source = ./apps/configs/.gitconfig-iits-gitlab;
  home.file."/Users/dlavrushko/.ssh/config".source = ./apps/configs/.ssh-config;
  home.file."/Users/dlavrushko/.ctags".source = ./apps/configs/.ctags;
  home.file."/Users/dlavrushko/.config/nvim/lua/custom/plugins/init.lua".source = ./apps/configs/neovim/lua/custom/plugins/init.lua;

  # MacOS specific
  home.file."/Users/dlavrushko/Library/Application\ Support/Code/User/keybindings.json".source = ./apps/configs/vscode/keybindings.json;
  home.file."/Users/dlavrushko/.config/iterm2/DynamicProfiles/iterm-profiles.json".source = ./apps/configs/iterm2-profiles.json;

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
