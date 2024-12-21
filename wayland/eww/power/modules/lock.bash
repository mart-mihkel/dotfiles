#!/bin/bash

lock="/tmp/eww.lock.lock"
tail=$(tail -n 1 $lock | jq '.class')

if [[ $tail == '"clicked"' ]]; then
    eww -c ~/.config/eww/power close win0
    hyprlock
else
    echo '{"class": "clicked"}' >> $lock
fi
