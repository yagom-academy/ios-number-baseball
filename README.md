## 숫자야구 프로젝트 저장소

###### iOS 커리어 스타터 캠프
###### Created by. Seunggi & Soll (3A)



### 게임 규칙

- 컴퓨터가 생성한 임의의 수 세 개와 사용자가 입력한 임의의 수 세 개를 비교하여 위치와 값이 같으면 스트라이크, 숫자만 같으면 볼 입니다.

- 도전 횟수는 9번이며 9번 내로 사용자가 3스트라이크가 되면 사용자의 승리, 3스트라이크를 내지 못하면 컴퓨터의 승리입니다.

- 수의 범위는 1~9이며 중복된 수는 없습니다.

  


### Flow chart

![flowchart_v1](./image/flowchart_v1.png)



### Naming

1. remainCount = 사용자가 한 번의 게임당 시도할 수 있는 횟수

2. inputNumbersCount = 컴퓨터가 생성할 수의 갯수

3. tempRandomNumbers, tempNumber = 함수 내에서 임시적으로 값을 할당하기 위한 문자열 배열, 문자열

4. strike, ball = 스트라이크와 볼 수

5. input = 사용자가 입력하는 문자열

6. userNumbers = 사용자가 입력한 숫자를 담는 문자열 배열

7. comArray = 컴퓨터가 생성한 랜덤한 정수 3개를 담아둔 배열

8. userArray = 사용자가 입력한 정수 3개를 담아둔 배열

   

### Step 1

#### 기본 기능
1. makeThreeRandomNumber: func = 겹치지 않는 무작위의 3개의 수를 배열로 생성하여 반환

2. judgeStrikeBall: func = 컴퓨터가 생성한 수와 사용자의 수를 비교하여 스트라이크와 볼을 반환

3. startGame:func = 게임을 시작하는 함수

   


### Step2

1. startMenu: func = 메뉴를 시작하는 함수
2. inputUserArray: func = 사용자가 입력한 수를 담은 배열을 반환
3. isUserNumberTrueFalse: func = 사용자가 입력한 수가 게임 조건을 충족하는지 판단하는 함수
