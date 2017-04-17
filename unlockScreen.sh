#!/bin/bash

password="$1"
if [ -z "$password" ]; then
	echo "Usage: $0 <password>"
	exit
fi

osascript -e "tell application \"System Events\" keystroke \"$password\""
