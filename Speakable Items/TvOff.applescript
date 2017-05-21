#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/tvOff"
	-- say "Tv off"
end run

