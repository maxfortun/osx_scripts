#!/bin/bash

cd $(dirname $0)

./receiverState.sh && exit

./haAPI.sh media_player turn_on living

sleep 15
