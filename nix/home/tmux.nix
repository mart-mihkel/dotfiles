{
    programs.tmux = {
        enable = true;
        extraConfig = ''
            VISUAL=nvim
            EDITOR=nvim

            set -g mode-keys vi
            set -g status-keys vi

            set -g status-bg "#181818"
            set -g status-fg "#f8f8f8"
            set -g status-right ""
        '';
    };
}
