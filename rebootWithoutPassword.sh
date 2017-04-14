#!/bin/bash

supported=$(fdesetup supportsauthrestart)
if [ "$supported" != "true" ]; then
	echo "authrestart not supported"
	exit
fi

sudo fdesetup authrestart


