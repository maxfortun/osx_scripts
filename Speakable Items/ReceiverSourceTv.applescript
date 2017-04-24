#!/usr/bin/osascript

on run
	say "Switching receiver source to tv"
	do shell script "curl http://localhost:8080/sendCommand/receiverSourceTv"
end run

