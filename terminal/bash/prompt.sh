#!/bin/bash
# prompt.sh
# Caleb Evans

# Set aboslute colors for prompt message types
export NOTIFY_COLOR=$CYAN
export ERR_COLOR=$RED
export VERBOSE_COLOR=$GREEN
# Outputs ANSI escape sequence for the given color code
__set_color() {
	echo -n "\[\033[${1}m\]"
}

# Resets color escape sequences
__re__set_color() {
	__set_color 0
}

__set_color_eval() {
	echo -ne "\033[${1}m"
}

prompt() {
  __set_color_eval $1
  echo -n "$2"
	__set_color_eval 0
	echo
}

prompt_notify() {
	if [ "$PROMPT_NOTIFY_ENABLED" -eq 1 ]; then
		prompt $NOTIFY_COLOR "> $1 <"
	fi
}

prompt_err() {
	if [ "$PROMPT_ERR_ENABLED" -eq 1 ]; then
		prompt $ERR_COLOR "> $1 <"
	fi
}

prompt_verbose() {
	if [ "$PROMPT_VERBOSE_ENABLED" -eq 1 ]; then
		prompt $VERBOSE_COLOR "$1"
	fi
}

# Outputs a succinct and useful interactive prompt
# Escape sequences: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
__output_ps1() {

    # Define a local constant for the separator between items in the prompt
	local SEPARATOR=' : '

	# Output name of current working directory (with ~ denoting HOME)
	__set_color $PURPLE_BOLD
	echo -n '\W'
	__set_color $WHITE_BOLD
	echo -n "$SEPARATOR"

	# If working directory is a virtualenv
	if [ ! -z "$VIRTUAL_ENV" ]; then

		# Output Python version used by virtualenv
		__set_color $PURPLE_BOLD
		if [ -f "$VIRTUAL_ENV"/bin/python2 ]; then
			echo -n "python2"
		elif [ -f "$VIRTUAL_ENV"/bin/python3 ]; then
			echo -n "python3"
		fi
		__set_color $WHITE_BOLD
		echo -n "$SEPARATOR"

	fi

	# If working directory is (or resides in) a git repository
	if git rev-parse --git-dir &> /dev/null; then

		# Output name of current branch
		__set_color $PURPLE_BOLD
		echo -n "$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
		__set_color $WHITE_BOLD
		echo -n "$SEPARATOR"

	fi

	# Output $ for user and # for root
	__set_color $PURPLE_BOLD
	echo -n '\$ '
	__re__set_color

}

# Activates/deactivates Python virtualenv depending on the current directory
__detect_python_virtualenv() {

	local virtualenv=./"$VIRTUAL_ENV_NAME"
	# If current directory has a virtualenv that is not itself
	if [ -d "$virtualenv" -a "$virtualenv" != "$PWD" ]; then
		# Activate virtualenv if it is not already active
		if [ -z "$VIRTUAL_ENV" -o "$VIRTUAL_ENV" != "$virtualenv" ]; then
			source "$virtualenv"/bin/activate
		fi
	else
		# Otherwise, deactivate any active virtualenv
		if [ ! -z "$VIRTUAL_ENV" ]; then
			deactivate
		fi
	fi

}

# Run the following for each new command
__update_prompt_command() {

	# Activate/deactivate virtualenvs as necessary when changing directories
	__detect_python_virtualenv
	export PS1="$(__output_ps1)"
	# Write in-memory command history to file
	history -a
	# Ensure current working directory carries to new tabs
	update_terminal_cwd 2> /dev/null

}
PROMPT_COMMAND="__update_prompt_command"
