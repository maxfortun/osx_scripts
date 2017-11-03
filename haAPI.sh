#!/bin/bash
# https://home-assistant.io/developers/rest_api/

if [ -z "$1" ]; then 
	echo "Usage: $0 <api>"
	echo "Usage: $0 <domain> <service> <id> [param:value] ..."
	echo "e.g. $0 services"
	echo "e.g. $0 light turn_off home_living_floor brightness:30"
fi

if [ -n "$3" ]; then
	domain=$1
	shift
	service=$1
	shift
	id=$1
	shift
	method=POST
	api="services/$domain/$service"
	data="{\"entity_id\": \"$domain.$id\""
	for param in $*; do
		name=${param%%:*}
		value=${param##*:}
		data="$data, \"$name\": \"$value\""
	done
	data="$data}"
else
	method=GET
	api=$1
fi

PASSWORD=$(grep api_password: /Users/max/.homeassistant/configuration.yaml | awk '{ print $2 }')

curl	-s -X $method \
	-H "x-ha-access: $PASSWORD" \
	-H "Content-Type: application/json" \
	-d "$data" \
	"http://localhost:8123/api/$api" | python -m json.tool



