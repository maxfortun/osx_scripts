on run
	say "Turning screensaver on"
	do shell script "defaults -currentHost write com.apple.screensaver idleTime 600"
end run

