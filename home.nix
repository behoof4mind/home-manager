{ pkgs, ... }:

let
  XDG_PATH = "${builtins.getEnv "HOME"}/.config";
  homeFiles = import ./n-home-file/main.nix { inherit XDG_PATH; };
  packageList = import ./n-packages/packages.nix { inherit pkgs; };
  vars = import ./n-variables/variables.nix;
  ksniff = pkgs.callPackage ./n-packages/local/ksniff.nix {
    inherit (pkgs)
      stdenv
      fetchurl
      unzip
      lib
      ;
  };
  kubectl-node-shell = pkgs.callPackage ./n-packages/local/kubectl-node-shell.nix {
    inherit (pkgs)
      stdenvNoCC
      lib
      fetchFromGitHub
      bash
      ;
  };
in
{
  nixpkgs.config = import ./n-configs/config.nix;
  home.username = vars.userName;
  home.homeDirectory = "/Users/${vars.userName}";
  home.packages = [
    kubectl-node-shell
    ksniff
  ] ++ packageList;

  programs.fish = (pkgs.callPackage ./apps/fish.nix { inherit vars; }).programs.fish;
  programs.git = (pkgs.callPackage ./apps/git.nix { inherit vars; }).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux.nix { inherit vars; }).programs.tmux;
  #  programs.vscode = (pkgs.callPackage ./apps/vscode.nix { }).programs.vscode;

  home.file = homeFiles;

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
