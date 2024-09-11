{ pkgs, vars }:

{
  programs = {
    tmux = {
      enable = true;
      baseIndex = 1;
      historyLimit = 50000;
      resizeAmount = 1;
      keyMode = "vi";

      plugins = with pkgs; [
        { plugin = tmuxPlugins.pain-control; }
        { plugin = tmuxPlugins.yank; }
        {
          plugin = tmuxPlugins.prefix-highlight;
          extraConfig = "set -g @prefix_highlight_show_copy_mode 'on'";
        }
        {
          plugin = tmuxPlugins.extrakto;
          extraConfig = "set -g @extrakto_split_direction 'v'";
        }
        { plugin = tmuxPlugins.resurrect; }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = "set -g @continuum-save-interval '5'";
        }
      ];
      extraConfig = ''
        # allow applications to manage clipboard
        set -s set-clipboard on

        # List of plugins
        set -g @plugin "tmux-plugins/tpm"
        set -g @plugin "tmux-plugins/tmux-sensible"
        set -g @plugin "MunifTanjim/tmux-mode-indicator"
        set -g @plugin "xamut/tmux-spotify"

        # Kubecontext in status line
        set -g @plugin "masa0221/tmux-kube-status"
        set -g status-right "#{kube_status}"
        set -g status-left "#{tmux_mode_indicator}"
        set -g status-justify centre
        set -g window-status-format "#[fg=#16161e,bg=#394b70] #I:#W "
        set -g window-status-current-format "#[fg=#16161e,bg=#82aaff, bold] #I:#W "
        set -g status-style fg=#86e1fc,bg=#1e2030
        set -g @kube-status-format-default "#[fg=#16161e,bg=#82aaff,bold]"
        set -g @kube-status-prod-pattern ".*production.*"
        set -g @kube-status-format-prod "#[fg=#16161e,bg=#ff757f,bold]"
        set -g @kube-status-stage-pattern ".*staging.*"
        set -g @kube-status-format-stage "#[fg=#16161e,bg=#82aaff,bold]"
        set -g @kube-status-dev-pattern ".*development.*"
        set -g @kube-status-format-dev "#[fg=#16161e,bg=#82aaff,bold]"
        set -g @mode_indicator_copy_mode_style "fg=#16161e,bg=#c3e88d,bold"
        set -g @mode_indicator_prefix_mode_style "fg=#16161e,bg=#394b70,bold"
        set -g @mode_indicator_empty_mode_style "fg=#16161e,bg=#82aaff,bold"

        # Increase panes numbers timeout
        set -g display-panes-time 5000

        # Address vim mode switching delay (http://superuser.com/a/252717/65504)
        set -s escape-time 0

        set -g history-limit 50000

        # Increase tmux messages display duration from 750ms to 4s
        set -g display-time 4000

        # Refresh 'status-left' and 'status-right' more often, from every 15s to 5s
        set -g status-interval 5

        # Set default shell
        set-option -g default-shell "/Users/${vars.userName}/.nix-profile/bin/fish"

        # Upgrade $TERM
        set -g default-terminal "screen-256color"

        # Emacs key bindings in tmux command prompt (prefix + :) are better than
        # vi keys, even for vim users
        set -g status-keys emacs

        # Focus events enabled for terminals that support them
        set -g focus-events on

        # Super useful when using "grouped sessions" and multi-monitor setup
        setw -g aggressive-resize on

        # Easier and faster to the next pane
        bind -n C-n select-pane -t :.+

        bind -n M-1 select-window -t 1 # Select window 1 with CMD+1
        bind -n M-2 select-window -t 2 # Select window 2 with CMD+2
        bind -n M-3 select-window -t 3 # Select window 3 with CMD+3
        bind -n M-4 select-window -t 4 # Select window 4 with CMD+4
        bind -n M-5 select-window -t 5 # Select window 5 with CMD+5
        bind -n M-6 select-window -t 6 # Select window 6 with CMD+6
        bind -n M-7 select-window -t 7 # Select window 7 with CMD+7
        bind -n M-8 select-window -t 8 # Select window 8 with CMD+8
        bind -n M-9 select-window -t:$ # Select last window with CMD+9

        bind-key -T copy-mode-vi v send-keys -X begin-selection

        run '~/.tmux/plugins/tpm/tpm'
      '';
    };
  };

}
