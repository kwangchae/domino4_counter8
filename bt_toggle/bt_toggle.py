#!/usr/bin/env python3

from gpiozero import Button, LED
from time import sleep

switch_pin = 25
switch = Button(switch_pin, pull_up=True)

gpio_pins = [17, 18, 27, 22]
leds = []
led_states = {}

for pin in gpio_pins:
    led = LED(pin)
    leds.append(led)
    led_states[pin] = False
    
previous_pressed = False

while True:
    current_pressed = switch.is_pressed
        
    if current_pressed and not previous_pressed:
        for i, pin in enumerate(gpio_pins):
            if not led_states[pin]:
                leds[i].on()
                led_states[pin] = True
            else:
                leds[i].off()
                led_states[pin] = False
        
    previous_pressed = current_pressed
    sleep(0.1)