on run
	say "Turning receiver off"
	do shell script "curl http://localhost:8080/sendCommand/receiverOff"
end run

