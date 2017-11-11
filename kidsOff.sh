#!/bin/bash
export PATH="$PATH:/usr/local/bin"

cd $(dirname $0)

if ! ./receiverState.sh; then
	RECEIVER_CONTROL=true
	./receiverOn.sh
fi

RECEIVER_SOURCE=$(./receiverSource.sh)

if [ "$RECEIVER_SOURCE" != "HDMI1" ]; then
	./receiverSource.sh HDMI1
fi

prefixes=("Дети" "Повторяю")

for (( i=0; i<2; i++ )); do
	if [ -n "${prefixes[$i]}" ]; then
		prefix="${prefixes[$i]}"
	fi
	say -v Milena "$prefix, время идти мыться и готовиться ко сну."
	sleep 2
done

if [ "$RECEIVER_SOURCE" != "HDMI1" ]; then
	./receiverSource.sh $RECEIVER_SOURCE
fi

if [ "$RECEIVER_CONTROL" = "true" ]; then
	./receiverOff.sh
fi


exit 1


