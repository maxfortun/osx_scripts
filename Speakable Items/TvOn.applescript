#!/usr/bin/osascript

on run
	do shell script "curl http://localhost:8080/sendCommand/tvOn"
	say "Tv on"
end run

