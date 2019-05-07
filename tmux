# clock colors
set-window-option -g clock-mode-style 12
set-window-option -g clock-mode-colour "#ff8000"

# status bar
set -g status-bg colour236
set -g status-fg white

# window status
setw -g window-status-format "#[bg=colour10]#[fg=colour236] #I #[fg=colour8]#[bg=colour236] #W "
setw -g window-status-current-format "#[bg=brightyellow]#[fg=colour236] #I #[fg=colour11]#[bg=red] #W "
setw -g window-status-current-attr dim
setw -g window-status-content-attr blink

set -g status-interval 2

# Info on right
set -g status-right-length 30
set -g status-right '#[fg=colour11]#[bg=cyan] %Y #[fg=colour11]#[bg=colour236] %m #[fg=colour11]#[bg=cyan] %d #[bg=colour236]#[fg=colour11] %H #[fg=colour11]#[bg=cyan] %M '

# Info on left
set -g status-left-length 30
set -g status-left "#[fg=colour11]#[bg=cyan] @#(hostname) "

# reload the config file with C-R
bind R source-file ~/.tmux.conf \; display-message "Config reloaded..."

# Stop people annoying me by connecting with a tiny terminal
setw -g aggressive-resize on

# Start windows and panes at 1, not 0
set -g base-index 1
set -g pane-base-index 1

# A longer scrollback
set -g history-limit 10000

# vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
bind-key -T copy-mode-vi C-h select-pane -L
bind-key -T copy-mode-vi C-j select-pane -D
bind-key -T copy-mode-vi C-k select-pane -U
bind-key -T copy-mode-vi C-l select-pane -R
bind-key -T copy-mode-vi C-\ select-pane -l

set-option -g default-shell /usr/bin/fish
