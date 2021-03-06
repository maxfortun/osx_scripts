#!/bin/bash

SWD=$(dirname $0)
OFS=$IFS
IFS=$(echo -en "\n\b")
for file in Speakable\ Items/$1*.applescript; do
	basename=$(basename $file .applescript)
	echo "Installing $basename"
	osacompile -o ~/Library/Speech/Speakable\ Items/"$basename.scpt" "$file"
	$SWD/registerSpeechCommand.sh ~/Library/Speech/Speakable\ Items/"$basename.scpt"
done
IFS=$OFS

