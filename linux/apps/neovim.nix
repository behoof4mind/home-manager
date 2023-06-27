{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      ${builtins.readFile ./configs/neovim/init.lua}
    '';
  };
}
