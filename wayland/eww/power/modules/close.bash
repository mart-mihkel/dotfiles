#!/bin/bash

ls /tmp | grep eww..*.lock | while read -r line; do
    echo '{"class": ""}' >> "/tmp/${line}"
done

eww -c ~/.config/eww/power close win0
