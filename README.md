# Raspberry Pi GPIO 제어 프로젝트

이 저장소는 라즈베리 파이의 GPIO를 활용한 두 가지 프로젝트를 포함하고 있습니다. 각 프로젝트는 라즈베리 파이의 GPIO 핀을 제어하여 LED를 다양한 방식으로 조작합니다.

## 프로젝트 개요

### 1. LED 도미노 (domino4)
LED 도미노 프로젝트는 4개의 LED를 순차적으로 켜고 끄는 도미노 효과를 구현합니다. 각 LED는 순서대로 켜졌다가 꺼지며, 이 과정이 반복됩니다.

### 2. 3-비트 이진 카운터 (counter8)
3-비트 이진 카운터 프로젝트는 3개의 LED를 사용하여 0부터 7까지의 숫자를 이진수로 표현하는 카운터를 구현합니다. 카운터는 자동으로 증가하며 8가지 이진 조합을 표시합니다.

## 저장소 구조

```
repository-root/
├── README.md             # 이 파일
├── domino4/
│   ├── README.md         # LED 도미노 프로젝트 설명
│   ├── domino4.sh        # LED 도미노 스크립트
│   └── images/           # 회로 다이어그램 및 이미지
└── counter8/
    ├── README.md         # 3-비트 카운터 프로젝트 설명
    ├── counter8.sh       # 3-비트 카운터 스크립트
    └── images/           # 회로 다이어그램 및 이미지
```

## 요구 사항

- 라즈베리 파이 5
- 최소 4개의 LED
- 330Ω 저항 (LED 당 1개)
- 브레드보드
- 점퍼 와이어

## 설치 및 사용 방법

1. 이 저장소를 클론합니다:
   ```bash
   git clone https://github.com/kwangchae/domino4_counter8.git
   cd domino4_counter8
   ```

2. 각 프로젝트 디렉토리로 이동하여 스크립트를 실행 가능하게 만듭니다:
   ```bash
   cd domino4
   chmod +x domino4.sh
   ```
   또는
   ```bash
   cd counter8
   chmod +x counter8.sh
   ```

3. README.md 파일의 지침에 따라 회로를 구성합니다.

4. 스크립트를 실행합니다:
   ```bash
   ./domino4.sh
   ```
   또는
   ```bash
   ./counter8.sh
   ```

## 데모 영상

각 프로젝트의 데모 영상은 해당 프로젝트 디렉토리의 README.md 파일에서 확인할 수 있습니다.

## 트러블슈팅

- LED가 작동하지 않을 경우, 회로 연결을 확인하고 LED의 양극(긴 다리)과 음극(짧은 다리)이 올바르게 연결되었는지 확인하세요.
- 스크립트 실행 시 권한 오류가 발생하면 `sudo`를 사용하여 실행하세요:
  ```bash
  sudo ./domino4.sh
  ```
- GPIO 핀 번호에 혼동이 있을 수 있습니다. 이 프로젝트는 BCM 번호 지정 방식을 사용합니다.