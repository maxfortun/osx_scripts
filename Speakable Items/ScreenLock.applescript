#!/usr/bin/osascript

on run
	say "Locking screen"
	tell application "System Events" 
		start current screen saver
	end tell
end run

