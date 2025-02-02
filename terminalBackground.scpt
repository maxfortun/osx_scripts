#!/usr/bin/osascript

on run argv
	set red to (item 1 of argv)
	set green to (item 2 of argv)
	set blue to (item 3 of argv)

	tell application "Terminal"
		set background color of front window to {red, green, blue}
	end tell
end run
