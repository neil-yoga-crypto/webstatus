#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: `basename $0` [domain]"
    exit
fi

nmap -Pn -p80,443,22 $1 | grep '/' | grep -v 'nmap.org' | awk '{\
if ($2 == "open")
    print $1,"    1"
else
    print $1,"    0"
}' | sed -e 's/\/tcp//g'

