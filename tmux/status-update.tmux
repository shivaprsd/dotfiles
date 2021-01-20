#!/bin/sh
# Update options used by status bar from env

if [ "$COLORFGBG" = '15;0' ]; then
	fg=white; bg=black
else
	fg=black; bg=white
fi
[ "$TERM_PROFILE" != solarized ] && acc=bright
tmux set-option -g @fg $fg
tmux set-option -g @bg $bg
tmux set-option -g @acc "$acc"
# Refresh the status bar
tmux source-file $TMUX_HOME/status-bar.conf
