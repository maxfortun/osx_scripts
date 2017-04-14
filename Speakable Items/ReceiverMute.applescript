on run
	say "Muting receiver"
	do shell script "curl http://localhost:8080/sendCommand/receiverMute"
end run

