#!/bin/bash
# exports.sh
# Caleb Evans

# Reset PATH to original value (if shell was reloaded)
if [ ! -z "$OLDPATH" ]; then
	export PATH="$OLDPATH"
fi
export OLDPATH="$PATH"

# Ensure installed packages are recognized and preferred

# GNU core utilities
if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
	export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
	export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
fi
# Ruby gems
if [ -d /usr/local/opt/ruby/bin ]; then
	export PATH=/usr/local/opt/ruby/bin:$PATH
fi

# Miscellaneous environment variables

# Explicitly declare atom as default text editor
export EDITOR='atom'

# Number of lines of command history to keep in memory
export HISTSIZE=250
# Number of lines of command history to keep in file
export HISTFILESIZE=500
# Keep duplicate entries out of command history
export HISTCONTROL=ignoreboth:erasedups
# Keep potentially dangerous commands out of command history
export HISTIGNORE='rm *:git checkout *:git clean *:git reset *'

# Prevent Python from generating bytecode (*.pyc, __pycache__, etc.)
export PYTHONDONTWRITEBYTECODE=1

# Use /Applications for apps installed with Homebrew Cask
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

# The name of the virtualenv directory (within the respective project directory)
export VIRTUAL_ENV_NAME='.virtualenv'
