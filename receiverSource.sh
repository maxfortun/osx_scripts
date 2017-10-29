#!/bin/bash

cd $(dirname $0)

./receiverOn.sh

./haAPI.sh media_player select_source rxv683_fea8d2 source:$1

