{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      noremap <Down> <Nop>
      noremap <Left> <Nop>
      noremap <Right> <Nop>
      noremap <Up> <Nop>
      set clipboard=unnamed
      set expandtab
      set number
      set shiftwidth=2
      set tabstop=2
      vnoremap <leader>64 y:let @+ = system('base64 --decode', @")<cr><esc>
      vnoremap <leader><leader>64 y:echo system('base64 --decode', @")<cr>
      vnoremap p "_dp
      vnoremap P "_dP
    '';
    plugins =
      with pkgs.vimPlugins; [
        yankring
        vim-nix
        packer-nvim
      ];
  };
}
