#!/bin/bash

cd $(dirname $0)

./haAPI.sh media_player turn_on rxv683_fea8d2

for (( i=0; i<10; i++ )); do
	./receiverState.sh && exit
	sleep 1
done

sleep 15
