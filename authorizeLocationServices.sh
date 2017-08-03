#!/bin/bash

app="$1"

if [ ! -x "$app" ]; then 
	echo "Usage: $0 <application>"
	exit
fi

SWD=$(pwd)
cd "$(dirname $app)"
APP_PATH="$(pwd)/$(basename $app)"
cd "$SWD"

PLIST=/var/db/locationd/clients.plist

ID="com.apple.locationd.executable-$APP_PATH"
echo "ID:$ID"
dict=$(defaults read $PLIST $ID)
if [[ "$dict" =~ "Authorized =" ]]; then
	echo "$dict"
	exit
else
	dict=${dict//'\\'/'\'}
	dict=${dict/{/{ 
    Authorized = 1;}
fi

defaults write $PLIST $ID "$dict"

