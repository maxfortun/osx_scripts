#!/bin/bash

cd $(dirname $0)
receiverId=$(./receiverId.sh)
[ -z "$receiverId" ] && { echo "receiverId is not set. Use receiverId.sh to set it."; exit 1; }

tvId=$(./tvId.sh)
[ -z "$tvId" ] && { echo "tvId is not set. Use tvId.sh to set it."; exit 1; }
./tvOff.sh

./haAPI.sh media_player turn_off rxv683_fea8d2
for (( i=0; i<10; i++ )); do
	./receiverStatus.sh || exit
	sleep 1
done

