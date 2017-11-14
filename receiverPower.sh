#!/bin/bash

cd $(dirname $0)

state=( $(./haAPI.sh states/media_player.living | ./node_modules/.bin/jp state | /usr/bin/sed 's/^"//g;s/"$//g') )
power=${state[0]}

[ "$power" = "$1" ] && exit 

./haAPI.sh media_player turn_$1 living

