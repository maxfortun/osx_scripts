#!/bin/bash

cd $(dirname $0)
./haAPI.sh light turn_on home_living_track brightness:255
./haAPI.sh light turn_on home_living_floor brightness:255

