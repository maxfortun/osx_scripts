#!/usr/bin/osascript

tell application "Terminal"
	set P to properties of front window
	id of P
end tell
