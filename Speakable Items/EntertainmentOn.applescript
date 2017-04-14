on run
	say "Turning entertainment system off"
	do shell script "curl http://localhost:8080/sendCommand/receiverOff"
	do shell script "curl http://localhost:8080/sendCommand/tvOff"
end run

