#!/usr/bin/env bash
# Get the current display
current_output=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true) | .name')

swaymsg "[workspace=$1] move workspace to output ${current_output}"

swaymsg workspace number "$1"

exit 0