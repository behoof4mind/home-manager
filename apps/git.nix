{ ... }:

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
          condition = "gitdir:~/.config/home-manager";
      }
      {
          path = "~/.gitconfig-ftapi-github";
          condition = "gitdir:~/Workplace/ftapi/";
      }
    ];
  };
}
