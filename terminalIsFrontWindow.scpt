#!/usr/bin/osascript

tell application "Terminal"
	set W to front window
	set P to W's properties
	set B to P's bounds
	set fK to (item 1 of B) & "," & (item 2 of B)

	set Ks to 0

	repeat with W in windows
		set P to W's properties
		set B to P's bounds
		set K to (item 1 of B) & "," & (item 2 of B)
		if K = fK then
			set Ks to Ks  + 1
		end if
	end repeat

	return (Ks = 1)
end tell
