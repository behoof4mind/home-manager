{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      require("behoof4mind")
    '';
    plugins =
      with pkgs.vimPlugins; [
        yankring
        vim-nix
        packer-nvim
      ];
  };
}
