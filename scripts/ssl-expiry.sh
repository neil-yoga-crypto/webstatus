#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: `basename $0` [domain]"
    exit
fi

EXPIRY_DATE=`echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -noout -dates | grep notAfter | sed 's/notAfter=//g' | sed 's/ GMT//g' | sed -E 's/[[:digit:]]{2}:[[:digit:]]{2}:[[:digit:]]{2}[[:blank:]]+//g'`
echo $EXPIRY_DATE
