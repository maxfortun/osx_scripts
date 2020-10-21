#!/bin/bash

cd $(dirname $0)
Applications/homeassistant/haAPI.sh light turn_on home_living_track brightness:255
Applications/homeassistant/haAPI.sh light turn_on home_living_floor brightness:255

