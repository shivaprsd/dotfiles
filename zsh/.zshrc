# ZLE: key bindings {{{
autoload -U select-word-style
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
select-word-style bash
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -e
bindkey -e '^[[3~' delete-char
bindkey -e '^[[Z' reverse-menu-complete
bindkey -e '^[[A' up-line-or-beginning-search
bindkey -e '^[[B' down-line-or-beginning-search
# }}}

# History {{{
HISTFILE="$XDG_CACHE_HOME/zhistory"
HISTSIZE=200
SAVEHIST=2000
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt share_history
# }}}

# Completion: options {{{
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zcompdump"
_comp_options+=(globdots)

setopt auto_cd
setopt complete_in_word
# setopt extended_glob; unsetopt nomatch
# setopt menu_complete
# setopt path_dirs
# unsetopt case_glob
# }}}

# Completion: styles {{{
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle -e ':completion:*:approximate:*' max-errors \
	'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
# }}}

# Completion: colors & formats {{{
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:default' list-colors 'di=34' 'ln=35' 'so=32' 'pi=33' \
	'ex=31' 'bd=34;46' 'cd=34;43' 'su=30;41' 'sg=30;46' 'tw=30;42' 'ow=30;43'
zstyle ':completion:*:*:kill:*:processes' list-colors \
	'=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{green}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# }}}

# Prompt & scripts {{{
PROMPT='%F{magenta}%1~%f %F{%(?.yellow.red)}❯%f '
clear && macchina --theme Lithium

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
for script in "$ZDOTDIR"/scripts/*.zsh; do . "$script"; done

stty -ixon
# }}}

# vim:foldmethod=marker:foldlevel=0
