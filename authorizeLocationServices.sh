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

#PLIST=/var/db/locationd/clients.plist
PLIST=$(pwd)/clients.plist

ID="com.apple.locationd.executable-$APP_PATH"
echo "ID:$ID"
dict=$(defaults read $PLIST $ID)
if ! [[ "$dict" =~ "Authorized =" ]]; then
	dict=${dict/{/{ 
    Authorized = 1;}
fi
dict=${dict/Authorized = 0/Authorized = 1}
dict=${dict/Whitelisted = 0/Whitelisted = 1}
dict=${dict/Requirement = [^;]*;/}

echo "$dict"
exit

dict=${dict//'\\'/'\'}
defaults write $PLIST $ID "$dict"
defaults read $PLIST $ID 

