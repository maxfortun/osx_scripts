#!/bin/bash

if [ -z "$1" ]; then 
	echo "Usage: $0 <api>"
	echo "Usage: $0 <domain> <service> <id>"
	echo "e.g. $0 services"
	echo "e.g. $0 light turn_off home_living_floor"
fi

if [ -n "$3" ]; then
	domain=$1
	service=$2
	id=$3
	method=POST
	api="services/$domain/$service"
	data="{\"entity_id\": \"$domain.$id\"}"
else
	method=GET
	api=$1
fi

PASSWORD=$(grep api_password: /Users/max/.homeassistant/configuration.yaml | awk '{ print $2 }')

curl -s -X $method \
    -H "x-ha-access: $PASSWORD" \
    -H "Content-Type: application/json" \
	-d "$data" \
    "http://localhost:8123/api/$api" | python -m json.tool



