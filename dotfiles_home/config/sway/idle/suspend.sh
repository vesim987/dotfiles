#!/usr/bin/env sh

BASE_PATH="$(dirname "$(readlink -f "$0")")"

#"${BASE_PATH}/inhibitors/ac.sh" && exit 1
"${BASE_PATH}/inhibitors/pa.sh" && exit 1

systemctl suspend
