#!/bin/bash

cd $(dirname $0)

state=$(./haAPI.sh states/media_player.rxv683_fea8d2 | node_modules/.bin/jp state | sed 's/^"//g;s/"$//g')
[ "$state" = "on" ]

