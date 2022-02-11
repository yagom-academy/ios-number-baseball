## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

## 👨‍👩‍👧‍👦   팀 그라운드 룰

팀원

@FirstDo @Mino777

리뷰어

@yim2627

프로그래밍 방식

드라이버와 내비게이터로 나누어 페어 프로그래밍으로 진행

## 📌 타임라인 (22.02.08 ~ 22.02.11)

2022.02.08

- 전체적인 요구사항 파악
- 순서도 작성
- STEP 1 구현 완료

2022.02.09

- STEP 1 PR 피드백 반영
    - 코딩 컨벤션, 네이밍 리팩토링
    - 단일 책임 원칙을 지키기 위한 들여쓰기 제한 반영

2022.02.10

- STEP 1 PR 피드백 반영
- STEP 1 Merge
- STEP 2 구현 완료

2022.02.11

- README 작성

## Step 0 - FlowChart

![FlowChart drawio](https://user-images.githubusercontent.com/54234176/152980262-d362762b-eb74-4f36-8002-53361b72a14d.png)

## Step 1 - 기본 기능 구현

- startGame(): 게임을 시작하는 함수
- generateRandomNumber() -> Int : (1...9) 사이의 랜덤한 Int값을 하나 반환하는 함수
- generatedThreeRandomNumbers() -> [Int] : 세개의 중복되지 않는 임의의 정수배열을 반환하는 함수
- judgeBallOrStrike(targetNumbers: [Int], userNumbers: [Int]) -> (Int, Int) : 볼과 스트라이크의 개수를 반환하는 함수
- increaseBallOrStrike(targetNumbers: [Int], userNumberIndex: Int, userNumber: Int): 볼과 스트라이크 개수를 증가 시켜주는 함수
- showGameResult(): 게임 결과를 출력해주는 함수
- convertIntArrayToString(intArray: [Int]) -> String: Int 타입 배열을 문자열로 변환해주는 함수

## Step 1 - 리팩터링(피드백 반영)

### 기존 함수, 변수명에 좀 더 의도가 드러나게끔 수정

- 3개의 랜덤한 수를 생성하는 함수: generateExtractedNumbers → generatedThreeNumbers
- 볼과 스트라이크를 카운트 하는 변수: ball, strike → ballCount, strikeCount
- 게임 결과(승리자)를 출력해주는 함수: printWinnerMessage → showGameResult
- 출력을 위해 변환된 [Int]배열을 의미하는 변수: convertedString → StringTypeUserNumbers
- idx, userNum 등으로 썼던 줄임말을 userNumberIndex, userNumber로 수정

### 함수의 기능 분리 (들여쓰기 2번이상 된 부분 수정)

judgeBallOrStrike에서 볼과 스트라이크 횟수를 늘려주는 기능을 increaseBallOrStrike로 분리

```swift
func judgeBallOrStrike(targetNumbers: [Int], userNumbers: [Int]) {
        for (idx, userNum) in userNumbers.enumerated() {
                if targetNumbers[idx] == userNum {
                        strike += 1
                } else if targetNumbers.contains(userNum) {
                        ball += 1
                }
        }
}
```

```swift
func judgeBallOrStrike(targetNumbers: [Int], userNumbers: [Int]) {
    for (userNumberIndex, userNumber) in userNumbers.enumerated() {
        increaseBallOrStrike(targetNumbers: targetNumbers, userNumberIndex: userNumberIndex, userNumber: userNumber)
    }
}

func increaseBallOrStrike(targetNumbers: [Int], userNumberIndex: Int, userNumber: Int) {
    if targetNumbers[userNumberIndex] == userNumber {
        strikeCount += 1
    } else if targetNumbers.contains(userNumber) {
        ballCount += 1
    }
}
```

### 가독성을 위해 함수의 위치 수정

- 먼저 호출되는 함수를 앞쪽에 위치하도록 수정
- 해당 컨벤션을 통일한 결과 굉장히 읽기 편한 코드가 되었음

## Step 2 - 사용자 입력 구현

- startProgram(): 전체적인 프로그램을 시작하는 함수
- printMenu(): 메뉴 인터페이스를 출력해주는 함수
- selectedMenu() -> Int: 사용자가 메뉴선택을 입력하는 함수
- runSelectedMenu(menuInput: Int): 사용자의 입력에 따른 결과 처리
- generatedUserNumbers() -> [Int]: 사용자의 입력 숫자를 생성해주는 함수
- printUserGuideMenu(): 사용자 주의사항 인터페이스를 출력해주는 함수
- inputUserNumbers() -> [Int]: 사용자의 입력을 받는 함수
- verifyUserInput(input: [Int]) -> Bool: 사용자의 입력을 검증해주는 함수
- verifyNumbersDuplication(numberList: [Int]) -> Bool: 사용자의 입력의 중복을 검증해주는 함수
- verifyValidRange(numberList: [Int]) -> Bool: 사용자의 입력의 범위를 검증해주는 함수

### 구현 결과

메뉴의 잘못된 입력 처리
![잘못된입력](https://user-images.githubusercontent.com/69573768/153528908-21c9e027-fcf7-428f-b391-e150cce91ff0.gif)
정상적인 게임 결과 출력 - 사용자 승리
![사용자 승리](https://user-images.githubusercontent.com/69573768/153528916-ea8dd9e6-bd65-4742-852f-c74762cf37cb.gif)
정상적인 게임 결과 출력 - 컴퓨터 승리
![컴퓨터 승리](https://user-images.githubusercontent.com/69573768/153528917-c94f7dc2-ca0a-4570-9a80-3eaf83010397.gif)
게임 종료
![게임종료](https://user-images.githubusercontent.com/69573768/153528919-60b49407-366f-4e71-86ad-be8ebc232d84.gif)
