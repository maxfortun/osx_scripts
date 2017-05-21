#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/tvSource"
	-- say "Tv source"
end run

