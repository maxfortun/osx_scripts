on run
	say "Turning tv on"
	do shell script "curl http://localhost:8080/sendCommand/tvSource"
end run

