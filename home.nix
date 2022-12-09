{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dlavrushko";
  home.homeDirectory = "/Users/dlavrushko";

  home.packages = with pkgs; [
    argocd
    #azure-cli
    direnv
    dive
    gnugrep
    gnused
    golangci-lint
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
    # vscode-with-extensions
    watch
    wget
  ];

  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.neovim = (pkgs.callPackage ./apps/neovim.nix { }).programs.neovim;
  programs.vscode= (pkgs.callPackage ./apps/vscode-with-extensions.nix { }).programs.vscode;

  # programs.direnv = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
