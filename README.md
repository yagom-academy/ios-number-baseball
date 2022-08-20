## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소

### 감자 & 테리


---
### 1. 제목: 숫자야구 게임

---

### 2. 프로젝트 소개
게임 설명: 9번 기회 임의의 숫자 3개 맞추기 게임
숫자야구 게임규칙:
- 컴퓨터는 중복되지 않는 3개의 숫자를 생성.
- 사용자는 1부터 9사이의 숫자를 3개 입력.
- 사용자 입력시 3개의 숫자 구분자는 공백으로 작성.
  
  ex) 1 2 3
- 임의로 생성된 숫자의 위치와 값이 일치할 시 strike, 위치는 다르지만 값이 포함되는 경우 ball 처리
  
  ex) 컴퓨터 : 1 4 3 / 사용자 : 1 3 4 -> 1 strike 2ball
- 사용자가 9번의 입력 기회안에 3 Strike를 얻어내면 승리. 

---

### 3. 팀원
<img src="https://user-images.githubusercontent.com/19286161/185524199-843e7008-3d70-45a7-95b6-ed01f00e54c3.png" width=200>|<img src="https://user-images.githubusercontent.com/19286161/185532319-5347518f-d608-451e-b508-62f186c23a40.png" width=200>|
|:--:|:--:|
|태리|감자|

### 4. 프로젝트 순서도
![image](https://user-images.githubusercontent.com/19286161/185542140-6ad444b0-451e-4036-9457-a3651c9f4377.png)

### 5. 기능설명
메뉴선택

`selectMenu()` - 화면에 사용자 메뉴 출력 및 게임 모드 선택을 처리하는 함수
```swift
func selectMenu() -> Bool {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    guard let inputMenu = readLine() else {
        return false
    }
    
    switch inputMenu {
    case "1":
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        startNumberBaseBall()
        return false
    case "2":
        return true
    default :
        print("입력이 잘못되었습니다.")
        return false
    }
}
```
> 1. 사용자에게 메뉴 출력
> 2. 사용자가 1 입력시 게임시작 함수 `startNumberBall()` 호출
> 3. 사용자가 2 입력시 게임종료하기 위해 함수 종료
> 4. 1, 2를 제외한 문자 입력시 오입력 알림 문구 출력

사용자 입력 숫자 유효성 검사

`checkUserInput()` - 사용자에게 입력받은 숫자의 유효성을 검사후 3개의 정수 배열을 반환하는 함수
```swift
func checkUserInput(_ userInput: String) -> [Int]? {
    let userInputNumber: [Int] = userInput.components(separatedBy: " ")
        .compactMap { Int($0) }
        .filter { $0 > 0 && $0 < 10}
    
    if userInputNumber.count != 3 {
        return nil
    }
    
    if Set(userInputNumber).count != 3 {
        return nil
    }
    return userInputNumber
}
```
> 1. 구분자 " "기준으로 쪼개어 정수형 배열로 생성
> 2. 3개 정수 배열이 아닌경우 오입력 알림 문구 출력
> 3. 중복 숫자 존재시 알림 문구 출력

스트라이크 개수 확인

`checkStrike()` - 두 개의 배열에서 동일한 index의 동일한 값이 몇 개인지 판단하는 함수
```swift
func checkStrike(comparing: [Int], with: [Int]) -> Int {
    var strikeCount: Int = 0
    
    for (index, _) in comparing.enumerated() {
        if comparing[index] == with[index] {
            strikeCount += 1
        }
    }
    return strikeCount
}
```
>1. comparing 배열과 with 배열에 같은 인덱스에 동일한 값이 있는지 확인

볼 개수 확인

`checkBall()` - 두 개의 배열에서 동일한 값의 개수 확인
```swift
func checkBall(comparing: [Int], with: [Int]) -> Int {
    var ballCount: Int = 0

    for (index, value)  in with.enumerated() {
        if (comparing.contains(value)) && (with[index] != comparing[index]) {
            ballCount += 1
        }
    }
    return ballCount
}
```
>1. 두 개의 배열에서 index는 다르면서 동일한 값의 개수 확인

게임 진행

`startNumberBaseBall()` - 게임시작 선택시 실행하는 함수
```swift
func startNumberBaseBall() {
    let randomNumber: [Int] = creatRandomNumber()
    var lifeCount: Int = 9
    
    while lifeCount != 0 {
        guard let userInput = readUserInput(), let userInputNumber = checkUserInput(userInput) else {
            print("입력이 잘못되었습니다.")
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
            print("중복 숫자는 허용하지 않습니다.")
            continue
        }
        
        lifeCount -= 1
        let strikeCount: Int = checkStrike(comparing: randomNumber, with: userInputNumber)
        let ballCount: Int = checkBall(comparing: randomNumber, with: userInputNumber)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리!")
            break
        }
        print("남은기회 : \(lifeCount)")
    }
    
    if lifeCount == 0 {
        print("컴퓨터 승리...!")
    }
}
```
>1. `createRandNumber()`를 호출하여 임의의 중복없는 3개의 숫자 생성
>2. `checkUserInput()`을 호출하여 사용자에게 입력받은 숫자 3개 유효성 검사
>3. `checkStrike()`를 호출하여 strike 개수 확인
>4. `checkBall()`를 호출하여 ball 개수 확인
>5. 3 strike시 사용자 승리 문구 출력 후 종료, 이외의 경우에는 다음턴 진행
>6. 최초 9회의 기회에서 남은 기회가 0이 될시 컴퓨터 승리 문구 출력 후 종료

### 6. 고민한 점

1. `checkBall()`, `checkStrike()`에서 for의index접근법 고민
> enumerated가 가독성이 높다고 판단되어 사용하게 되었습니다.
2. `readUserInput()`에서 return 타입에 대한 고민
>  옵셔널을 통한 유효성 검증 후 안전하게 게임을 다음턴으로 넘기기위해 return 타입으로 nil을 사용.
```swift
        guard let userInputNumber = readUserInput() else {
            print("남은기회 : \(lifeCount)")
            continue
        }
```
3. `selectMenu()` 반복 수행과정을 while과 재귀함수로 진행할지 고민
> 반복문으로 구현시 복잡하지 않다고 판단되어 선택

|      | 재귀함수                 | 반복문        |
|------|--------------------------|---------------|
| 장점 | 간결한 코드              | 빠른 처리속도 |
| 단점 | 메모리누수 느린 처리속도 | 복잡한 코드   |


4. 이중들여쓰기 없애기
> 함수로 분리하여 들여쓰기를 최대한 줄이는 방식으로 생각
```swift
func checkBall(comparing: [Int], with: [Int]) -> Int {
    var ballCount: Int = 0
    
    for (index, value)  in with.enumerated() {
        if (comparing.contains(value)) && (with[index] != comparing[index]) {
            ballCount += 1
        }
    }
    return ballCount
}
---------- 변경 고민 코드  ------------------------------

func checkBall(comparing: [Int], with: [Int], index: Int) -> Int {
    if (comparing.contains(with[index])) && (with[index] != comparing[index]) {
        return 1
    }
    return 0
}

func countBall(comparing: [Int], with: [Int]) -> Int {
    var ballCount: Int = 0
    
    for (index, _)  in with.enumerated() {
        ballCount += checkBall(comparing: comparing, with: with, index: index)
    }
    return ballCount
}
```
5. 코딩 컨밴션
> 네이밍 파라미터, 들여쓰기, 줄바꿈등을 일관성 있게 통일하도록 노력하였음

