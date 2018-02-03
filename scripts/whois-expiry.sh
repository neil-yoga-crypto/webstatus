#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: `basename $0` [domain]"
    exit
fi


EXPIRY_DATE=`whois $1 | grep -i expir | egrep '[0-9]{4}-[0-9]{2}-[0-9]{2}' -o`
echo $EXPIRY_DATE
DIR=`dirname $0`
echo $EXPIRY_DATE | python $DIR/whois-expiry-to-days.py
