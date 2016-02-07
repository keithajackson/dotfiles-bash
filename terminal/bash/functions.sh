#!/bin/bash
# functions.sh
# Caleb Evans

# Reloads entire shell, including .bash_profile and any activated virtualenv
reload() {
	deactivate 2> /dev/null
	exec $SHELL -l
}

# Flushes all DNS caches for OS X 10.10.4 and onward
flushdns() {
	sudo dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
}
