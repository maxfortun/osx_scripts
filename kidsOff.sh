#!/bin/bash

cd $(dirname $0)

./receiverOn.sh

prefixes=("Дети" "Повторяю")

for (( i=0; i<2; i++ )); do
	if [ -n "${prefixes[$i]}" ]; then
		prefix="${prefixes[$i]}"
	fi
	echo say -v Milena "$prefix, время идти мыться и готовиться ко сну."
	sleep 2
done

./receiverOff.sh

exit 1


