#!/bin/bash
oldState="$1"
newState="$2"

OSX_SCRIPTS=$(defaults read ~/Library/Preferences/user scriptsPath)

export PATH="$PATH:/usr/local/bin:$OSX_SCRIPTS"

case "$newState" in 
	on)
		date +%s > "$0.on"
		sleep 2
		if [ -f $(dirname $0)/state_changed_binary_sensor.dacha_terrace_hi_motion.sh.on ]; then
			echo "$0: Hi sensor hit. May be humans"
			exit
		fi
		echo "$0: No hi sensor hit. May be cats"

	;;

	off)
		[ -f "$0.on" ] && rm "$0.on"
	;;
esac



