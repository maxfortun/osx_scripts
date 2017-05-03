#!/usr/bin/osascript

on run
	set prefsFolder to (path to preferences from user domain) as text -- the user's preferences folder
	set plistFile to POSIX path of (prefsFolder & "user") -- the plist file, minus extension

	try -- test for file and read values if there
		(plistFile & ".plist") as POSIX file as alias
		set cartoonsUrl to (do shell script "defaults read " & plistFile & " cartoonsUrl")
	on error errmess -- no file, so make one
		log errmess & ". You may want to defaults write ~/Library/Preferences/user cartoonsUrl cartoons url here"
	end try

	tell application "Safari" to open location cartoonsUrl
        say "Opening cartoons"
end run

