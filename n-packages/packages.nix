{ pkgs }:

with pkgs;
[
  age
  karabiner-elements
  air
  ansible-language-server
  argocd
  autossh
  awscli
  bash
  bat
  cargo
  cmctl
  commitizen
  coreutils-full
  ctags
  delve
  devcontainer
  devpod
  direnv
  dive
  docker-compose
  docker-compose-language-service
  fd
  fluxcd
  git
  gitflow
  gnugrep
  gnupg
  gnused
  go
  go-swagger
  golangci-lint
  golangci-lint-langserver
  goose
  gopls
  grc
  hackgen-nf-font
  hadolint
  helm-ls
  hugo
  imagemagick
  jfrog-cli
  jq
  julia-bin
  k9s
  kail # kubectl plugin
  kdash # simple dashboard for kubernetes
  kube-capacity # kubectl plugin
  kube-linter
  kubecolor
  kubectl
  kubectl-doctor # kubectl plugin
  kubectl-example # kubectl plugin
  kubectl-explore # kubectl plugin
  kubectl-gadget # kubectl plugin
  kubectl-images
  kubectl-tree # kubectl plugin
  kubelogin-oidc # kubectl plugin
  kubepug # kubectl plugin
  kubernetes-helm
  kubernetes-helmPlugins.helm-unittest
  kustomize
  lazygit
  lemonade
  lsd
  lua-language-server # LS for NeoVim
  markdownlint-cli2 # LS for NeoVim
  marksman
  maven
  neovim
  nerdfonts
  nil
  nix-prefetch-git
  nixfmt-rfc-style
  nodePackages.bash-language-server
  nodePackages.dockerfile-language-server-nodejs
  nodePackages.eslint
  nodePackages.node2nix
  nodePackages.pnpm
  nodePackages.prettier
  nodePackages.vscode-html-languageserver-bin
  nodePackages.vscode-json-languageserver
  nodePackages.vue-language-server
  nodejs_22
  obsidian
  openjdk
  openssh
  ov
  pgadmin4-desktopmode
  php
  php81Packages.composer
  podman
  podman-compose
  popeye
  python3
  python312Packages.python-lsp-server
  rakkess
  ranger
  redis
  restic
  ripgrep
  ruby
  scrcpy
  shfmt
  sops
  stern
  stylua
  terraform
  terraform-ls
  terragrunt
  tflint
  thefuck
  tig
  tree
  unrar
  vim
  vscode-langservers-extracted
  watch
  wget
  yaml-language-server
  yamlfmt
  yarn
  yq-go
  zoxide
]
