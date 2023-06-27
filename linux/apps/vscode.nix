{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions =
        pkgs.vscode-utils.extensionsFromVscodeMarketplace
        (builtins.fromJSON (builtins.readFile ./configs/vscode/extensions.json));
    userSettings =
      builtins.fromJSON (builtins.readFile ./configs/vscode/settings.json);
    userTasks = { };
  };
}
