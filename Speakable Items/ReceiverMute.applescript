#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/receiverMute"
	-- say "Muting receiver"
end run

