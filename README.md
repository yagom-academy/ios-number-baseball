## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소

## 목차

1. [제목](#1.)
2. [소개](#2.)
3. [팀원](#3.)
4. [타임라인](#4.)
5. [순서도(Flow Chart)](#5.)
6. [실행 화면(기능 설명)](#6.)
7. [트러블 슈팅](#7.)
8. [참고 링크](#8.)
9. [팀 회고](#9.)


<a id="1."></a>
## 1. 제목
#### 🛎️ EeE-e's 숫자야구게임 ⚾️

<a id="2."></a>
## 2. 소개 
        플레이어에게 1부터 9까지의 한 자리 숫자 중복없이 3개를 입력받아 지정된 숫자 3개와자리와 숫자가 같으면 스트라이크, 
        동일 숫자가 포함되어 있으면 볼로 나타났을 때, 9번 시도 중에 3 스트라이크면 사용자가 승리하고, 아니면 컴퓨터가 승리하는 게임

<a id="3."></a>
## 3. 팀원
| [Karen 🐕](https://github.com/karenyang835) | [Serena 🐷](https://github.com/serena0720) | [Whales 🐋](https://github.com/WhalesJin) |
| :--------: | :--------: | :--------: |
| <Img src = "https://i.imgur.com/gwxTotR.png" width="150"/>|  <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="150"/>| <Img src = "https://i.imgur.com/wnhhCv9.jpg" width="150"/>|

<a id="4."></a>
## 4. 타임라인
**2023.04.24**
- 순서도 작성

**2023.04.25**
- 랜덤 숫자 및 사용자 숫자 생성 함수 정의
- Ball, Strike 개수 체크 함수 정의
- 게임 진행 함수 정의

**2023.04.26**
- 랜덤 숫자 및 사용자 숫자 생성 함수 중복 수정

**2023.04.27**
- 리뷰어의 피드백에 따른 코드 리팩토링 및 네이밍 수정
- 메뉴 선택 함수 정의
- 사용자 숫자 입력 함수 정의
- 게임 시작 함수 정의
- 지역변수를 전역변수로 리팩토링
- 게임 메뉴 출력 함수 및 게임 출력 반복 함수 리팩토링

**2023.04.28**
- 옵셔널 언래핑 방법 수정
- 사용자 입력 숫자 중복 제거 조건 추가
- 승패출력 오류 수정
- 기능별 파일 분류

**2023.04.29**
- 리뷰어 피드백에 따른 승패 출력 후 메뉴 출력하도록 수정
- README 최종 수정

<a id="5."></a>
## 5. 순서도(Flow Chart)

<Img src = "https://i.imgur.com/cn5Swjz.png" width="450"/>

<a id="6."></a>
## 6. 실행 화면(기능 설명)
- 메뉴 번호를 입력받아서 1이면 게임 시작, 2면 게임종료가 됩니다.

| 1 입력 시 | 
| :--------: |
| <Img src = "https://i.imgur.com/OYgiTEI.png" width="350"/> |
| **2 입력 시** | 
| <Img src = "https://i.imgur.com/4ouC2Y2.png" width="350"/>|

- 게임이 시작되었을 때, 제한조건을 보여주며 사용자에게 숫자 입력을 받아 승패를 결정합니다.

| 컴퓨터 승리 시 | 
| :--------: |
| <Img src = "https://i.imgur.com/q3d4hnR.png" width="350"/> |
| **사용자 승리 시** | 
| <Img src = "https://i.imgur.com/DF1sB5u.png" width="350"/>|

<a id="7."></a>
## 7. 트러블 슈팅
### 🔥 중복함수 삭제
`createUserNumbers` 함수와 `createRandomNumbers` 함수의 기능이 동일하여 `createRandomNumbers` 함수로 통일시켰습니다.
<details>
<summary>세부 사항</summary>

#### 수정 전
```swift
func createUserNumbers() -> Array<Int> {
    var userNumbers: [Int] = []
    while userNumbers.count < 3 {
        let userNumber = Int.random(in: 1...9)
        if !userNumbers.contains(userNumber) {
            userNumbers.append(userNumber)
        }
    }
    print("userNumber : \(userNumbers)")
    return userNumbers
}

func createRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []

    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    return randomNumbers
}
```

#### 수정 후
```swift
func createRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []

    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    return randomNumbers
}
```
</details>


### 🔥 전역변수 vs 지역변수
함수 별로 기능 구현 완료 후 `class`나 `struct`로  전체 코드를 감싸서 사용자 정의타입을 적용할 목적으로 전역변수로 선언을 했습니다. 그러던 중 *사용자 정의 타입을 구현하지 않고 함수를 이용* 하라는 제약사항을 재상기하여 지역변수로 수정하였습니다.
이후 프로젝트를 진행하던 중 `readLine()`을 이용하여 사용자 입력을 받는 반복문에서 지역변수에 비해 전역변수의 활용도가 높다고 생각하여 기존의 지역변수를 전역변수로 전환하게되었습니다.

<details>
<summary>세부 사항</summary>

#### 변수 생성 - 전역변수로 설정
```swift
var randomNumbers: [Int] = []
var userNumbers: [Int] = []
var strike = 0
var ball = 0
```

#### 1차 수정 - playBall() 함수의 지역변수로 수정
```swift
func playBall() {
     let randomNumbers = createRandomNumbers()
     var userNumbers = createUserNumbers()
     var attemptCount = 9
     var ballCount = 0
     var strikeCount = 0
```

#### 최종 수정 - 전역변수로 꺼내고 playBall 함수의 파라미터를 수정하여 반복문 설정
```swift
 let randomNumbers = createRandomNumbers()
 var attemptCount = 9
 var ballCount = 0
 var strikeCount = 0

 func executeGame(of selectedMenu: String) {
     if selectedMenu == "1" {
         playBall()
         while attemptCount > 0 && strikeCount < 3 {
             playBall(of: getNumbers())
         }
     } else if selectedMenu == "2" {
         return
     }
 }
```
    
</details>


### 🔥 ! (강제추출) 사용 금지
중간에 `commit` 파일에는 `map`함수를 쓰면서 `nil` 값이 있을 수 있어서 임시로 `map{Int($0)!}` 이렇게 강제추출을 넣었다가 마지막 리팩토링 때 수정했습니다. `nil`을 걸러주는 `compactMap` 함수로 수정했습니다. 

<details>
<summary>세부 사항</summary>

#### 수정 전
```swift
    if let input = readLine()?.split(separator: " "),
       input.count == 3,
       input.allSatisfy({str in str.count == 1 && str >= "1" && str <= "9"}),
       Set(input).count == 3
    {
        inputNumbers = input.map({Int($0)!})
        playBall(of: inputNumbers)
    } else {
        print("입력이 잘못되었습니다.")
        getNumbers()
    }
```

#### 수정 후
```swift
    if let input = readLine()?.split(separator: " "),
       input.count == 3,
       input.allSatisfy({str in str.count == 1 && str >= "1" && str <= "9"}),
       Set(input).count == 3
    {
        inputNumbers = input.compactMap({Int($0)})
        playBall(of: inputNumbers)
    } else {
        print("입력이 잘못되었습니다.")
        getNumbers()
    }
```
</details>


### 🔥 `map{Int($0)!}` 수정 대안 고민
저희는 `compactMap`함수를 이용해 수정했는데 다른 어떤 방법이 더 있을지 궁금하여 리뷰어분에게 문의 드린 결과 또다른 고차함수`reduce`나 `forEach`문 등을 사용하여 구현할 수 있을 것 같지만 지금 단계에서는 **`compactMap`이 훨씬 깔끔해 보인다**는 답변을 받았습니다.

<a id="8."></a> 
## 8. 참고 링크
- [Apple Developer - zip 함수](https://developer.apple.com/documentation/swift/zip(_:_:))
- [블로그 - compactMap 함수](https://jeonyeohun.tistory.com/265) 

<a id="9."></a>
## 9. 팀 회고
### 👏🏻 우리팀이 잘한 점
- 대화, 소통이 원활했습니다.
- 열정이 가득했습니다.
- 생각할 시간을 가지고 서로 기다려주는 시간을 가졌습니다.
- 시간 약속 잘 지켰습니다.
- 서로 배려를 원칙으로 했습니다. (미리 사전에 일정 조율 및 컨디션 고려, 건강을 서로 챙겨주었습니다.)
- 코드를 작성할 때 처음 접한 고차함수를 많이 활용했습니다.(`compactMap`, `zip`, `allSatisfy`)
- 세 명이었기 때문에 리뷰어분의 조언을 토대로 옵저버를 따로 두어 짝코딩을 진행하였습니다.

### 👊🏻 우리팀 개선할 점
- 짝프로그래밍 시에 최대시간을 정하지 않고 진행한 부분이 미흡했던 점 같습니다.
- 텐션 낮추려고 노력했으나 잘 안되었습니다.
- 개인 공부시간이 너무 부족했습니다. 팀 목표가 미션완료였기 때문에 발생되어진 것 같습니다.
- 서로 컨디션 조절을 위해 잠을 충분히 자는 것도 중요한 것 같습니다.

### 💜 서로에게 좋았던 점 피드백
- Dear. Karen 🐕
  - 중재를 잘해주셨습니다.
  - 상황정리를 잘해주셨습니다.(코드적인 상황정리)
  - 철저한 준비로 첫 네비게이터 시작을 잘 끊어주셨습니다.
  - 꼼꼼하게 놓치는 부분을 잘 챙겨주셔서 좋았습니다.
  
- Dear. Serena 🐷
  - 아이디어를 많이 주셨습니다.
  - 대화나 업무에 협조를 잘해주셨습니다.
  - 모르는 함수들에 대하여 많이 알아와 주셨습니다.
  - 양보를 잘해주시고 수용을 잘해주셨던것 같습니다.
  
- Dear. Whales 🐋
  - 문서 정리를 잘해주셨습니다.
  - 프로젝트 방향성을 많이 잡아주셨습니다.
  - 소통을 중재해주고 대화를 잘 이끌어 주셨습니다.
  - 통찰력이 좋습니다. (임기응변이 좋습니다.)
