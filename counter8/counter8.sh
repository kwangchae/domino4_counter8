#!/usr/bin/bash

# LED를 연결할 GPIO 핀 번호를 배열로 정의
LED_PINS=(27 18 17)

# 초기화: 각 핀을 출력(output) 모드로 설정 후 LOW 상태로 설정
for pin in "${LED_PINS[@]}"; do # LED_PINS 배열의 각 요소에 대해 반복
    pinctrl set $pin op # 핀을 출력 모드로 설정
    pinctrl set $pin dl # 핀을 LOW 상태로 설정
done

# LED를 점등하는 함수
display_binary() {
    number=$1 # 인자로 받은 숫자
    bit0=$((number & 1)) # LSB
    bit1=$(((number >> 1) & 1)) # 2nd bit
    bit2=$(((number >> 2) & 1)) # MSB
    
    # bit0 (LSB)
    if [ $bit0 -eq 1 ]; then # LSB가 1이면
        pinctrl set ${LED_PINS[0]} dh # 핀을 HIGH 상태로 설정
    else # LSB가 0이면
        pinctrl set ${LED_PINS[0]} dl # 핀을 LOW 상태로 설정
    fi
    
    # bit1
    if [ $bit1 -eq 1 ]; then # 2nd bit가 1이면
        pinctrl set ${LED_PINS[1]} dh # 핀을 HIGH 상태로 설정
    else # 2nd bit가 0이면
        pinctrl set ${LED_PINS[1]} dl # 핀을 LOW 상태로 설정
    fi
    
    # bit2 (MSB)
    if [ $bit2 -eq 1 ]; then # MSB가 1이면
        pinctrl set ${LED_PINS[2]} dh # 핀을 HIGH 상태로 설정
    else # MSB가 0이면
        pinctrl set ${LED_PINS[2]} dl 
        # 핀을 LOW 상태로 설정
    fi
}

# 0부터 7까지 1초 간격으로 반복
while true; do 
    for i in {0..7}; do # 0부터 7까지 반복
        display_binary $i # 이진수로 변환하여 LED 점등
        sleep 1 # 1초 대기
    done
done