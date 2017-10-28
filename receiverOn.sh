#!/bin/bash

cd $(dirname $0)

./receiverState.sh && exit

./haAPI.sh media_player turn_on rxv683_fea8d2

sleep 15
