#!/bin/bash
oldState="$1"
newState="$2"

if ! [ "$oldState" = "off" -a "$newState" = "on" ]; then
	exit
fi

OSX_SCRIPTS=$(defaults read ~/Library/Preferences/user scriptsPath)

export PATH="$PATH:/usr/local/bin:$OSX_SCRIPTS"

id
env

echo $OSX_SCRIPTS/haAPI.sh switch turn_off dacha_back_lawn \| /usr/bin/at now +1 hour
echo $OSX_SCRIPTS/haAPI.sh switch turn_off dacha_back_lawn | /usr/bin/at now +1 hour

