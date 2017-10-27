#!/usr/bin/osascript

on run
	log "Starting up"
	repeat --keep listening until we're done
		tell application "SpeechRecognitionServer"
			--listen for phrases
			set theWord to listen continuously for {"i", "am", "here", "there"} with identifier "wordFlow" with section title "Word Flow"
		end tell

		log "word " & theWord

		-- exit repeat
	end repeat
end run

on quit
	log "Quiting"
	-- stop listening
	tell application "SpeechRecognitionServer"
		stop listening for identifier "wordFlow"
	end tell

	--remember to continue quit!
	continue quit
end quit



