#!/usr/bin/env sh

WORKING_DIRECTORY="${HOME}"

WINDOW_PID="$(swaymsg -t get_tree | jq -e 'recurse(.nodes[]?) | select((.focused==true) and (.app_id=="Alacritty")).pid')"
if [ $? = "0" ]; then
    SHELL_PID="$(ps --no-headers --ppid "${WINDOW_PID}" | awk '{print $1}')"
    if [ $? = "0" ]; then
        WORKING_DIRECTORY="$(readlink "/proc/${SHELL_PID}/cwd")"
    fi
fi

/usr/bin/alacritty --working-directory "${WORKING_DIRECTORY}"
