#!/bin/bash

SWD=$(dirname $0)
OSX_SCRIPTS=$(defaults read ~/Library/Preferences/user scriptsPath)

OFS=$IFS
IFS=$(echo -en "\n\b")
for file in LaunchAgents/$1*.plist; do
	basename=$(basename $file)
	echo "Installing $basename"
	if [ ! -d ~/Library/LaunchAgents ]; then
		mkdir -p ~/Library/LaunchAgents
	fi
	sed "s#\${OSX_SCRIPTS}#$OSX_SCRIPTS#g" $file > ~/Library/LaunchAgents/$basename

	launchctl unload -w ~/Library/LaunchAgents/$basename
	launchctl load -w ~/Library/LaunchAgents/$basename
done
IFS=$OFS

