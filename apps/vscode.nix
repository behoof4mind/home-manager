{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    userSettings = 
      {
            "files.autoSave" = "on";
            "[nix]"."editor.tabSize" = 2;
      };
  };
}
