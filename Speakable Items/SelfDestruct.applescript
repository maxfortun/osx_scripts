#!/usr/bin/osascript

on run
	say "Self destruct activated"
	delay 1
	set i to 10
	say "Self destruct in "
	repeat while i > 0
		say i
		set i to i - 1
		delay 1
	end repeat
	say "Just kidding"
end run

