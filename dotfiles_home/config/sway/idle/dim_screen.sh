#!/usr/bin/env sh

BASE_PATH="$(dirname "$(readlink -f "$0")")"

"${BASE_PATH}/inhibitors/pa-chromium.sh" && exit 1

/usr/bin/light >/tmp/prev_screen_brightness
/usr/bin/light -S "10%"
