#!/bin/bash

source ./config/header.sh sudo

if ! is_installed brew; then

	echo "Installing Command Line Tools..."
	xcode-select --install

	echo "Installing Homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

else

	echo "Already installed: Homebrew"

fi

if is_installed brew; then

	echo "Installing Homebrew packages..."

	install_pkg bash

	if [ -f /usr/local/bin/bash -a $SHELL != /usr/local/bin/bash ]; then
		echo "Changing login shell to Bash 4..."
		sudo chsh -s /usr/local/bin/bash $USER
	else
		echo "Login shell already set to Bash 4"
	fi

	tap_repo homebrew/versions
	install_pkg bash-completion2
	install_pkg colordiff
	tap_repo homebrew/dupes
	install_pkg coreutils
	install_pkg git

	install_pkg nvm
	source /usr/local/opt/nvm/nvm.sh
	nvm install stable
	nvm alias default stable

	if is_installed npm; then

		echo "Installing npm packages..."

		install_npm_pkg bower
		install_npm_pkg grunt-cli
		install_npm_pkg gulp

	fi

	install_pkg ruby

	if is_installed gem; then

		echo "Installing Ruby gems..."

		install_gem sass

	fi

	tap_repo caskroom/cask
	install_pkg brew-cask

else

	echo "Homebrew is not installed."

fi
