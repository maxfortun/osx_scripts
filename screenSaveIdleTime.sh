#!/bin/bash

if [ -z "$1" ]; then
	defaults -currentHost read com.apple.screensaver idleTime 
	exit
fi

defaults -currentHost write com.apple.screensaver idleTime $1
