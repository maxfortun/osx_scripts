on run
	say "Turning entertainment system on"
	do shell script "curl http://localhost:8080/sendCommand/receiverOn"
	do shell script "curl http://localhost:8080/sendCommand/tvOn"
end run

