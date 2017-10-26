#!/bin/bash

cd $(dirname $0)
receiverId=$(./receiverId.sh)
[ -z "$receiverId" ] && { echo "receiverId is not set. Use receiverId.sh to set it."; exit 1; }
system_profiler SPDisplaysDataType -detailLevel mini | egrep "($receiverId)" 
