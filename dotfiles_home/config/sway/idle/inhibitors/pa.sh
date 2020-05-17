#!/usr/bin/env sh
playerctl -a status 2>/dev/null | grep Playing >/dev/null || exit 1
exit 0
