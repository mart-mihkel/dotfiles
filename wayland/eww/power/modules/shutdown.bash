#!/bin/bash

lock="/tmp/eww.shutdown.lock"
tail=$(tail -n 1 $lock | jq '.class')

if [[ $tail == '"clicked"' ]]; then
    shutdown now
else
    echo '{"class": "clicked"}' >> $lock
fi
