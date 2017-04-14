#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <script> [command] [lang]"
	exit
fi

SWD=$(dirname $0)

SCRIPTS_DIR=~/Library/Speach/Speakable\ Items/

lwd=$(pwd)
scriptParam="$1"
scriptParam_name=$(basename "$scriptParam")
scriptParam_dir=$(dirname "$scriptParam")
[ -z "$scriptParam_dir" ] && scriptParam_dir="$SCRIPTS_DIR"
cd "$scriptParam_dir"
scriptParam_absdir=$(pwd)
scriptParam_abspath="$scriptParam_absdir/$scriptParam_name"

cd "$SCRIPTS_DIR"
script="$(pwd)/$scriptParam_name"

if [ "$script" !=  "$scriptParam_abspath" ]; then
	echo "$scriptParam must reside in $SCRIPTS_DIR."
	exit
fi

cd "$lwd"

script_name=${scriptParam_name%%.*}
KEY=Custom.$script_name

command=$2
if [ -z "$command" ]; then
	command=$(echo "$script_name" | sed 's/\([^[:blank:]]\)\([[:upper:]]\)/\1 \2/g')
fi
#command="$command %phrase"

lang=$3
if [ -z "$lang" ]; then
	lang="en_US"
fi

date=$(date -u +'%Y-%m-%d %H:%M:%S +0000')

bookmark=$($SWD/bookmark.py "$script"| xxd -g 4 | cut -d" " -f2-5|xargs)
read -r -d '' VALUE <<- _EOT_
{
	CustomBookmarkList = ( <$bookmark>);
    CustomCommands = {
        "$lang" =         (
            "$command"
        );
    };
    CustomFileNameList =     (
        "$scriptParam_name"
    );
    CustomModifyDate = "$date";
    CustomScope = "com.apple.speech.SystemWideScope";
    CustomType = File;
}
_EOT_

defaults write com.apple.speech.recognition.AppleSpeechRecognition.CustomCommands "$KEY" "$VALUE"
killall -HUP DictationIM

