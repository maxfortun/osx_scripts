#!/bin/bash

cd $(dirname $0)

tvId=$(./tvId.sh)
[ -z "$tvId" ] && { echo "tvId is not set. Use tvId.sh to set it."; exit 1; }

./receiverState.sh on HDMI1

for (( i=0; i<10; i++ )); do
	system_profiler SPDisplaysDataType -detailLevel mini | egrep "($tvId)" >/dev/null 2>/dev/null && exit
	curl http://localhost:8080/sendCommand/tvOn
	for (( j=0; j<10; j++ )); do
		system_profiler SPDisplaysDataType -detailLevel mini | egrep "($tvId)" >/dev/null 2>/dev/null && exit
		sleep 1
	done
done
exit 1


