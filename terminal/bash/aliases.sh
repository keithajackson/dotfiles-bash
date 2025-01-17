#!/bin/bash
# aliases.sh
# Caleb Evans

# Enable aliases to be run as root
alias sudo='sudo '
mkcd() {
	mkdir -p "$1" && cd "$1"
}
# Colorize directory listings
alias ls='ls --color=auto'
alias l='ls -la --color=auto'
# Colorize grep matches (but not for piped output)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Colorize diff output
if type colordiff &> /dev/null; then
	alias diff='colordiff'
fi

# Colorize tree output
if type tree &> /dev/null; then
	alias tree='tree -C'
fi
