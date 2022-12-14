{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      b4dm4n.vscode-nixpkgs-fmt
      bbenoist.nix
      brettm12345.nixfmt-vscode
      christian-kohler.path-intellisense
      donjayamanne.githistory
      eamodio.gitlens
      editorconfig.editorconfig
      golang.go
      hashicorp.terraform
      mhutchie.git-graph
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      redhat.vscode-yaml
      shardulm94.trailing-spaces
      wholroyd.jinja
      yzhang.markdown-all-in-one
    ];
    keybindings = [
      {
        "command" = "workbench.action.terminal.toggleTerminal";
        "key" = "cmd+2";
        "when" = "terminal.active";
      }
      {
        "command" = "workbench.action.toggleMaximizedPanel";
        "key" = "cmd+alt+m";
        "when" = "terminalFocus";
      }
      {
        "command" = "workbench.action.focusActiveEditorGroup";
        "key" = "escape";
        "when" = "terminalFocus || filesExplorerFocus";
      }
      {
        "command" = "workbench.view.explorer";
        "key" = "escape";
        "when" = "activeViewlet == 'workbench.view.scm'";
      }
      {
        "command" = "workbench.view.explorer";
        "key" = "cmd+1";
        "when" = "!filesExplorerFocus";
      }
      {
        "command" = "workbench.action.toggleSidebarVisibility";
        "key" = "cmd+1";
        "when" = "filesExplorerFocus";
      }
      {
        "command" = "workbench.view.scm";
        "key" = "cmd+3";
      }
      {
        "command" = "workbench.action.toggleSidebarVisibility";
        "key" = "cmd+3";
        "when" = "sideBarFocus && activeViewlet == 'workbench.view.scm'";
      }
      {
        "key" = "ctrl+alt+w";
        "command" = "workbench.action.switchWindow";
      }
      {
        "key" = "cmd+e";
        "command" = "workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup";
        "when" = "!activeEditorGroupEmpty";
      }
      {
        "key" = "cmd+e";
        "command" = "workbench.action.quickOpenNavigateNextInEditorPicker";
        "when" = "inEditorsPicker && inQuickOpen";
      }
      {
        "key" = "cmd+shift+e";
        "command" = "workbench.action.quickOpenNavigatePreviousInEditorPicker";
        "when" = "inEditorsPicker && inQuickOpen";
      }
    ];
    userSettings =
      builtins.fromJSON (builtins.readFile ./configs/vscode.json);
    userTasks = { };
  };
}
