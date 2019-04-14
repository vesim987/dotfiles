#!/usr/bin/env bash

OUTPUTS="$(swaymsg -t get_outputs)"

FOCUSED_OUTPUT_NAME="$(jq -r '.[] | select((.focused == true)).name' <<< "${OUTPUTS}")"

FOCUSED_OUTPUT_SERIAL="$(jq -r '.[] | select((.focused == true)).serial' <<< "${OUTPUTS}")"

if [[ "${FOCUSED_OUTPUT_NAME}" = "eDP-1" ]]; then
    DEVICE="intel_backlight"
else
    for p in /sys/class/i2c-adapter/i2c-*/device/edid; do 
        if grep "${FOCUSED_OUTPUT_SERIAL}" "$p" 2>&1 1>/dev/null; then
            DEVICE="ddcci$(echo "$p" | sed 's/.*i2c-\([0-9]\).*/\1/')"
            break
        fi
    done
fi

if [[ -z "${DEVICE}" ]]; then
    echo "error: ddcci device not found" >&2
    exit 1
fi

brightnessctl -d "${DEVICE}" "$@"
