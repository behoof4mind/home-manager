{ config, pkgs, ... }:
{

  programs = {
    tmux = {
      enable = true;
      baseIndex = 1;
      historyLimit = 50000;
      resizeAmount = 1;
      keyMode = "vi";

      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.pain-control;
        }
        {
          plugin = tmuxPlugins.yank;
        }
        {
          plugin = tmuxPlugins.prefix-highlight;
          extraConfig = "set -g @prefix_highlight_show_copy_mode 'on'";
        }
        {
          plugin = tmuxPlugins.extrakto;
          extraConfig = "set -g @extrakto_split_direction 'v'";
        }
        {
          plugin = tmuxPlugins.resurrect;
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = "set -g @continuum-save-interval '5'";
        }
        {
          plugin = tmuxPlugins.mode-indicator;
          extraConfig = "set -g status-right '#{tmux_mode_indicator}'";
        }
      ];
      extraConfig = ''
        ${builtins.readFile ./configs/tmux.conf}
      '';
    };
  };

}
