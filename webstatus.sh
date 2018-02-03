#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: `basename $0` [domain]"
    exit
fi

echo "========== DIG Records ============"
sh scripts/dig-records.sh $1
echo "========== WHOIS expiry ============"
sh scripts/whois-expiry.sh $1
echo "========== PORT SCAN (22,80,443) ============"
sh scripts/nmap-ports.sh $1
echo "========== SSL Expiry ============"
sh scripts/ssl-expiry.sh $1
