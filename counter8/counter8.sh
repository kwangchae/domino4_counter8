#!/bin/bash
LED_PINS=(27 18 17)

for pin in "${LED_PINS[@]}"; do
    pinctrl set $pin op
    pinctrl set $pin dl
done

display_binary() {
    number=$1
    bit0=$((number & 1))
    bit1=$(((number >> 1) & 1))
    bit2=$(((number >> 2) & 1))
    
    if [ $bit0 -eq 1 ]; then
        pinctrl set ${LED_PINS[0]} dh
    else
        pinctrl set ${LED_PINS[0]} dl
    fi
    
    if [ $bit1 -eq 1 ]; then
        pinctrl set ${LED_PINS[1]} dh
    else
        pinctrl set ${LED_PINS[1]} dl
    fi
    
    if [ $bit2 -eq 1 ]; then
        pinctrl set ${LED_PINS[2]} dh
    else
        pinctrl set ${LED_PINS[2]} dl
    fi
    
    echo "Count: $number (Binary: $bit2$bit1$bit0)"
}

while true; do
    for i in {0..7}; do
        display_binary $i
        sleep 1
    done
done