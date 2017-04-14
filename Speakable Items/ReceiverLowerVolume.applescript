on run
	say "Turning receiver volume down"
	repeat with once from 1 to 10
		try
			do shell script "curl http://localhost:8080/sendCommand/receiverVolumeDown"
			delay 1
		end try
	end repeat
end run

