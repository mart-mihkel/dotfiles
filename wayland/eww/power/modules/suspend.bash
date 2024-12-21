#!/bin/bash

lock="/tmp/eww.suspend.lock"
tail=$(tail -n 1 $lock | jq '.class')

if [[ $tail == '"clicked"' ]]; then
    eww -c ~/.config/eww/power close win0
    systemctl suspend
else
    echo '{"class": "clicked"}' >> $lock
fi
