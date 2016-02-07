DOTFILES_DIR="$HOME/dotfiles"

updatedotfiles() {
	# if our dotfiles are up to date, check for updates
	if [ -n "$(cd $DOTFILES_DIR && git diff)" ]; then
		prompt $RED 'Dotfiles have working directory changes; skipping check for updates.'
	else
		git fetch origin &> /dev/null
		if [ -n "$(git status | grep behind)" ]; then
			echo 'Updating dotfiles...'
			git merge --ff-only
			if [ $? != 0 ]; then
				prompt $RED 'Could not update dotfiles as there are merge conflicts.'
			fi
		fi
    prompt $BLUE 'Dotfiles up-to-date.'
	fi
}

updatebrew() {
	brew upgrade --all
  prompt $BLUE 'Brew packages up-to-date.'
}

updatedotfiles
updatebrew
