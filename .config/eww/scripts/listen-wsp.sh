#!/bin/bash

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

if [[ "$1" == "-a" ]]; then
    hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'
    socat -u UNIX-CONNECT:$SOCKET - |
      stdbuf -o0 awk -F '>>|,' -e '/^workspace>>/ {print $2}' -e '/^focusedmon>>/ {print $3}'
else
    hyprctl workspaces -j | jq -c 'map({id: .id}) | sort_by(.id)'
    socat -u UNIX-CONNECT:$SOCKET - | while read -r line; do
        hyprctl workspaces -j | jq -c 'map({id: .id}) | sort_by(.id)'
    done
fi
