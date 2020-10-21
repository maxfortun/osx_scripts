#!/bin/bash
oldState="$1"
newState="$2"

OSX_SCRIPTS=$(defaults read ~/Library/Preferences/user scriptsPath)

export PATH="$PATH:/usr/local/bin:$OSX_SCRIPTS"

case "$newState" in 
	on)
		date +%s > "$0.on"
	;;

	off)
		[ -f "$0.on" ] && rm "$0.on"
	;;
esac


