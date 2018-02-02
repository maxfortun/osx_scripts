#!/bin/bash

HASS="/opt/local/Library/Frameworks/Python.framework/Versions/3.6/bin/hass --daemon"

ps auxwww|grep "$HASS"|grep -v grep|awk '{ print $2 }'|while read pid; do
	kill $pid
done

$HASS


