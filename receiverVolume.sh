#!/bin/bash

cd $(dirname $0)

./receiverPower.sh on > /dev/null

if [ -z "$1" ]; then
	./haAPI.sh states/media_player.living | node_modules/.bin/jp attributes.volume_level | sed 's/^"//g;s/"$//g'
	exit
fi

./haAPI.sh media_player volume_set living volume_level:$1

