{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Denis Lavrushko";
    userEmail = "denis.lavrushko@iits-consulting.de";
    signing =
      {
        gpgPath = "/Users/dlavrushko/.nix-profile/bin/gpg";
        key = "4D6F36D54173B8A1";
        signByDefault = true;
      };
    includes = [
      {
          path = "~/.gitconfig-iits";
          condition = "gitdir:~/Workplace/**";
      }
    ];
  };
}
