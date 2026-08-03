#!/usr/bin/env fish

# Start Alacritty with cmus inside it
alacritty -e bluetuith &

# Start pavucontrol (GUI volume control)
pavucontrol &

# Disown both background jobs so they are not tied to the shell
disown;

cmus
