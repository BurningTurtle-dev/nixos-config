#!/usr/bin/env bash

swaymsg input "1386:891:Wacom_One_by_Wacom_M_Pen" map_to_region $(slurp | sed 's/,/ /;s/x/ /')