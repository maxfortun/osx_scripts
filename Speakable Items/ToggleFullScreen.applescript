#!/usr/bin/osascript

(*
  Indicates if the active window of the active application is currently in fullscreen mode.
  Fails silently in case of error and returns false.
*)
on isFullScreen()
  tell application "System Events"
    try
      tell front window of (first process whose frontmost is true)
        return get value of attribute "AXFullScreen"
      end tell
    end try
  end tell

  return false
end isFullScreen

(*
  Toggles fullscreen status of the active window of the active application.
  Return value indicates if the window is in fullscreen mode *after* toggling.
  Fails silently in case of error, e.g., if the active application doesn't support fullscreen mode, and returns false.
*)
on toggleFullScreen()
  set isFullScreenAfter to false
  tell application "System Events"
    try
      tell front window of (first process whose frontmost is true)
        set isFullScreen to get value of attribute "AXFullScreen"
        set isFullScreenAfter to not isFullScreen
        set value of attribute "AXFullScreen" to isFullScreenAfter
      end tell
    end try
  end tell
end toggleFullScreen

my toggleFullScreen()
