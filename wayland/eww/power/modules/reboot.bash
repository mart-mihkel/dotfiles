#!/bin/bash

lock="/tmp/eww.reboot.lock"
tail=$(tail -n 1 $lock | jq '.class')

if [[ $tail == '"clicked"' ]]; then
    reboot
else
    echo '{"class": "clicked"}' >> $lock
fi
