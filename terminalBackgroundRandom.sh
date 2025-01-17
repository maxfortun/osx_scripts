#!/bin/bash -x

function random_color() {
	local color=$(( 65535 - ( RANDOM % 10000 ) ))
	echo $color
}

red=$(random_color)
green=$(random_color)
blue=$(random_color)

$(dirname $)/terminalBackground.scpt $red $green $blue
