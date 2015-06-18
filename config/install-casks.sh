#!/bin/bash

source ./config/header.sh sudo

if is_installed brew && is_pkg_installed brew-cask; then

	echo "Installing Homebrew Casks..."

	export HOMEBREW_CASK_OPTS='--appdir=/Applications'

	install_cask google-chrome
	install_cask sublime-text
	install_cask flux

	echo "Installing Quick Look plugins..."

	install_cask qlstephen
	install_cask qlmarkdown
	install_cask quicklook-json
	install_cask betterzipql
	install_cask suspicious-package
	qlmanage -r

	echo "Installing additional plugins..."

	install_cask colorpicker-hex
	install_cask silverlight
	install_cask java

else

	echo "Homebrew Cask is not installed."

fi
