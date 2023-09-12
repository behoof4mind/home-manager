{ pkgs, ... }:

{
  home.username = "linux";
  home.homeDirectory = "/home/linux";

  home.packages = with pkgs; [
    air
    cargo
    ctags
    delve
    deno
    direnv
    dive
    docker-compose
    gcc_multi
    go
    golangci-lint
    golangci-lint-langserver
    gomplate
    gopls
    grc
    fd
    jq
    k9s
    kubecolor
    kubectl
    kubectl-doctor
    kubectl-example
    kubectl-tree
    kubernetes-helm
    kustomize
    lsd
    nix-prefetch-git
    nixfmt
    nixpkgs-fmt
    nodePackages.pnpm
    nodePackages.yaml-language-server
    nodejs
    oh-my-fish
    openjdk
    python311
    ranger
    ripgrep
    ruby
    terraform-ls
    terragrunt
    tree
    vault
    watch
    xsel
  ];

  # Crossplatform
  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.git = (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux.nix { }).programs.tmux;
  programs.neovim = (pkgs.callPackage ./apps/neovim.nix { }).programs.neovim;
  home.file."/home/linux/.gitconfig-my-github".source = ./apps/configs/.gitconfig-my-github;
  home.file."/home/linux/.gitconfig-iits-github".source = ./apps/configs/.gitconfig-iits-github;
  home.file."/home/linux/.gitconfig-iits-gitlab".source = ./apps/configs/.gitconfig-iits-gitlab;
  home.file."/home/linux/.ssh/config".source = ./apps/configs/.ssh-config;
  home.file."/home/linux/.ctags".source = ./apps/configs/.ctags;
  home.file."/home/linux/.config/nvim/lua/custom/plugins/init.lua".source = ./apps/configs/neovim/lua/custom/plugins/init.lua;
  home.file."/home/linux/.config/nvim/lua/custom/plugins/go.lua".source = ./apps/configs/neovim/lua/custom/plugins/go.lua;
  home.file."/home/linux/.config/nvim/lua/custom/plugins/terraform.lua".source = ./apps/configs/neovim/lua/custom/plugins/terraform.lua;
  # home.file."/home/linux/.config/nvim/lua/custom/plugins/set.lua".source = ./apps/configs/neovim/lua/custom/plugins/set.lua;

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
