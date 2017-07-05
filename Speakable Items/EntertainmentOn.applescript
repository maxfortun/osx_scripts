#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/receiverOn"
	delay 1
	do shell script "curl http://localhost:8080/sendCommand/tvOn"
	-- say "Entertainment on"
end run

