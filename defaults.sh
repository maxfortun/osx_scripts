#!/bin/bash

# auto login on boot and start a screen saver
defaults write /Library/Preferences/com.apple.loginwindow autoLoginUserScreenLocked -bool true

# auto mount external drives on boot
defaults write /Library/Preferences/SystemConfiguration/autodiskmount AutomountDisksWithoutUserLogin -bool true


