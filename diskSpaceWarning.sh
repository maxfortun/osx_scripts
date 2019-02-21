#!/bin/bash
minFreeSpace=$1

launchctl unload -w /System/Library/LaunchAgents/com.apple.diskspaced.plist
launchctl stop com.apple.diskspaced
killall -STOP diskspaced

if [ -n "$minFreeSpace" ]; then
	defaults write com.apple.diskspaced minFreeSpace $minFreeSpace
	launchctl load -w /System/Library/LaunchAgents/com.apple.diskspaced.plist
	launchctl start com.apple.diskspaced
fi


