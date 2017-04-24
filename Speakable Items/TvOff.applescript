#!/usr/bin/osascript

on run
	say "Turning tv off"
	do shell script "curl http://localhost:8080/sendCommand/tvOff"
end run

