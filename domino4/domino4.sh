#!/usr/bin/bash

# LED를 연결할 GPIO 핀 번호를 배열로 정의
LED_PINS=(17 18 27 22)

# 초기화: 각 핀을 출력(output) 모드로 설정 후 LOW 상태로 설정
for pin in "${LED_PINS[@]}"; do # LED_PINS 배열의 각 요소에 대해 반복
    pinctrl set $pin op # 핀을 출력 모드로 설정
    pinctrl set $pin dl # 핀을 LOW 상태로 설정
done

# LED를 점등하는 함수
while true; do 
    for pin in "${LED_PINS[@]}"; do # LED_PINS 배열의 각 요소에 대해 반복
        pinctrl set $pin dh # 핀을 HIGH 상태로 설정
        sleep 1 # 1초 대기
        pinctrl set $pin dl # 핀을 LOW 상태로 설정
    done
done