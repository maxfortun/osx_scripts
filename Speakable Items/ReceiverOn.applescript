#!/usr/bin/osascript

on run
	say "Turning receiver on"
	do shell script "curl http://localhost:8080/sendCommand/receiverOn"
end run

