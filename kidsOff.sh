#!/bin/bash

cd $(dirname $0)

if ! ./receiverState.sh; then
	RECEIVER_CONTROL=true
	./receiverOn.sh
fi

./receiverSource.sh HDMI1

prefixes=("Дети" "Повторяю")

for (( i=0; i<2; i++ )); do
	if [ -n "${prefixes[$i]}" ]; then
		prefix="${prefixes[$i]}"
	fi
	echo say -v Milena "$prefix, время идти мыться и готовиться ко сну."
	sleep 2
done

if [ "$RECEIVER_CONTROL" = "true" ]; then
	./receiverOff.sh
fi


exit 1


