# 숫자야구 - 애드, 조이

## 플로우차트

![unknown](https://user-images.githubusercontent.com/52592748/119810997-91732300-bf21-11eb-8ef4-b81eead1eb68.png)

## 함수 설계

### 0. 게임 옵션 함수 `chooseOption()`

- 1.게임시작, 2.게임종료 출력
- 게임시작한다면 옵션번호 입력받기
    - 1: 게임시작 ⇒ `1. 게임 시작 함수` 호출
    - 2: 게임종료⇒ `return 0`
    - 그 외는 `0. 게임 옵션 함수` 재실행

### 1. 게임 시작 함수 `playGame()`

- `2. 정답 생성 함수` 호출 ⇒ let answer = generateAnswer()
- 시도횟수 변수 선언(초깃값 = 9) trialNumber = 9

```swift
let trialNo = 9

while trialNo > 0 {
    let userInput = getUserInput()

    if compareAnswer(userInput) == 1 {
        didWin()
        chooseOption()
        return
    }
    trailNo -= 1
}

didWin()
chooseOption()
```

- `3. 사용자 입력값 받는 함수` 호출 ⇒ let userInput = getUserInput()
- `5. 정답이 맞는지 확인하는 함수` 호출

### 2. 정답 생성 함수 `generateAnswer()`

- 랜덤한 수를 3개 생성
- 그 수들을 배열에 넣어서 리턴
    - [8, 2, 4]

### 3. 사용자 입력값 받는 함수 `getUserInput()`

- `readLine()`으로 입력 받기
- `4. 예외처리 하는 함수`를 호출
    - -1이 리턴되면 다시 입력값 받기 ⇒ `2번 함수 재실행` 혹은 while문
    - 1이 리턴되면 사용자 입력값을 배열에 넣어서 리턴 ⇒ `return [Int(input[0]), Int(input[2]), Int(input[4])]`

### 4. 예외처리 하는 함수 `checkError()`

- 에러 발생하는 경우
    - 문자열 길이가 5가 아닌 경우
    - `input[0]`, `input[2]`, `input[4]`이 1~9가 아닌 경우
    - `input[1]`, `input[3]` 이 공백이 아닌 경우
    - `input[0]`, `input[2]`, `input[4]`에 중복이 있는 경우
- 리턴값
    - 에러가 발생하면 -1을 리턴
    - 에러가 없으면 1을 리턴

### 5. 정답이 맞는지 확인하는 함수 `compareAnswer()`

- 인자: 정답배열, 사용자입력값배열
- strikeCount = 스트라이크 확인 함수 호출
- ballCount = 볼 확인 함수 호출
- print("`스트라이크 \(strikeCount), 볼 \(ballCount - strikeCount)`")
- 리턴
    - strikeCount == 3면 리턴 1
    - else 리턴 -1

### 6. trialNo를 통해 승리여부 확인 `didWin()`

```jsx
if tiralNo = 0 {
    print("컴퓨터승리")
} else {
    print("사용자승리")
}
```
