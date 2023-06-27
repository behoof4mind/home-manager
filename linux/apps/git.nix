{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    includes = [
      {
          path = "~/.gitconfig-my-github";
          condition = "gitdir:~/MyGitHub/**";
      }
      {
          path = "~/.gitconfig-my-github";
          condition = "gitdir:~/.config/nixpkgs/**";
      }
      {
          path = "~/.gitconfig-iits-github";
          condition = "gitdir:~/Workplace/github/**";
      }
      {
          path = "~/.gitconfig-iits-gitlab";
          condition = "gitdir:~/Workplace/gitlab/**";
      }
    ];
  };
}
