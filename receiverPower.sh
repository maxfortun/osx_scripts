#!/bin/bash 

cd $(dirname $0)

state=( $(Applications/homeassistant/haAPI.sh states/media_player.yamaha_receiver | /opt/local/bin/jq -r .state) )
power=${state[0]}

if [ -z "$1" ]; then
	echo "$power"
	exit
fi

[ "$power" = "$1" ] && exit 

if [ "$1" = "off" ]; then
	tvId=$(./tvId.sh)
	[ -z "$tvId" ] && { echo "tvId is not set. Use tvId.sh to set it."; exit 1; }
	./tvOff.sh
fi

Applications/homeassistant/haAPI.sh media_player turn_$1 yamaha_receiver

