{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      ms-azuretools.vscode-docker
      redhat.vscode-yaml
      yzhang.markdown-all-in-one
      vscodevim.vim
      hashicorp.terraform
      golang.go
      b4dm4n.vscode-nixpkgs-fmt
      brettm12345.nixfmt-vscode
      editorconfig.editorconfig
      eamodio.gitlens
      christian-kohler.path-intellisense
      shardulm94.trailing-spaces
      ms-kubernetes-tools.vscode-kubernetes-tools
      mhutchie.git-graph
      donjayamanne.githistory
      wholroyd.jinja
    ];
    keybindings = [
      {
        "key" = "cmd+e";
        "command" = "workbench.action.showAllEditorsByMostRecentlyUsed";
      }
      {
        "key" = "cmd+2";
        "command" = "workbench.action.terminal.toggleTerminal";
        "when" = "terminal.active";
      }
      {
        "key" = "cmd+alt+m";
        "command" = "workbench.action.toggleMaximizedPanel";
        "when" = "terminalFocus";
      }
      {
        "key" = "escape";
        "command" = "workbench.action.focusActiveEditorGroup";
        "when" = "terminalFocus || filesExplorerFocus";
      }
      {
        "key" = "escape";
        "command" = "workbench.view.explorer";
        "when" = "activeViewlet == 'workbench.view.scm'";
      }
      {
        "key" = "cmd+1";
        "command" = "-workbench.view.explorer";
      }
      {
        "key" = "cmd+1";
        "command" = "workbench.view.explorer";
        "when" = "!explorerViewletVisible";
      }
      {
        "key" = "cmd+1";
        "command" = "workbench.action.toggleSidebarVisibility";
        "when" = "explorerViewletVisible";
      }
      {
        "key" = "cmd+3";
        "command" = "workbench.view.scm";
      }
      {
        "key" = "cmd+3";
        "command" = "workbench.action.toggleSidebarVisibility";
        "when" = "scmRepository";
      }
    ];
    userSettings =
      builtins.fromJSON (builtins.readFile ./configs/vscode.json);
    userTasks = { };
  };
}
