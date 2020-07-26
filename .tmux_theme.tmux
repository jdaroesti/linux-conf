#!/usr/bin/env bash

# Heavily inspired on sei40kr/tmux-onedark

main() {
  local green='colour114'
  local white='colour255'
  local black='colour0'
  local light_grey='colour241'
  local dark_grey='colour238'

  # Copy mode selection background
  tmux set-option -g mode-style "bg=${light_grey}"

  # Command mode bar
  tmux set-option -g message-style "bg=${dark_grey},fg=${white}"

  # Pane dividing lines
  tmux set-option -g pane-border-style "fg=default"
  tmux set-option -g pane-active-border-style "bg=default,fg=${green}"

  # Status bar (left)
  tmux set-option -g status-justify centre
  tmux set-option -g status-style "bg=${light_grey}"
  tmux set-option -g status-left ' #{prefix_highlight} #S '
  tmux set-option -g status-left-style "bg=${green},fg=${black}"

  # Prefix highlight
  tmux set-option -g @prefix_highlight_show_copy_mode 'on'
  tmux set-option -g @prefix_highlight_prefix_prompt 'Wait'
  tmux set-option -g @prefix_highlight_copy_prompt 'Copy'
  tmux set-option -g @prefix_highlight_fg ${black}
  tmux set-option -g @prefix_highlight_bg ${green}
  tmux set-option -g @prefix_highlight_copy_mode_attr "fg=${black},bg=${green}"

  # Status bar (right)
  tmux set-option -g status-right " CPU:#{cpu_percentage} #[bg=${dark_grey}] %m/%d %R "
  tmux set-option -g status-right-style "bg=${dark_grey},fg=${white}"

  # Status bar (center)
  tmux set-window-option -g window-status-format ' #I:#W '
  tmux set-window-option -g window-status-style "bg=${dark_grey}"
  tmux set-window-option -g window-status-current-format ' #I:#W '
  tmux set-window-option -g window-status-current-style "bg=${green},fg=${black}"
  tmux set-window-option -g window-status-separator ''
}

main
