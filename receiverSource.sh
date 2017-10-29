#!/bin/bash

cd $(dirname $0)

./receiverOn.sh > /dev/null

if [ -z "$1" ]; then
	./haAPI.sh states/media_player.rxv683_fea8d2 | node_modules/.bin/jp attributes.source | sed 's/^"//g;s/"$//g'
	exit
fi

./haAPI.sh media_player select_source rxv683_fea8d2 source:$1

