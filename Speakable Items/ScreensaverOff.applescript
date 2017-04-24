#!/usr/bin/osascript

on run
	say "Turning screensaver off"
	do shell script "defaults -currentHost write com.apple.screensaver idleTime 0"
end run

