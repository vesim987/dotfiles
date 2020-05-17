#!/usr/bin/env sh

PREVIOUS_BRIGTNESS="$(</tmp/prev_screen_brightness)"

light -S "${PREVIOUS_BRIGTNESS}%"
