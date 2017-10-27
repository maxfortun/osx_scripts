#!/bin/bash

cd $(dirname $0)

if ! ./receiverStatus.sh; then
	SHOULD_TURN_RECEIVER_OFF=true
	./receiverOn.sh
fi

prefixes=("Дети" "Повторяю")

for (( i=0; i<2; i++ )); do
	if [ -n "${prefixes[$i]}" ]; then
		prefix="${prefixes[$i]}"
	fi
	echo say -v Milena "$prefix, время идти мыться и готовиться ко сну."
	sleep 2
done

if [ "$SHOULD_TURN_RECEIVER_OFF" = "true" ]; then
	./receiverOff.sh
fi


exit 1


