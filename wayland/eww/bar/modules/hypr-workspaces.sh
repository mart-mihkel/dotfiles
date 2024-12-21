#!/bin/bash

active="$(hyprctl monitors -j | jq '.[].activeWorkspace.id')"
spaces="$(hyprctl workspaces -j | jq --argjson active $active 'map({id: .id, icon: (if .id == $active then "" else "" end), class: (if .id == $active then "active" else "inactive" end)})')"

echo {\"eDP-1\": $spaces}
