#!/bin/bash

SWD=$(dirname $0)
OFS=$IFS
IFS=$(echo -en "\n\b")
for file in Speakable\ Items/*.applescript; do
	basename=$(basename $file .applescript)
	osacompile -o ~/Library/Speach/Speakable\ Items/"$basename.scpt" "$file"
	$SWD/registerSpeachCommand.sh ~/Library/Speach/Speakable\ Items/"$basename.scpt"
done
IFS=$OFS

