#!/bin/bash

cd $(dirname $0)
Applications/homeassistant/haAPI.sh light turn_on home_living_track brightness:35
Applications/homeassistant/haAPI.sh light turn_off home_living_floor
Applications/homeassistant/haAPI.sh light turn_off home_kitchen_track

