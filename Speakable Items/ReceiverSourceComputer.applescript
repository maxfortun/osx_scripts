on run
	say "Switching receiver source to computer"
	do shell script "curl http://localhost:8080/sendCommand/receiverSourceComputer"
end run

