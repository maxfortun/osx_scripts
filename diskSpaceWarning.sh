#!/bin/bash
minFreeSpace=$1

launchctl unload -w /System/Library/LaunchAgents/com.apple.diskspaced.plist
launchctl stop com.apple.diskspaced
killall -STOP diskspaced

if [ -n "$minFreeSpace" ]; then
	defaults write com.apple.diskspaced minFreeSpace $minFreeSpace
	launchctl load -w /System/Library/LaunchAgents/com.apple.diskspaced.plist
	launchctl start com.apple.diskspaced
fi

cat <<__EOT__
Add below to /var/db/launchd.db/com.apple.launchd/overrides.plist and reboot

<key>com.apple.diskspaced</key>
<dict>
        <key>Disabled</key>
        <true/>
</dict>


__EOT__

