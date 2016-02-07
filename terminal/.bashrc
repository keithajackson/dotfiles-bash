#!/bin/bash
# .bashrc

source ~/.bash/exports.sh
source ~/.bash/prompt.sh
source ~/.bash/update.sh
source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/config.sh
source ~/.bash/git.sh
source ~/.bash/atom.sh
source ~/.bash/node.sh

# personal.sh is for users of my dotfiles who wish to add personal configuration that is not tracked by the repository
if [ -f ~/.bash/personal.sh ]; then
	source ~/.bash/personal.sh
fi
