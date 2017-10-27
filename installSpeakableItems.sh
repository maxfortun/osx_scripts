#!/bin/bash

SWD=$(dirname $0)
OFS=$IFS
IFS=$(echo -en "\n\b")
for file in Speakable\ Items/$1*.applescript; do
	basename=$(basename $file .applescript)
	osacompile -o ~/Library/Speech/Speakable\ Items/"$basename.scpt" "$file"
	$SWD/registerSpeachCommand.sh ~/Library/Speech/Speakable\ Items/"$basename.scpt"
done
IFS=$OFS

