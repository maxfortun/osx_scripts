#!/bin/bash

cd $(dirname $0)

./receiverPower.sh on > /dev/null

if [ -z "$1" ]; then
	Applications/homeassistant/haAPI.sh states/media_player.living | node_modules/.bin/jp attributes.source | sed 's/^"//g;s/"$//g'
	exit
fi

Applications/homeassistant/haAPI.sh media_player select_source living source:$1

