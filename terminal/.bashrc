#!/bin/bash
# .bashrc

source ~/.bash/exports.sh
source ~/.bash/prompt.sh

DOTFILES_DIR="$HOME/dotfiles"
updatedotfiles() {
	# if our dotfiles are up to date, check for updates
	if [ -n "$(cd $DOTFILES_DIR && git diff)" ]; then
		echo 'Dotfiles have working directory changes; skipping check for updates.'
	else
		git fetch origin &> /dev/null
		if [ -n "$(git status | grep behind)" ]; then
			echo 'Updating dotfiles...'
			git merge --ff-only
			if [ $? != 0 ]; then
				echo 'Could not update dotfiles as there are merge conflicts.'
			fi
		fi
	fi
}

updatebrew() {
	brew upgrade --all
}

updatedotfiles
updatebrew

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
