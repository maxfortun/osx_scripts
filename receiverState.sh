#!/bin/bash

cd $(dirname $0)

# Usage: $0 <source> <volume>
# e.g. $0 HDMI1 0.75

power=$1
source=$2
volume=$3

if [ -n "$power" ]; then
	./receiverPower.sh $power >&2
	[ "$power" = "off" ] && exit
fi

if [ -n "$source" -a "$source" != "undefined" ]; then
	./receiverSource.sh $source >&2
fi

if [ -n "$volume" -a "$volume" != "undefined" ]; then
	./receiverVolume.sh $volume >&2
fi

state=$(./haAPI.sh states/media_player.living)
power=$(echo "$state" | ./node_modules/.bin/jp state | /usr/bin/sed 's/^"//g;s/"$//g')
source=$(echo "$state" | ./node_modules/.bin/jp attributes.source | sed 's/^"//g;s/"$//g')
volume=$(echo "$state" | ./node_modules/.bin/jp attributes.volume_level | sed 's/^"//g;s/"$//g')

echo "$power" "$source" "$volume"
[ "$power" = "on" ]

