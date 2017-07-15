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

	do shell script scriptsPath & "/receiverOff.sh"
end run

