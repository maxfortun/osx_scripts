#!/bin/bash
# kAELogOut                     = 'logo',
# kAEReallyLogOut               = 'rlgo',
# kAEShowRestartDialog          = 'rrst',
# kAEShowShutdownDialog         = 'rsdn'

#Shut down without showing a confirmation dialog:
#osascript -e 'tell app "System Events" to shut down'
#
#Shut down after showing a confirmation dialog:
#osascript -e 'tell app "loginwindow" to «event aevtrsdn»'
#
#Restart without showing a confirmation dialog:
#osascript -e 'tell app "System Events" to restart'
#
#Restart after showing a confirmation dialog:
#osascript -e 'tell app "loginwindow" to «event aevtrrst»'
#
#Log out without showing a confirmation dialog:
#osascript -e 'tell app "System Events" to  «event aevtrlgo»'
#
#Log out after showing a confirmation dialog:
#osascript -e 'tell app "System Events" to log out'

#Go to sleep (pmset):
#pmset sleepnow
#
#Go to sleep (AppleScript):
#osascript -e 'tell app "System Events" to sleep'
#
#Put displays to sleep (10.9 and later):
#pmset displaysleepnow



osascript -e 'tell app "loginwindow" to "event aevtrrst"'

