#!/usr/bin/osascript

on run
	do shell script "defaults -currentHost write com.apple.screensaver idleTime 600"
	say "Screensaver on"
end run

