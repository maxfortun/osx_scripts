#!/bin/bash

cd $(dirname $0)

state=$(./haAPI.sh states/media_player.living | ./node_modules/.bin/jp state | /usr/bin/sed 's/^"//g;s/"$//g')
echo "$state"

[ "$state" = "on" ]

