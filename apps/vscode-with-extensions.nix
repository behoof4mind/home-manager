{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    userSettings = 
      {
            "files.autoSave" = "off";
            "[nix]"."editor.tabSize" = 2;
      };
  };
}
