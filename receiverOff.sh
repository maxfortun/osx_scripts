#!/bin/bash

cd $(dirname $0)

state=$(Applications/homeassistant/haAPI.sh states/media_player.living | ./node_modules/.bin/jp state | /usr/bin/sed 's/^"//g;s/"$//g')

[ "$state" = "off" ] && exit

tvId=$(./tvId.sh)
[ -z "$tvId" ] && { echo "tvId is not set. Use tvId.sh to set it."; exit 1; }
./tvOff.sh

Applications/homeassistant/haAPI.sh media_player turn_off living
for (( i=0; i<10; i++ )); do
	./receiverState.sh || exit
	sleep 1
done

