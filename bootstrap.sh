#!/bin/bash

nix-shell -p git --experimental-features 'nix-command flakes' --command "
    sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
    sudo nix-channel --update
"
