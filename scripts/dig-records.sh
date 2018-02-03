#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: `basename $0` [domain]"
    exit
fi


(dig -t any $1;dig -t any $1; dig -t any $1) | grep $1 | egrep -v '<<>>|;' | awk '{print $4 "    " $5 " " $6}' | sort | uniq
