## iOS 커리어 스타터 캠프

# :baseball: 숫자야구 프로젝트 저장소

### Contributors
[@junbangg](https://github.com/junbangg)    
[@Quokkaaa](https://github.com/Quokkaaa)  

# :date: 타임라인 ('21.10.05 ~ 21.10.08')
**2021.10.05 Tue**

- 프로젝트 요구사항 파악 및 이해
- FlowChart 작성

**2021.10.06 Wed**

- 프로그램에 대한 구상 및 설계
- 페어 프로그래밍
- 서로간의 피드백
- STEP 1 PR

**2021.10.07 Thu**

- STEP 1 PR 리뷰 분석
- 네이밍과 코드 리펙토링에 대한 토의
- STEP 1 PR에 대한 1차 리뷰 일부 코드에 반영

**2021.10.08 Fri**

- STEP 1 PR에 대한 2차 리뷰 분석
- [@YongHoonJJo](https://github.com/YongHoonJJo) 리뷰어와 STEP 1 코드 검토
- STEP 1 마지막 PR에 대한 피드백 코드에 반영
- README 작성


### :rowboat: 프로그램 순서도(FlowChart)
![aladdin_quoka - Page 1](https://user-images.githubusercontent.com/91132536/136190468-8d50cd81-9c87-4750-aaac-1768e298be5f.png)

# STEP 1 기능 구현


# :game_die: 임의의 수 생성 함수
### [코드]

`private func generateRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1..<10))
    }

    return randomNumbers
}`

1. `private func generateRandomNumbers() -> Set<Int> {`
  - Set<Int>타입을 선택한 이유는 중복의 수를 갖지않는 특성이있어 `Int.random`생성한 값을 `Set<Int>`안에 넣어줌으로써 중복되지않은 임의의 수를 생성할 수 있습니다.

2. for문이 아니라 while문을 사용한 이유
  - for문은 반복해야하는 횟수를 알고있을때 사용하고, 알 수 없다면 특정한 조건을 만족시킬때까지 반복하는 while문을 사용하는 걸로 알고 있습니다. 
    그런데 Set<Int>안에는 중복되지않은 숫자가 3개가 생성되어 들어가야하는데 for문으로는 중복되지않은 숫자 3개 생성이라는 조건을 성립시킬 수 가 없기때문에 while문을 사용할 수 밖에 없습니다.
    `while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1..<10))
    }`


  

# :mag_right: 스트라이크와 볼계산하는 함수
  
### [코드]
`private func calculateStrikeBall(from computerNumbers: Set<Int>, and playerNumbers: Set<Int>) -> (strikeCount: Int, ballCount: Int) {
    let maximumBallCount = computerNumbers.intersection(playerNumbers).count
    var strikeCount = 0
    let computerNumbers = Array(computerNumbers)
    let playerNumbers = Array(playerNumbers)
    
    for i in 0..<3 {
        let count = (computerNumbers[i] == playerNumbers[i] ? 1 : 0)
        strikeCount += count
    }
    
    let ballCount = maximumBallCount - strikeCount
    
    return (strikeCount, ballCount)
}`

1. `private func calculateStrikeBall(from computerNumbers: Set<Int>, and playerNumbers: Set<Int>) -> (strikeCount: Int, ballCount: Int) {`
  - 반환타입이 [Int]에서 (튜플 Int)타입으로 변경한 이유는 하드코딩하는 점을 피드백받고 가볍게 사용할 수 있는 튜플을 사용하였습니다. 
    이로써 생기는 장점을 살펴보면 배열을 사용했을때는 `return [strikeCount, ballCount]` 안의 인덱스를 결과를 출력할때 다시 변수에 각각의 인덱스를 담아야하지만
    튜플을 사용하면 한 개의변수로 담아 코드를 줄일 수 있고 `print()`출력할때도 아래 나올 인덱스를 표시하는게 아니라 `let (strikeCount, ballCount)`에 담겨있는 변수로 출력할 수 있다.
2. 스트라이크를 계산하는 방법(if문을 사용하지않고 삼항연산자 로 들여쓰기 2번이라는 요구사항을 제약사항 준수)
  - 매개변수인 `computerNumbers`와 `playerNumbers`를 각각 배열 변수에 담아 삼항 연산자로 `strike`를 계산했습니다.
    `computerNumbers[i] == playerNumbers[i] ? 1 : 0)` 코드로 true이면 1을 반환하게 사용 if구문을 사용하면 들여쓰기 초과와 가독성 또한 영향이가게되어 삼항 연산자로 사용했습니다.
  
  
  
  
# :email: 게임결과를 반환하는 함수(조건: 3 strike)
  
### [코드]
`private func getGameResult(by strikeCount: Int) -> Bool {
    return strikeCount == 3
}`

  
  
  
# :paw_prints: 플레이어의 임의의 수를 문자열로 출력 함수

### [코드]
`private func createPlayerNumbersString(with playerNumbers: Set<Int>) -> String {
    let playerNumbers = Array(playerNumbers)
    var playerNumbersString = "임의의 수 : "
    
    for number in playerNumbers {
        playerNumbersString += " \(number)"
    }

    return playerNumbersString
}`

1. 네이밍을 지을때 playerNumbers를 문자로 출력하는걸 생각하여 함수명을 지었지만,, 어떤 수를 출력하는지에 대한 명확성이 보이지않아
  `createPlayerNumbersString`로 수정하였습니다. 
2. 임의의수를 결국 출력해줘야하는 기능이기에 Set<Int>타입의 수를 받아 `String`타입으로 반환하여 print()를 대체합니다.
3. 이 또한 순서대로 값을 꺼내와 `String`으로 return을 해야하기때문에 임의의 수를 배열에 담아 문자열 보간법을 사용하여 반환할 `playerNumbersString` 변수에 값을 담아줍니다.
  
  
  
  
  
# :mag_right: 게임결과 출력

### [코드]
`private func printGameResult(by playerHasWon: Bool) {
    let target = playerHasWon ? "사용자" : "컴퓨터"
    print("\(target) 승리하였습니다...!")
}`
  
1. `printGameResult(by playerHasWon: Bool)`인 함수명과 매개변수의 네이밍을 고민했습니다. 
  - Bool타입의 네이밍은 has, is로 네이밍 컨벤션에 준수하여 적절하게 넣었고 true와 false 두가지 형태로 값이 나뉘기에 매개변수명도 현재완료형으로 작성했습니다.
2. if문으로 승리를 결정하는 코드를 작성하였지만 들여쓰기 요구사항을 준수하고 가독성을 위해 삼항연산자를 사용했습니다.
 
  
  
  
  
# :video_game: 숫자야구게임을 시작하는 함수
  
### [코드]
`private func startNumberBaseballGame() {
    var remainingChance = 9
    let computerNumbers = generateRandomNumbers()
    var playerHasWon = false
    
    while remainingChance > 0 {
        let playerNumbers = generateRandomNumbers()
        print(createPlayerNumbersString(with: playerNumbers))
        
        let (strikeCount, ballCount) = calculateStrikeBall(from: computerNumbers, and: playerNumbers)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        playerHasWon = getGameResult(by: strikeCount)
        if playerHasWon { break }
        
        remainingChance -= 1
        print("남은 기회 : \(remainingChance)")
    }
    printGameResult(by: playerHasWon)
}`
  
1. 변수 `chance`에서 모호성을 피드백하여 `remainingChance`로 수정 했습니다.
2. 함수의 반환값을 담아주기위한 상수 `computerNumbers`와 while문 안에 상수 `playerChance`를 만들었습니다.
3. 변수 `playerHasWon`를 기본값 false로 설정 함으로 사용자의 승리와 컴퓨터의 판별을 구분할 수 있다.
4. while문 안에 게임이 종료되는조건 2가지(strikeCount == 3, remainging <= 0)을 표기한다.
  - 상수 튜플안에 임의의 수를 가지는 `computerNumbers`와 `playerNumbers`를 `calculateStrikeBall(from: computerNumbers , and: playerNumbers)`안에
    전달해줌으로써 결과를 값을 출력할 수 있다.
5. `getGameResult(by: strikeCount)`함수에 스트라이크 값을 전달 해줌으로써 스트라이크 여부를 검증하고
    `if playerHasWon { break }`로 결과를 체크하여 승리시 break 그렇지않을시 `remainingChance`를 차감한다.
    만약에 break가 걸리면 마지막 `printGameResult(by: playerHasWon)` 함수를 호출함으로써 결과를 출력하고 게임종료

         
                                                              
                                                              
# :checkered_flag: [PR 후 방향성]
- 함수의 기능구현을 담당을 적절히 분배하여 밸런스를 맞춘다.
- 함수를 하나의 기능만을 할 수 있게하고 그외 기능들이 보이면 쪼개어 또 다시 함수를 구현했다.
- 네이밍을 생각할때는 함수기능의 특징을 반환타입을 고려하여 명확성을 높여준다.
- STEP 1의 주요 함수기능들을 잘 이해하고 프로젝트 마지막날은 복귀하고 README를 작성 하는걸 목표로 프로젝트를 진행한다.
