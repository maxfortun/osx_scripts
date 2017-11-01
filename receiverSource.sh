#!/bin/bash

cd $(dirname $0)

./receiverOn.sh > /dev/null

if [ -z "$1" ]; then
	./haAPI.sh states/media_player.living | node_modules/.bin/jp attributes.source | sed 's/^"//g;s/"$//g'
	exit
fi

./haAPI.sh media_player select_source living source:$1

