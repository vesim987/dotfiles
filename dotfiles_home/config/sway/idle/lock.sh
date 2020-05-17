#!/usr/bin/env sh
BASE_PATH="$(dirname "$(readlink -f "$0")")"

"${BASE_PATH}/inhibitors/pa-chromium.sh" && exit 1

"${BASE_PATH}/../lock.sh"
