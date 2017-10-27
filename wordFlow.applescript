#!/usr/bin/osascript

on run
	set prefsFolder to (path to preferences from user domain) as text -- the user's preferences folder
	set plistFile to POSIX path of (prefsFolder & "user") -- the plist file, minus extension
	
	try -- test for file and read values if there
		(plistFile & ".plist") as POSIX file as alias
		set scriptsPath to (do shell script "defaults read " & plistFile & " scriptsPath")
	on error errmess -- no file, so make one
		log errmess & ". You may want to defaults write ~/Library/Preferences/user scriptsPath scripts path here"
		#error number -128
		return
	end try
	
	set wordList to (read scriptsPath & "/wordFlow.words" as Çclass utf8È using delimiter linefeed)
	
	log "Starting up with " & wordList
	repeat --keep listening until we're done
		log "Cycle"
		tell application "SpeechRecognitionServer"
			set theWord to listen continuously for wordList with identifier "wordFlow" with section title "Word Flow" -- giving up after timeoutValue
			log "word "
			log theWord
			
			-- exit repeat
		end tell
		
		log "out"
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

