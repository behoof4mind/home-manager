{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set shiftwidth=2
      set tabstop=2
      set expandtab
      set number
      set clipboard=unnamed
      noremap <Up> <Nop>
      noremap <Down> <Nop>
      noremap <Left> <Nop>
      noremap <Right> <Nop>
      vnoremap <leader>64 y:let @+ = system('base64 --decode', @")<cr><esc>
      vnoremap <leader><leader>64 y:echo system('base64 --decode', @")<cr>
    '';
    plugins =
      with pkgs.vimPlugins; [
        yankring
        vim-nix
      ];
  };
}
