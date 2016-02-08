__check_network_connection() {
  wget -q --spider $1

  if [ $? -ne 0 ]; then
      echo 'fail'
      return
  fi
}

__update_dot_files() {
  prompt_verbose "Checking for updates to dotfiles in $DOTFILES_DIR..."

	# if we have unsaved changes in our dotfiles, we can't update.
	if [ -n "$(cd $DOTFILES_DIR && git diff)" ]; then
		prompt_err 'Dotfiles have working directory changes; skipping check for updates.'
    return
  fi

  # Only display get fetch if we're verbose logging
  prompt_verbose "$(cd $DOTFILES_DIR && git fetch origin)"

  # If we aren't behind master, there's nothing to update.
  # Notify and we're done
  if [ -z "$(cd $DOTFILES_DIR && git status | grep behind)" ]; then
      prompt_verbose 'Dotfiles up-to-date.'
      return
  fi

  # Attempt to update, but only if we can do so without hitting
  # merge conflicts.
  prompt_verbose 'Updating dotfiles...'
  prompt_verbose "$(cd $DOTFILES_DIR && git merge --ff-only)"

  # If the update fails with a nonzero error code, tell the user
  if [ $? != 0 ]; then
    prompt_err 'Could not update dotfiles as there are merge conflicts.'
    return
  fi

  prompt_notify 'Dotfiles updated.'
}

__update_brew() {
  prompt_verbose 'Checking for new brew packages...'


	local brew_output="$(brew upgrade --all)"
  prompt_verbose $brew_output

  # If brew output nothing, then it was already up-to-date.
  if [ -z "$brew_output" ]; then
    prompt_verbose 'Brew packages up-to-date.'
    return
  fi

  prompt_notify 'Brew packages updated.'
}


update() {
  if [ -n "$(__check_network_connection https://github.com)" ]; then
    prompt_err "Could not connect to github.com - are you sure you are online?"
    return
  fi
  __update_dot_files
  __update_brew
}

update
