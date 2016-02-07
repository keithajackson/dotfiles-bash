#!/bin/bash
# prompt.sh
# Caleb Evans

# Colors
# ANSI color reference: http://www.termsys.demon.co.uk/vtansi.htm#colors

# Standard colors
export BLACK='0;30'
export RED='0;31'
export GREEN='0;32'
export YELLOW='0;33'
export BLUE='0;34'
export PURPLE='0;35'
export CYAN='0;36'
export WHITE='0;37'

# Bold colors
export BLACK_BOLD='1;30'
export RED_BOLD='1;31'
export GREEN_BOLD='1;32'
export YELLOW_BOLD='1;33'
export BLUE_BOLD='1;34'
export PURPLE_BOLD='1;35'
export CYAN_BOLD='1;36'
export WHITE_BOLD='1;37'

# Use green, underlined text for grep matches
export GREP_COLOR='4;32'

# Outputs ANSI escape sequence for the given color code
set_color() {
	echo -n "\[\e[${1}m\]"
}

# Resets color escape sequences
__reset_color() {
	set_color 0
}

# Outputs a succinct and useful interactive prompt
# Escape sequences: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
__output_ps1() {

    # Define a local constant for the separator between items in the prompt
	local SEPARATOR=' : '

	# Output name of current working directory (with ~ denoting HOME)
	set_color $PURPLE_BOLD
	echo -n '\W'
	set_color $WHITE_BOLD
	echo -n "$SEPARATOR"

	# If working directory is a virtualenv
	if [ ! -z "$VIRTUAL_ENV" ]; then

		# Output Python version used by virtualenv
		set_color $PURPLE_BOLD
		if [ -f "$VIRTUAL_ENV"/bin/python2 ]; then
			echo -n "python2"
		elif [ -f "$VIRTUAL_ENV"/bin/python3 ]; then
			echo -n "python3"
		fi
		set_color $WHITE_BOLD
		echo -n "$SEPARATOR"

	fi

	# If working directory is (or resides in) a git repository
	if git rev-parse --git-dir &> /dev/null; then

		# Output name of current branch
		set_color $PURPLE_BOLD
		echo -n "$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
		set_color $WHITE_BOLD
		echo -n "$SEPARATOR"

	fi

	# Output $ for user and # for root
	set_color $PURPLE_BOLD
	echo -n '\$ '
	__reset_color

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
