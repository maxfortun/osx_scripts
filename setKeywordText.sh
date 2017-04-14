#!/bin/bash

keywordText="$*"

if [ -z "$keywordText" ]; then
	echo "Usage: $0 <some text here>"
	echo "e.g.: $0 Computer"
	exit
fi

defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs "KeywordText.en_US" "$keywordText"
killall -HUP DictationIM

