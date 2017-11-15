#!/bin/bash
export PATH="$PATH:/usr/local/bin"

cd $(dirname $0)

# need this calendar: http://schools.nyc.gov/Calendar/default.htm#phone
# https://calendar.google.com/calendar/ical/doecalendars%40gmail.com/public/basic.ics

if [ ! -x icalBuddy ]; then
	echo "This app relies on icalBuddy for school closure dates. icalBuddy is missing."
	exit
fi

# check if school is closed, and exit if it is
./icalBuddy -nc -ic "NYC Public School Calendar" eventsFrom:"$(date +'%b %d, %Y')" to:"$(date +'%b %d, %Y')" | /usr/bin/xargs | /usr/bin/egrep -i '(do not attend|school.*closed)' >/dev/null && exit 1

RECEIVER_STATE=$(./receiverState.sh)
./receiverState.sh on HDMI1 0.75 2>/dev/null

# Give receiver time to boot up
[[ "$RECEIVER_STATE" =~ ^on\ HDMI1 ]] || sleep 15

prefixes=("Дети" "Повторяю")

for (( i=0; i<2; i++ )); do
	if [ -n "${prefixes[$i]}" ]; then
		prefix="${prefixes[$i]}"
	fi
	say -v Milena "$prefix, время одеваться и готовиться к выходу."
	sleep 2
done

./receiverState.sh $RECEIVER_STATE 2>/dev/null

exit 1


