#!/bin/bash

cd $(dirname $0)

# need this calendar: http://schools.nyc.gov/Calendar/default.htm#phone
# https://calendar.google.com/calendar/ical/doecalendars%40gmail.com/public/basic.ics

if [ ! -x icalBuddy ]; then
	echo "This app relies on icalBuddy for school closure dates. icalBuddy is missing."
	exit
fi

# check if school is closed, and exit if it is
#./icalBuddy -ic "NYC Public School Calendar" eventsFrom:"Nov 23, 2017" to:"Nov 23, 2017"| grep -i school.*closed >/dev/null && exit 1
./icalBuddy -ic "NYC Public School Calendar" eventsToday| grep -i school.*closed >/dev/null && exit 1

if ! ./receiverState.sh; then
	RECEIVER_CONTROL=true
	./receiverOn.sh
fi


prefixes=("Дети" "Повторяю")

for (( i=0; i<2; i++ )); do
	if [ -n "${prefixes[$i]}" ]; then
		prefix="${prefixes[$i]}"
	fi
	say -v Milena "$prefix, время одеваться и готовиться к выходу."
	sleep 2
done

if [ "$RECEIVER_CONTROL" = "true" ]; then
	./receiverOff.sh
fi


exit 1


