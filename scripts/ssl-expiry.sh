#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: `basename $0` [domain]"
    exit
fi

EXPIRY_DATE=`echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -noout -dates | grep notAfter | sed 's/notAfter=//g' | sed 's/ GMT//g' | sed -E 's/[[:digit:]]{2}:[[:digit:]]{2}:[[:digit:]]{2}[[:blank:]]+//g'`


if [ -z "$EXPIRY_DATE" ]
then
     :
else
      echo $EXPIRY_DATE
      DIR=`dirname $0`
      echo $EXPIRY_DATE | python $DIR/ssl-expiry-to-days.py
fi
