on run
	say "Turning receiver volume up"
	repeat with once from 1 to 20
		try
			do shell script "curl http://localhost:8080/sendCommand/receiverVolumeUp"
			delay 1
		end try
	end repeat
end run

