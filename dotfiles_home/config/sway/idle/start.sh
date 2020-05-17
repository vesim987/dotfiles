#!/usr/bin/env sh

let DIM_TIMEOUT=60
let LOCK_TIMEOUT=$((${DIM_TIMEOUT}+120))
let DPMS_TIMEOUT=$((${LOCK_TIMEOUT}+30))
let SUSPEND_TIMEOUT=$((${DPMS_TIMEOUT}+120))

BASE_PATH="$(dirname "$(readlink -f "$0")")"


swayidle -d \
    timeout $DIM_TIMEOUT     "${BASE_PATH}/dim_screen.sh" \
        resume  "${BASE_PATH}/brighten_screen.sh" \
    timeout $LOCK_TIMEOUT    "${BASE_PATH}/lock.sh" \
    timeout $DPMS_TIMEOUT    "${BASE_PATH}/outputs_off.sh" \
        resume "${BASE_PATH}/outputs_on.sh" \
    timeout $SUSPEND_TIMEOUT "${BASE_PATH}/suspend.sh" \
        before-sleep "${BASE_PATH}/../lock.sh" \
        lock "${BASE_PATH}/../lock.sh"

