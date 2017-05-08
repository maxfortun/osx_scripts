#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/receiverOff"
	do shell script "curl http://localhost:8080/sendCommand/tvOff"
	say "Entertainment off"
end run

