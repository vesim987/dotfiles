#!/usr/bin/env sh
grep 1 /sys/class/power_supply/AC0/online 2>/dev/null >/dev/null
