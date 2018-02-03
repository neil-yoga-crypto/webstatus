#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: `basename $0` [domain]"
    exit
fi


whois $1 | grep -i expir | egrep '[0-9]{4}-[0-9]{2}-[0-9]{2}' -o
