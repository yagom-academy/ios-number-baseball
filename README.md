## 숫자야구 프로젝트

사용자는 1부터 9까지 중복되지 않은 3개의 정수를 입력합니다.
이를 램덤으로 생성된 컴퓨터 숫자 3개와 비교하여 스크라이커와 볼을 판정합니다.
사용자는 9번의 기회 안에 3 스트라이크를 얻어내면 승리하며, 그렇지 않을 경우 컴퓨터 승리합니다.

---
### 1. 팀원
|쥬봉이🐱|Morgan🐻|
|------|---|
|<img src="https://avatars.githubusercontent.com/u/126065608?v=4" width="200">|<img src="https://avatars.githubusercontent.com/u/101351216?v=4" width="200">|
|[Github](https://github.com/jyubong) |[Github](https://github.com/devjoon)|

---
### 2. 타임라인
|날짜|내용|
|------|---|
|23.08.28|순서도 작성, 코딩 컨벤션 논의|
|23.08.29|깃허브 사용법 숙지 후 포크 수정, Step1 PR|
|23.08.30|피드백 후 Step1 수정, 재검토|
|23.08.31|Step2 코드 작성 및 Step2 PR|
|23.09.01|피드백 후 Step2 수정, Readme 작성|

---
### 3. Flow Chart
<img src="https://github.com/jyubong/ios-number-baseball/assets/126065608/184a67ae-cd4f-4d57-a6f2-6c77ae830ccd" width="400">

---
### 4. 숫자야구 실행
|사용자 승리 후 게임재시작|컴퓨터 승리 후 게임종료|
|------|---|
|<img src="https://github.com/jyubong/ios-number-baseball/assets/126065608/df5aea8d-2bb9-40ab-b360-47e0f0a7fdaf" width="400">|<img src="https://github.com/jyubong/ios-number-baseball/assets/126065608/1a6283e1-de53-4206-beb9-4247679f9b6d" width="400">|

|잘못된 입력 처리|게임 종료|
|------|---|
|<img src="https://github.com/jyubong/ios-number-baseball/assets/126065608/62538881-89fc-430e-8cd1-8ea19aa353a8" width="400">|<img src="https://github.com/jyubong/ios-number-baseball/assets/126065608/7f612eeb-a97a-47f1-9d99-b5218762f131" width="400">|

---
### 5. 트러블 슈팅
#### ❗️함수와 변수 Naming
함수와 변수의 적절한 Naming 방법이 미숙하였습니다. ``Swift API Guideline``에 나타나지 않은 Naming과 코드 컨벤션에서 어려움을 겪었습니다. 함수 이름으로 ``getResult()``를 사용하였는데, 공식 문서에는 나타나있지 않지만 통상적으로 ``함수명에는 get을 사용하지 않는 것``을 알게되었습니다.  
이처럼 불확실한 부분들은 PR을 통해 리뷰어의 조언을 받아 고쳐나갔습니다. 
<details>
<summary>세부 코드</summary>

``` swift
getRandomNumbers() -> makeRandomNumbers()  
getResult() -> makeResult()
```
</details>   

#### ❗️함수 기능 분리
Strike와 Ball을 판정하는 기능을 makeResult() 함수 안에 함께 구현하였습니다. 하나의 함수에 여러가지 기능을 넣어두게 되면서 if문을 다중 사용하게 되었고, 리뷰를 통해 추후 기능 수정이나 가독성 측면이 좋지 못한 것을 알게 되었습니다. 그래서 Strike 함수와 Ball 함수 각각을 만들어 기능을 분리하였습니다.
<details>
<summary>세부 코드</summary>

##### 수정 전 코드
``` swift
func makeResult(computerNumbers: [Int], userNumbers: [Int]) -> (Int, Int) {
    var (strike, ball) = (0,0)

    for index in 0..<userNumbers.count where computerNumbers.contains(userNumbers[index]) {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else {
            ball += 1
        }
    }
    
    return (strike, ball)
}
```
##### 수정 후 코드
``` swift
func strikeCount(computerNumbers: [Int], userNumbers: [Int]) -> Int {
    var strike = 0
    
    for index in 0..<userNumbers.count {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        }
    }
    return strike
}
func ballCount(computerNumbers: [Int], userNumbers: [Int]) -> Int {
    var ball = 0
    
    for index in 0..<userNumbers.count {
        let userNumber = userNumbers[index]
        
        if computerNumbers[index] != userNumber && computerNumbers.contains(userNumber) {
            ball += 1
        }
    }
    return ball
}
```
</details>   

#### ❗️사용자 입력값 유효성 검사
사용자 입력값을 받았을 때 예외처리 경우의 수가 많아 이를 처리하는 방안을 생각하기가 쉽지 않았습니다.   
입력값 유효성 검사 전 ``compactMap{Int($0)}``으로 처리할 경우 문자값을 받았을 때 에러를 출력하지 못해 ``map{Int($0)``을 사용했습니다. 이때 nil값을 처리하기 위해 ``?? 10``을 설정해주었고, 유효성 검사에서 10 이상일 경우 에러를 출력하는 부분에서 걸러지도록 만들었습니다.
하지만 이럴 경우 nil값이 모두 10으로 중복 처리되어 결론적으로 문자값에 맞는 에러를 출력하기가 어려워지는 등 문제점이 발생하였습니다.  
그래서 ``SubString`` 타입을 그대로 문자값에 대한 에러처리를 진행했으며, 모든 유효성 검사 마친 후 ``compactMap{Int($0)}`을 이용했습니다.
<details>
<summary>세부 코드</summary>

##### 수정 전 코드
``` swift
func selectUserNumbers() -> [Int] {
    var isIncorrect: Bool = true
    
    while isIncorrect {
        (...)
        
        let userNumbers: [Int] = userInput.split(separator: " ").map{Int($0) ?? 10}
        
        if validate(userNumbers: userNumbers) {
            isIncorrect = false
        } else {
            continue
        }
        return userNumbers
    }
}

func validate(userNumbers: [Int]) -> Bool {
    // 입력값 3개가 아닐때
    if userNumbers.count != 3 {
        print("입력이 잘못되었습니다.")
        return false
    }

    // 중복 제거
    let numbersSetList = Array(Set(userNumbers))
    
    if numbersSetList.count != 3 {
        print("입력이 잘못되었습니다.")
        return false
    }

    // 1~9사이 숫자가 아닐때(숫자가 아닌 값은 10이상으로 처리됨)
    for number in numbersSetList{
        if number > 9 || number < 1 {
            print("입력이 잘못되었습니다.")
            return false
        }
    }
    return true
}
```
##### 수정 후 코드
``` swift
func selectUserNumbers() -> [Int] {
        (...)

        let userNumbers: [Substring] = userInput.split(separator: " ")
        
        guard validate(userNumbers: userNumbers) else { continue }
        
        isIncorrect = false
        let correctNumbers = userNumbers.compactMap{Int($0)}
        return correctNumbers
    }
}

func validate(userNumbers: [Substring]) -> Bool {
    let requiredCount = 3

    // 입력값 3개 이상일때
    guard userNumbers.count == requiredCount else {
        print("입력한 값이 3개가 아닙니다.")
        return false
    }

    // 1~9사이 숫자가 아닐 때(문자값 등)
    for number in userNumbers {
        guard let number = Int(number) else {
            print("숫자가 아닌 값이 있습니다.")
            return false
        }
        
        guard 1...9 ~= number else {
            print("1 ~ 9사이 숫자만 입력해주세요.")
            return false
        }
    }

    // 중복 제거
    let numbersSetList = Set(userNumbers.compactMap{Int($0)})
    
    guard numbersSetList.count == requiredCount else {
        print("중복된 숫자가 있습니다.")
        return false
    }
    return true
}
```
</details>

---
### 6. 참고 링크
[🍎Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines)   
[🍏Swift 공식문서 Optionals, nil, Optional Binding](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/)   
[🍎Swift 공식문서 Basics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/)   
[🍏Swift 공식문서 Collection types ](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/)   
[🍎Swift 공식문서 Split](https://developer.apple.com/documentation/swift/string/split(separator:maxsplits:omittingemptysubsequences:))   
[🍏Swift 공식문서 Map](https://developer.apple.com/documentation/swift/array/map(_:)-87c4d)   
[🍎Swift 공식문서 Foundation](https://developer.apple.com/documentation/foundation)   


---
### 7. 팀 회고
#### 😺 우리팀 잘한 점
모르는 부분이 있다면 서로 스위프트 공식 문서를 찾아보고 서로 지식을 그때그때 공유하였습니다.
큰 트러블 없는 의견 조율로 빠른 프로그램 제작이 가능하였습니다.(코딩 컨벤션, 변수와 함수의 네이밍을 어떻게 할 것인가 등)
코드를 구현하기 위해 다양한 방법으로 접근을 시도해보았습니다.
시작하기 전 미리 목표를 설정하고, 프로젝트 시간과 개인 활동학습 시간을 정하는 등 시간 분배를 적절히 잘한 것 같습니다.

#### 😿 우리팀 개선할 점
개인적으로 필요한 부분은 아직 짝 프로그래밍이 처음이다 보니 상대방의 코드를 이어 받아 상대방의 생각을 이해하고 바로 진행하기에는 어려운 면이 있었던 것 같습니다. 
좀 더 원활하게 할 수 있는, 상대방의 코드를 빠르게 이해할 수 있는 능력을 앞으로 길러나가야 할 것이라고 생각합니다.
궁금한 점이 생기면 리뷰어를 포함하여 다른 기수 선배들에게도 적극적으로 조언을 구해보는 것도 좋을 것 같습니다.

#### 😺 서로에게 좋았던 점
1. Morgan🐻
  제가 미쳐 파악하지 못한 오류를 꼼꼼하게 잡아주셨던 점과 뛰어난 이해력을 바탕으로 코드를 이어나가 주신 점이 좋았습니다. 또한 필요한 부분이 있다면 스위프트 공식문서를 통해 새로운 기능들을 찾아내서 적용해 보고 같이 피드백 할 수 있어서 많이 배워 갈 수 있었습니다.
2. 쥬봉이🐱
  첫 프로젝트여서 걱정을 많이했는데, Morgan이 의지가 많이 되었습니다. Inout 등 몰랐던 개념들을 덕분에 배울 수 있었습니다. 그리고 제가 고집이 센 부분들을 믿어주시고 잘 받아주어 고마웠습니다.

#### 😺 서로에게 아쉬웠던 점
1. Morgan🐻
  첫 프로젝트에 쥬봉이 같은 좋은 팀원을 만나게 되어 반가웠고 덕분에 프로그래밍을 하면서도 많이 배워갈수 있었던것 같습니다. 아쉬운 점이라고 하면 앞으로 다음 프로젝트에서 만날때까지 같이 진행을 못 한다는 점 아닐까요? 한주동안 고생많이 하셨습니다. 다음에는 서로 더 성장한 모습으로 만나 완벽한 코드 같이 구현해봐요!
2. 쥬봉이🐱
  첫 프로젝트여서 저와 Morgan 둘다 짝 프로그래밍과 깃허브 사용이 미숙해서 버벅이는 부분도 있었습니다. 첫 팀원이어서 미숙했던 것 제외하고는 아쉬웠던 점이 없습니다. 다음에 또 만나고 싶습니다.
