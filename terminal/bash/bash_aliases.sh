#!/bin/bash
# bash_aliases.sh
# Caleb Evans

# Enable aliases to be run as root
alias sudo='sudo '

# Reloads .bash_profile
alias reload='exec $SHELL -l'

# Colorize directory listings
alias ls='ls --color=auto'

# Colorize grep matches (but not for piped output)

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Colorize tree output
if type tree &> /dev/null; then
	alias tree='tree -C'
fi

# Displays information related to the system's ability to sleep
alias whyunosleep='pmset -g assertions | grep --color=never Sleep'