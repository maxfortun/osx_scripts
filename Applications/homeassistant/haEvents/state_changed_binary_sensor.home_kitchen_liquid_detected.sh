#!/bin/bash
oldState="$1"
newState="$2"

if ! [ "$oldState" = "off" -a "$newState" = "on" ]; then
	exit
fi

cd $(dirname $0)

export PATH="$PATH:/usr/local/bin:../../.."

RECEIVER_STATE=$(receiverState.sh)
receiverState.sh on HDMI1 0.75 2>/dev/null

# Give receiver time to boot up
[[ "$RECEIVER_STATE" =~ ^on\ HDMI1 ]] || sleep 15

prefixes=("Внимание" "Повторяю")

for (( i=0; i<2; i++ )); do
        if [ -n "${prefixes[$i]}" ]; then
                prefix="${prefixes[$i]}"
        fi
        say -v Milena "$prefix, на кухне растекается вода."
        sleep 2
done

receiverState.sh $RECEIVER_STATE 2>/dev/null

exit 1


