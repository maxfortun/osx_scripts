#!/bin/bash
export PATH="$PATH:/usr/local/bin"

cd $(dirname $0)

RECEIVER_STATE=$(./receiverState.sh)
./receiverState.sh on HDMI1 0.75 2>/dev/null

# Give receiver time to boot up
[[ "$RECEIVER_STATE" =~ ^on\ HDMI1 ]] || sleep 15

prefixes=("Дети" "Повторяю")

for (( i=0; i<2; i++ )); do
	if [ -n "${prefixes[$i]}" ]; then
		prefix="${prefixes[$i]}"
	fi
	say -v Milena "$prefix, время идти мыться и готовиться ко сну."
	sleep 2
done

./receiverState.sh $RECEIVER_STATE 2>/dev/null

exit 1


