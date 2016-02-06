#!/bin/bash
# .bashrc
# Caleb Evans

updatedotfiles() {
	# if our dotfiles are up to date, check for updates
	if [ -n "$(git diff)" ]; then
		echo '(Dotfiles have working directory changes; skipping check for updates)'
	else
		echo 'Updating dotfiles...'
		git fetch origin &> /dev/null
		git merge --ff-only &> /dev/null
		if [ $? != 0 ]; then
			echo '(Could not update dotfiles as there are merge conflicts)'
		fi
	fi
}

updateall() {
	# update homebrew
	echo '(Upgrading brew packages in the background...)' && \
	brew upgrade --all && \
	echo '(brew updgrade complete.)'
}

updatedotfiles

source ~/.bash/exports.sh
source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/config.sh
source ~/.bash/prompt.sh
source ~/.bash/git.sh
source ~/.bash/atom.sh
# personal.sh is for users of my dotfiles who wish to add personal configuration that is not tracked by the repository
if [ -f ~/.bash/personal.sh ]; then
	source ~/.bash/personal.sh
fi
