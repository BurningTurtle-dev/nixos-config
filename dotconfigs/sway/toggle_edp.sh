#!/usr/bin/env bash
# Save sway outputs JSON into a variable
outputs=$(swaymsg -t get_outputs | jq -r '.[] | select(.name=="eDP-1") | .active')

if [ "$outputs" = "true" ]; then
    action="disable"
else
    action="enable"
fi

swaymsg output eDP-1 "$action"

exit 0