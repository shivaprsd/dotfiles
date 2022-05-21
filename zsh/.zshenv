# Follow XDG Base directory specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export TERMINFO_DIRS="$XDG_CONFIG_HOME/terminfo"
export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"

# Disable Apple's shell-state code; using zsh's SHARE_HISTORY instead
SHELL_SESSIONS_DISABLE=1

# Tools
export EDITOR="$(which vim)"
export VISUAL="$EDITOR"
export PAGER="$(which less)"
export LESS="-R $LESS"
export CLICOLOR=1
export FZF_DEFAULT_OPTS='--no-mouse --height 80% --reverse --multi --info=inline'

# My own executables
export PATH="$PATH:$HOME/.local/bin"
