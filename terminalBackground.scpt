#!/usr/bin/osascript

on run argv
	set red to (item 1 of argv)
	set green to (item 2 of argv)
	set blue to (item 3 of argv)

	tell application "Terminal"
		set current_window to front window
		set tab_count to count of tabs of current_window
		-- log "Tabs: " & tab_count & " -- " 

		if tab_count > 1 then end run

		set background color of window 1 to {red, green, blue}
	end tell
end run
