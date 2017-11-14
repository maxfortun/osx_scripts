#!/bin/bash

cd $(dirname $0)
./haAPI.sh light turn_on home_living_track brightness:35
./haAPI.sh light turn_off home_living_floor
./haAPI.sh light turn_off home_kitchen_track

