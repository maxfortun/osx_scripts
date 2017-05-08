#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <true/false>"
	echo "Whether to acknowledge command or not"
	exit
fi

defaults write ~/Library/Preferences/user ackCommand "$1"
