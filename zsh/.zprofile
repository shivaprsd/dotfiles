# Inform shell about the current Terminal.app profile
# Inside tmux, shells inherit from tmux's session environment
if [ -n "$TMUX" ]; then return; fi
# Avoid profile check in SSH connections
if [ -n "$SSH_TTY" ]; then
	profile="Smyck"
else
	profile="$(osascript -e 'tell first window of application "Terminal"
				get name of current settings of selected tab
				end tell')"
fi
export TERM_PROFILE=${(L)profile% *}
if [ "${(L)profile#* }" = light ]; then
	export COLORFGBG='0;15'
	FZF_DEFAULT_OPTS+=" --color=light"
else
	export COLORFGBG='15;0'
	FZF_DEFAULT_OPTS+=" --color=dark"
fi
unset profile
