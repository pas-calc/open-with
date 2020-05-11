#!/bin/bash

echo "FILE : \"$1\""

if [ ! -f "$1" ]
then
    echo "ERROR: the file does not exist"
    exit 1
fi

# cat the file, look for line with 'URL=', then cut it by the '=' delimiter, get the second fragment (f2), delete \r and \n (line ending)
url=""
url=$(cat "$1" | grep 'URL=' | cut -f2- -d'=' | tr -d '\r' | tr -d '\n')

if [ ! "$url" ];then
   echo "ERROR: URL not found, not valid?"
   exit 2
fi

echo "URL  : \"${url}\""

ret=$(firefox "${url}")

exit 0

