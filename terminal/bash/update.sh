DOTFILES_DIR="$HOME/dotfiles"

updatedotfiles() {
  prompt_verbose 'Checking for updates to dotfiles...'
	# if our dotfiles are up to date, check for updates
	if [ -n "$(cd $DOTFILES_DIR && git diff)" ]; then
		prompt_err 'Dotfiles have working directory changes; skipping check for updates.'
	else
		prompt_verbose "$(git fetch origin)"
		if [ -n "$(git status | grep behind)" ]; then
			prompt_verbose 'Updating dotfiles...'
			prompt_verbose "$(git merge --ff-only)"
			if [ $? != 0 ]; then
				prompt_err 'Could not update dotfiles as there are merge conflicts.'
			fi
		fi
    prompt $CYAN 'Dotfiles up-to-date.'
	fi
}

updatebrew() {
  prompt_verbose 'Checking for new brew packages...'
	prompt_verbose "$(brew upgrade --all)"
  prompt_notify 'Brew packages up-to-date.'
}

updatedotfiles
updatebrew
