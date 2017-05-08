#!/usr/bin/osascript

on run
	do shell script "defaults -currentHost write com.apple.screensaver idleTime 0"
	say "Screensaver off"
end run

