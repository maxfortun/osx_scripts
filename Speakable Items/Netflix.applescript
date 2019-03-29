#!/usr/bin/osascript

on run
	set prefsFolder to (path to preferences from user domain) as text -- the user's preferences folder
	set plistFile to POSIX path of (prefsFolder & "user") -- the plist file, minus extension

	try -- test for file and read values if there
		(plistFile & ".plist") as POSIX file as alias
		set netflixUrl to (do shell script "defaults read " & plistFile & " netflixUrl")
	on error errmess -- no file, so make one
		log errmess & ". You may want to defaults write ~/Library/Preferences/user netflixUrl netflix url here"
	end try

	tell application "Safari" 
		activate
		open location netflixUrl
	end tell
        -- say "Opening cartoons"
end run

