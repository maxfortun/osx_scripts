#!/bin/bash

cd $(dirname $0)
receiverId=$(./receiverId.sh)
[ -z "$receiverId" ] && { echo "receiverId is not set. Use receiverId.sh to set it."; exit 1; }

tvId=$(./tvId.sh)
[ -z "$tvId" ] && { echo "tvId is not set. Use tvId.sh to set it."; exit 1; }
./tvOff.sh

for (( i=0; i<10; i++ )); do
	system_profiler SPDisplaysDataType -detailLevel mini | egrep "($receiverId|$tvId)" >/dev/null 2>/dev/null || exit
	curl http://localhost:8080/sendCommand/receiverOff
	sleep 10
done
exit 1


