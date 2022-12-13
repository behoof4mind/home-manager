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
        "command" = "workbench.action.showAllEditorsByMostRecentlyUsed";
        "key" = "cmd+e";
      }
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
        "command" = "-workbench.view.explorer";
        "key" = "cmd+1";
      }
      {
        "command" = "workbench.view.explorer";
        "key" = "cmd+1";
        "when" = "!explorerViewletVisible";
      }
      {
        "command" = "workbench.action.toggleSidebarVisibility";
        "key" = "cmd+1";
        "when" = "explorerViewletVisible";
      }
      {
        "command" = "workbench.view.scm";
        "key" = "cmd+3";
      }
      {
        "command" = "workbench.action.toggleSidebarVisibility";
        "key" = "cmd+3";
        "when" = "scmRepository";
      }

    ];
    userSettings =
      builtins.fromJSON (builtins.readFile ./configs/vscode.json);
    userTasks = { };
  };
}
