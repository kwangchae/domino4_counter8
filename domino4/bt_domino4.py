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
        n = 0
        for i in range(len(gpio_pins)):
            leds[n].on()
            sleep(1)
            leds[n].off()
                
            n = (n + 1) % len(gpio_pins)
    sleep(0.1)