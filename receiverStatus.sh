#!/bin/bash

cd $(dirname $0)

receiverId=$(./receiverId.sh)
[ -z "$receiverId" ] && { echo "receiverId is not set. Use receiverId.sh to set it."; exit 1; }

tvId=$(./tvId.sh)
[ -z "$tvId" ] && { echo "tvId is not set. Use tvId.sh to set it."; exit 1; }

system_profiler SPDisplaysDataType -detailLevel mini | egrep "($receiverId|$tvId)" >/dev/null
