#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/receiverSourceTv"
	-- say "Receiver source tv"
end run

