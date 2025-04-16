#!/usr/bin/env python3

from gpiozero import Button, LED
from time import sleep

switch_pin = 25
switch = Button(switch_pin, pull_up=True)

gpio_pins = [17, 18, 27, 22]
leds = []

for pin in gpio_pins:
    leds.append(LED(pin))

while True:
    if switch.is_pressed:
        for i in range(len(gpio_pins)):
            leds[i].on()
    else:
        for led in leds:
            led.off()
    sleep(0.1)