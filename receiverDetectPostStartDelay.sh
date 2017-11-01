#!/bin/bash

echo "Listen to the first number you hear. That's the delay in seconds."
./receiverOff.sh
./receiverOn.sh
start=$(date +"%s")
for (( i=0; i<10; i++)); do
	now=$(date +"%s")
	delay=$(( now-start ))
	./haAPI.sh states/media_player.living 
	echo $delay
	say $delay
	sleep 1
done
