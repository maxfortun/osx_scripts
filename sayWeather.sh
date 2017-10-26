#!/bin/bash
cd $(dirname $0)
if [ ! -x node_modules/.bin/jp ]; then
	if ! which npm >/dev/null; then
		echo "NodeJS is required. Please install."
		exit
	fi
	npm install jp-cli
fi

if ! ./receiverStatus.sh; then
	SHOULD_TURN_RECEIVER_OFF=true
	./receiverOn.sh
fi

wanIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
loc=$(curl -s https://ipinfo.io/$wanIP/loc)
api=$(curl -s -L https://api.weather.gov/points/$loc)
url=$(echo "$api" | node_modules/.bin/jp properties.forecast | sed 's/^"//g;s/"$//g')
curl -s $url | egrep '"name"|"detailedForecast"'|head -4|cut -d'"' -f4|xargs say

if [ "$SHOULD_TURN_RECEIVER_OFF" = "true" ]; then
	./receiverOff.sh
fi

