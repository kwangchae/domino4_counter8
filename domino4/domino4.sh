#!/usr/bin/bash
LED_PINS=(17 18 27 22)

for pin in "${LED_PINS[@]}"; do
    pinctrl set $pin op
    pinctrl set $pin dl
done

while true; do
    for pin in "${LED_PINS[@]}"; do
        pinctrl set $pin dh
        sleep 1
        pinctrl set $pin dl
    done
done