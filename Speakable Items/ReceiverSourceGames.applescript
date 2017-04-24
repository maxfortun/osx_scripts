#!/usr/bin/osascript

on run
	say "Switching receiver source to games"
	do shell script "curl http://localhost:8080/sendCommand/receiverSourceGames"
end run

