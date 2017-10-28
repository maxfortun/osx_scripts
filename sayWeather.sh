#!/bin/bash
cd $(dirname $0)

export PATH="$PATH:/usr/local/bin"

if [ ! -x node_modules/.bin/jp ]; then
	if ! which npm >/dev/null; then
		echo "NodeJS is required. Please install."
		exit
	fi
	npm install jp-cli
fi

RECEIVER_STATE=$(./receiverState.sh)
if [ "$RECEIVER_STATE" = "off" ]; then
	./receiverOn.sh
fi

wanIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
loc=$(curl -s https://ipinfo.io/$wanIP/loc)
api=$(curl -s -L https://api.weather.gov/points/$loc)
url=$(echo "$api" | node_modules/.bin/jp properties.forecast | sed 's/^"//g;s/"$//g')
curl -s $url | egrep '"name"|"detailedForecast"'|head -2|cut -d'"' -f4|xargs say

if [ "$RECEIVER_STATE" = "off" ]; then
	./receiverOff.sh
fi

