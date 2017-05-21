#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/receiverOn"
	do shell script "curl http://localhost:8080/sendCommand/tvOn"
	-- say "Entertainment on"
end run

