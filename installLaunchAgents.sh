#!/bin/bash

SWD=$(dirname $0)
OFS=$IFS
IFS=$(echo -en "\n\b")
for file in LaunchAgents/$1*.plist; do
	basename=$(basename $file)
	echo "Installing $basename"
	cp $file ~/Library/LaunchAgents/
	launchctl unload -w ~/Library/LaunchAgents/$basename
	launchctl load -w ~/Library/LaunchAgents/$basename
done
IFS=$OFS

