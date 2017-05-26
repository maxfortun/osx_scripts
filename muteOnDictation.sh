#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <true/false>"
	exit
fi

if [ "$1" = "true" ]; then
	echo "Muting on dictation"
	defaults delete com.apple.SpeechRecognitionCore AllowAudioDucking
	defaults delete com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMAllowAudioDucking
elif [ "$1" = "false" ]; then
	echo "Not muting on dictation"
	defaults write com.apple.SpeechRecognitionCore AllowAudioDucking -bool NO
	defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMAllowAudioDucking -bool NO
fi

