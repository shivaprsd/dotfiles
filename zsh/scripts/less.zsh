# vim ft=sh

# Custom colors for less (and man)
# Bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
# Underline
export LESS_TERMCAP_us=$(tput smul; tput setaf 3)
export LESS_TERMCAP_ue=$(tput sgr0)
# Standout
export LESS_TERMCAP_so=$(tput setab 2; tput setaf 15)
export LESS_TERMCAP_se=$(tput sgr0)
