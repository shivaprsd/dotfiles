# Inside tmux, shells inherit from tmux's session environment
if [ -n "$TMUX" ]; then return; fi

export TERM_PROFILE="Smyck"
export COLORFGBG='15;0'
FZF_DEFAULT_OPTS+=" --color=dark"
