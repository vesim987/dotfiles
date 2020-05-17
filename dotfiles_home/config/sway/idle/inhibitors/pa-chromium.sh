#!/usr/bin/env bash
playerctl -p "plasma-browser-integration" status 2>/dev/null | grep Playing >/dev/null || exit 1
swaymsg -t get_tree | jq -e 'recurse(.nodes[]?) | select((.fullscreen_mode == 1) and (.window_properties.class=="Chromium") and (.focused==true))' 2>/dev/null >/dev/null || exit 1
exit 0
