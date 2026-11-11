{ pkgs, ... }:

let
  clearedNumberKeys =
    prefix:
    builtins.listToAttrs (
      map (i: {
        name = "${prefix}-${toString i}";
        value = [ ];
      }) (builtins.genList (i: i + 1) 9)
    );
  customKeybindings = "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings";
in
{
  home.username = "denny";
  home.homeDirectory = "/home/denny";

  home.packages = with pkgs; [
    air
    ansible-language-server
    argocd
    aws-iam-authenticator
    aws-vault
    awscli2
    bash-language-server
    cargo
    chamber
    copyq
    ctags
    delve
    deno
    deskflow
    direnv
    dive
    docker-compose
    docker-compose-language-service
    dockerfile-language-server
    eksctl
    fd
    fzf
    gcc_multi
    gh
    glab
    go
    golangci-lint
    golangci-lint-langserver
    gomplate
    gopls
    grc
    hadolint
    hclfmt
    jdt-language-server
    jq
    k9s
    kail
    keyd
    krew
    kube-capacity
    kube-linter
    kubebuilder
    kubecolor
    kubectl
    kubectl-doctor
    kubectl-example
    kubectl-explore
    kubectl-gadget
    kubectl-images
    kubectl-tree
    kubelogin-oidc
    kubepug
    kubernetes-helm
    kubernetes-helmPlugins.helm-unittest
    kubie
    kustomize
    lazygit
    lemonade
    libsecret
    lsd
    lua-language-server
    luajitPackages.luarocks
    markdownlint-cli2
    minio-client
    mpv
    nchat
    nerd-fonts.jetbrains-mono
    netbird
    netbird-ui
    nil
    nix-prefetch-git
    nixfmt
    nixpkgs-fmt
    nodejs
    oh-my-fish
    openjdk
    php
    phpPackages.composer
    pnpm
    popeye
    pyradio
    python312Packages.python-lsp-server
    rakkess
    ranger
    ripgrep
    ruby
    s3cmd
    shfmt
    sops
    ssm-session-manager-plugin
    stern
    stylua
    tdl
    terraform
    terraform-ls
    terragrunt
    tflint
    tree
    uv
    vault
    vscode-langservers-extracted
    watch
    wezterm
    xclip
    xsel
    yaml-language-server
    yamlfmt
    zoxide
  ];

  # Crossplatform
  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.git = (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux.nix { }).programs.tmux;
  programs.neovim = (pkgs.callPackage ./apps/neovim.nix { }).programs.neovim;
  home.file."/home/denny/.gitconfig-my-github".source = ./apps/configs/.gitconfig-my-github;
  home.file."/home/denny/.gitconfig-iits-github".source = ./apps/configs/.gitconfig-iits-github;
  home.file."/home/denny/.gitconfig-iits-gitlab".source = ./apps/configs/.gitconfig-iits-gitlab;
  home.file."/home/denny/.gitconfig-maincard-gitlab".source =
    ./apps/configs/.gitconfig-maincard-gitlab;
  home.file."/home/denny/.ssh/config".source = ./apps/configs/.ssh-config;
  home.file."/home/denny/Workspace/mygithub/CLAUDE.md".source = ./apps/configs/mygithub-CLAUDE.md;
  home.file."/home/denny/Workspace/maincard/CLAUDE.md".source = ./apps/configs/maincard-CLAUDE.md;
  home.file."/home/denny/.ctags".source = ./apps/configs/.ctags;
  home.file."/home/denny/.config/wezterm/wezterm.lua".source = ./apps/configs/wezterm.lua;
  home.file."/home/denny/.config/nchat/ui.conf".source = ./apps/configs/nchat/ui.conf;
  home.file."/home/denny/.config/keyd/default.conf".source = ./apps/configs/keyd/default.conf;
  home.file."/home/denny/.aws/config".source = ./apps/configs/aws-config;
  home.file."/home/denny/.config/autostart/org.deskflow.deskflow.desktop".source =
    ./apps/configs/deskflow/autostart.desktop;
  home.file."/home/denny/.local/share/applications/org.deskflow.deskflow.desktop".source =
    ./apps/configs/deskflow/deskflow.desktop;
  home.file."/home/denny/.config/autostart/copyq.desktop".source =
    ./apps/configs/copyq/autostart.desktop;
  home.file."/home/denny/.config/nvim" = {
    source = ../apps-configs/neovim;
    recursive = true;
  };

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "caps:escape" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-input-source = [ "<Control>space" ];
      switch-input-source-backward = [ "<Shift><Control>space" ];
    }
    // clearedNumberKeys "switch-to-workspace";
    "org/gnome/shell/keybindings" = {
      toggle-overview = [ "<Super>space" ];
      show-screenshot-ui = [
        "F12"
        "Print"
      ];
    }
    // clearedNumberKeys "switch-to-application";
    "org/gnome/shell/extensions/dash-to-dock" =
      clearedNumberKeys "app-hotkey" // clearedNumberKeys "app-ctrl-hotkey";
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "${customKeybindings}/custom0/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "CopyQ Popup";
      binding = "<Super><Shift>v";
      command = "copyq toggle";
      enable-in-lockscreen = false;
    };
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
