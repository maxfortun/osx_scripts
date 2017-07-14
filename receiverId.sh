#!/bin/bash

id=$(basename $0 .sh)

if [ -n "${1}" ]; then
	defaults write ~/Library/Preferences/user $id "$1"
elif [ -z ${1+x} ]; then
	defaults read ~/Library/Preferences/user $id 
else
	defaults delete ~/Library/Preferences/user $id 
fi


