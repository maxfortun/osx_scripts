#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/receiverSourceGames"
	-- say "Receiver source games"
end run

