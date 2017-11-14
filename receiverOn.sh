#!/bin/bash

cd $(dirname $0)

./receiverPower.sh on

[ -n "$1" ] && sleep "$1"

