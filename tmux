# mouse bindings
setw -g mode-mouse on
setw -g mouse-select-pane on
setw -g mouse-select-window on
set -g mouse-resize-pane on

# clock colors
set-window-option -g clock-mode-style 12
set-window-option -g clock-mode-colour "#ff8000"

# status bar
set -g status-bg black
set -g status-fg white

# window status
setw -g window-status-format "#[bg=green]#[fg=colour0] #I #[fg=brightgreen]#[bg=black] #W "
setw -g window-status-current-format "#[bg=brightyellow]#[fg=black] #I #[fg=colour11]#[bg=red] #W "
setw -g window-status-current-bg colour0
setw -g window-status-current-fg colour11
setw -g window-status-current-attr dim
setw -g window-status-bg green
setw -g window-status-fg black
setw -g window-status-attr dim
setw -g window-status-content-bg colour0
setw -g window-status-content-fg colour11
setw -g window-status-content-attr blink

set -g status-interval 2

# Info on right
set -g status-right-length 30
set -g status-right '#[fg=magenta] %Y-%m-%d#[fg=colour8]//#[fg=green]%H:%M#[fg=colour8]//#[fg=cyan][#S]'

# Info on left
set -g status-left-length 30
set -g status-left "#[fg=colour11]#[bg=cyan] @#(hostname) "

# reload the config file with C-R
bind R source-file ~/.tmux.conf \; display-message "Config reloaded..."

# Stop people annoying me by connecting with a tiny terminal
setw -g aggressive-resize on