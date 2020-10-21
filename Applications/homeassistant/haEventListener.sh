#!/bin/bash
SWD=$(dirname $0)

LOG="$SWD/$(basename $0 .sh).log"

# Close STDOUT FD
exec 1<&-

# Close STDERR FD
exec 2<&-

# Open STDOUT to $LOG
# may want to redirect into a process for rolling like >(split ...)
exec 1> "$LOG"

# Redirect STDERR to STDOUT
exec 2>&1


script -q /dev/null $SWD/haAPI.sh stream | while IFS= read -r line; do
	line=${line//$'\r'}
	line=${line//$'\n'}

	if ! [[ "$line" =~ (data:\ )(\{.*\})$ ]]; then
		continue
	fi
	data="${BASH_REMATCH[2]}"
	read -r event_type entity_id old_state new_state < <(echo "$data" | /opt/local/bin/jq -r '.event_type + " " + .data.entity_id + " " + .data.old_state.state + " " + .data.new_state.state')
	script="$SWD/haEvents/${event_type}_${entity_id}.sh"
	echo "$(date +'%Y/%M/%d %H:%M:%S') $script ${old_state} ${new_state}"
	[ -x "$script" ] && "$script" "${old_state}" "${new_state}" &
done


