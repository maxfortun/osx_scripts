#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <designation>"
	echo "where designation is what you want computer to call you."
	exit
fi

defaults write ~/Library/Preferences/user designation "$1"
