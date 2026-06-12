{ pkgs, ... }:

{
  home.username = "denny";
  home.homeDirectory = "/home/denny";

  home.packages = with pkgs; [
    air
    cargo
    ctags
    delve
    deno
    direnv
    dive
    docker-compose
    fd
    gcc_multi
    go
    golangci-lint
    golangci-lint-langserver
    gomplate
    gopls
    grc
    jq
    k9s
    kubectl
    kubectl-doctor
    kubectl-example
    kubectl-tree
    kubernetes-helm
    kustomize
    lemonade
    lsd
    luajitPackages.luarocks
    nix-prefetch-git
    nixfmt
    nixpkgs-fmt
    pnpm
    yaml-language-server
    nodejs
    oh-my-fish
    openjdk
    php
    phpPackages.composer
    ranger
    ripgrep
    ruby
    terraform
    terraform-ls
    terragrunt
    tree
    vault
    watch
    xsel
    xclip
    keyd
    gh
    zoxide
    kubecolor
    fzf
    copyq
    lazygit
    nerd-fonts.jetbrains-mono

    # Language servers & formatters (neovim)
    ansible-language-server
    docker-compose-language-service
    dockerfile-language-server
    jdt-language-server
    lua-language-server
    markdownlint-cli2
    nil
    bash-language-server

    python312Packages.python-lsp-server
    stylua
    vscode-langservers-extracted

    # Linters & formatters
    hadolint
    hclfmt
    shfmt
    tflint
    yamlfmt

    # kubectl plugins
    kail
    kube-capacity
    kube-linter
    kubebuilder
    kubectl-explore
    kubectl-gadget
    kubectl-images
    kubelogin-oidc
    kubepug
    kubernetes-helmPlugins.helm-unittest
    kubie
    popeye
    rakkess
    stern

    # Storage / infra
    minio-client

    # AWS
    awscli2
    aws-vault
    glab
    uv
    ssm-session-manager-plugin
    eksctl
    aws-iam-authenticator
    sops
    chamber
    s3cmd
    libsecret

    # Telegram TUI
    nchat

    # Radio
    pyradio
    mpv
  ];

  # Crossplatform
  programs.fish = (pkgs.callPackage ./apps/fish.nix { }).programs.fish;
  programs.git = (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux.nix { }).programs.tmux;
  programs.neovim = (pkgs.callPackage ./apps/neovim.nix { }).programs.neovim;
  home.file."/home/denny/.gitconfig-my-github".source = ./apps/configs/.gitconfig-my-github;
  home.file."/home/denny/.gitconfig-iits-github".source = ./apps/configs/.gitconfig-iits-github;
  home.file."/home/denny/.gitconfig-iits-gitlab".source = ./apps/configs/.gitconfig-iits-gitlab;
  home.file."/home/denny/.gitconfig-maincard-gitlab".source = ./apps/configs/.gitconfig-maincard-gitlab;
  # home.file."/home/denny/.ssh/config".source = ./apps/configs/.ssh-config;
  home.file."/home/denny/.ctags".source = ./apps/configs/.ctags;
  home.file."/home/denny/.config/wezterm/wezterm.lua".source = ./apps/configs/wezterm.lua;
  home.file."/home/denny/.config/nchat/ui.conf".source = ./apps/configs/nchat/ui.conf;
  home.file."/home/denny/.config/keyd/default.conf".source = ./apps/configs/keyd/default.conf;
  home.file."/home/denny/.aws/config".source = ./apps/configs/aws-config;
  home.file."/home/denny/.config/nvim" = {
    source = ../apps-configs/neovim;
    recursive = true;
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
