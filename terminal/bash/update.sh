updatedotfiles() {
  prompt_verbose 'Checking for updates to dotfiles...'
	# if our dotfiles are up to date, check for updates
	if [ -n "$(cd $DOTFILES_DIR && git diff)" ]; then
		prompt_err 'Dotfiles have working directory changes; skipping check for updates.'
	else
		prompt_verbose "$(git fetch origin)"
		if [ -n "$(git status | grep behind)" ]; then
			prompt_verbose 'Updating dotfiles...'
			local update_output="$(git merge --ff-only)"
			if [ $? != 0 ]; then
				prompt_err 'Could not update dotfiles as there are merge conflicts.'
      else
        if [ -n "$update_output" ]; then
          prompt_verbose $update_output
          prompt_notify 'Dotfiles updated'
        else
          prompt_notify 'Dotfiles up-to-date.'
        fi
			fi
		fi
	fi
}

updatebrew() {
  prompt_verbose 'Checking for new brew packages...'
	prompt_verbose "$(brew upgrade --all)"
  prompt_notify 'Brew packages up-to-date.'
}

updatedotfiles
updatebrew
