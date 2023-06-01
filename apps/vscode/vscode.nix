{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions =
        pkgs.vscode-utils.extensionsFromVscodeMarketplace
        (builtins.fromJSON (builtins.readFile ./extensions.json));
    userSettings =
      builtins.fromJSON (builtins.readFile ./settings.json);
    userTasks = { };
  };
}
