#!/bin/bash

cd $(dirname $0)
receiverId=$(./receiverId.sh)
[ -z "$receiverId" ] && { echo "receiverId is not set. Use receiverId.sh to set it."; exit 1; }

tvId=$(./tvId.sh)
[ -z "$tvId" ] && { echo "tvId is not set. Use tvId.sh to set it."; exit 1; }
./tvOff.sh

./haAPI.sh media_player turn_off living
for (( i=0; i<10; i++ )); do
	./receiverState.sh || exit
	sleep 1
done

