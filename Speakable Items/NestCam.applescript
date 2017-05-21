#!/usr/bin/osascript

on run
	set prefsFolder to (path to preferences from user domain) as text -- the user's preferences folder
	set plistFile to POSIX path of (prefsFolder & "user") -- the plist file, minus extension

	try -- test for file and read values if there
		(plistFile & ".plist") as POSIX file as alias
		set nestCamId to (do shell script "defaults read " & plistFile & " nestCamId")
	on error errmess -- no file, so make one
		log errmess & ". You may want to defaults write ~/Library/Preferences/user nestCamId nest-cam-id-here"
	end try

	tell application "Safari"
		activate
		open location "http://home.nest.com/camera/" & nestCamId
	end tell
        -- say "Opening Nest Camera"
end run

