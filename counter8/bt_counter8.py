#!/usr/bin/env python3

from gpiozero import Button, LED
from time import sleep

switch_pin = 25
switch = Button(switch_pin, pull_up=True)

gpio_pins = [17, 18, 27]
leds = []

for pin in gpio_pins:
    leds.append(LED(pin))

def display_binary(number):
    bit0 = number & 1        
    bit1 = (number >> 1) & 1
    bit2 = (number >> 2) & 1
    
    leds[0].value = bit0
    leds[1].value = bit1
    leds[2].value = bit2

counter = 0
previous_state = False
 
while True:
    current_state = switch.is_pressed
        
    if current_state and not previous_state:
        counter = (counter + 1) % 8
        display_binary(counter)
        sleep(0.2)
        
    previous_state = current_state
    sleep(0.01)