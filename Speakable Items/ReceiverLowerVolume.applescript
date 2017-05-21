#!/usr/bin/osascript

on run
	repeat with once from 1 to 20
		try
			do shell script "curl http://localhost:8080/sendCommand/receiverVolumeDown"
			delay 1
		end try
	end repeat
	-- say "Receiver volume down"
end run

