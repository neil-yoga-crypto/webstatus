#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: `basename $0` [domain]"
    exit
fi

DIR=`dirname $0`
$DIR/repos/mozilla/cipherscan/cipherscan $1
