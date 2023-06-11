{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dlavrushko";
  home.homeDirectory = "/Users/dlavrushko";

  home.packages = with pkgs; [
    argocd
    #azure-cli
    coreutils-full
    delve
    direnv
    docker-compose
    dive
    gnugrep
    gnupg
    gnused
    go
    golangci-lint
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
    lsd
    nix-prefetch-git
    nixpkgs-fmt
    nixfmt
    nodejs
    openjdk
    python311
    ranger
    ruby
    # terraform
    terragrunt
    tree
    vault
    vim
    watch
    wget
  ];

  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.git= (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.neovim = (pkgs.callPackage ./apps/neovim.nix { }).programs.neovim;
  programs.vscode = (pkgs.callPackage ./apps/vscode.nix { }).programs.vscode;
  home.file."/Users/dlavrushko/Library/Application\ Support/iTerm2/DynamicProfiles/iterm-profiles.json".source = ./apps/configs/iterm2-profiles.json;
  home.file."/Users/dlavrushko/.config/iterm/com.googlecode.iterm2.plist".source = ./apps/configs/iterm2-config.plist;
  home.file."/Users/dlavrushko/.gitconfig-my-github".source = ./apps/configs/.gitconfig-my-github;
  home.file."/Users/dlavrushko/.gitconfig-iits-github".source = ./apps/configs/.gitconfig-iits-github;
  home.file."/Users/dlavrushko/.gitconfig-iits-gitlab".source = ./apps/configs/.gitconfig-iits-gitlab;
  home.file."/Users/dlavrushko/.ssh/config".source = ./apps/configs/.ssh-config;
  home.file."Library/Application Support/Code/User/keybindings.json".source = ./apps/configs/vscode/keybindings.json;

  # programs.direnv = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
