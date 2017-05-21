#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/receiverSourceComputer"
	-- say "Receiver source computer"
end run

