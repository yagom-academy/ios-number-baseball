## ⛺️iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소
> IOS 커리어 스타터 캠프 </br>
  Created by: Roy & 쿼카

### 게임 규칙

- 컴퓨터가 생성한 임의의 수 세 개와 사용자가 입력한 임의의 수 세 개를 비교하여 위치와 값이 같으면 스트라이크, 숫자만 같으면 볼 입니다.
- 도전 횟수는 9번이며 9번 내로 사용자가 3스트라이크가 되면 사용자의 승리, 3스트라이크를 내지 못하면 컴퓨터의 승리입니다.
- 수의 범위는 1~9이며 중복된 수는 없습니다.

### Flow Chart
<img src = "https://user-images.githubusercontent.com/75601594/153162026-7a6ca0db-d20f-4309-8651-c0210d8033ad.png" width="300px">

###  Naming
1. generateRandomNumbers()함수 : 임의의 수 생성
2. compareNumbers()함수 : 컴퓨터와 사용자 수를 비교하여 스트라이크, 볼을 반환한다.
3. startGame()함수 : generateRandomNumbers()와 compareNumbers()를 사용하여 게임을 진행하고 진행상황 및 승리자 메세지를 출력하는 함수
4.strike , ball: 스트라이크 와 볼 수

### Step1
1. generateRandomNumbers: func  = 겹치지 않는 무작위의 3개의 수를 배열로 생성하여 반환.
2. compareNumbers: func = 컴퓨터가 생성한 수와 유저의 수를 비교하여 스트라이크와 볼을 반환
3. startGame:func = 게임을 시작하는 함수
