#!/usr/bin/osascript

on run
	log "Quiting"
	-- stop listening
	tell application "SpeechRecognitionServer"
		stop listening for identifier "wordFlow"
		quit
	end tell
end quit



