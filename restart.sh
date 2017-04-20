#!/bin/bash
# kAELogOut                     = 'logo',
# kAEReallyLogOut               = 'rlgo',
# kAEShowRestartDialog          = 'rrst',
# kAEShowShutdownDialog         = 'rsdn'
osascript -e 'tell app "loginwindow" to "event aevtrrst"'

