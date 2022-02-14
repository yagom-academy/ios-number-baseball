## ⛺️iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소
🗓 기간 : 2022.02.08 ~ 2022.02.11(3d)</br>
🗓 팀원 : [로이](https://github.com/Roy-wonji), [쿼카](https://github.com/Quokkaaa)

### 게임 규칙

- 컴퓨터가 생성한 임의의 수 세 개와 사용자가 입력한 임의의 수 세 개를 비교하여 위치와 값이 같으면 스트라이크, 숫자만 같으면 볼 입니다.
- 도전 횟수는 9번이며 9번 내로 사용자가 3스트라이크가 되면 사용자의 승리, 3스트라이크를 내지 못하면 컴퓨터의 승리입니다.
- 수의 범위는 1~9이며 중복된 수는 없습니다.

### Flow Chart
<img src = "https://user-images.githubusercontent.com/75601594/153446357-c4c8d3b9-570b-433f-b10b-a9ef7959ace9.jpg" width="300px"> </br>

### STEP1
<img src = "https://i.imgur.com/A6dBZYy.jpg" width="200px"></br>


### STEP2 
<img src = "https://i.imgur.com/OBkszO7.jpg" width="200px"> </br> 
<img src = "https://i.imgur.com/c8uOTct.jpg" width="200px">



### Naming
1. `generateRandomNumbers()함수` : 임의의 수 생성
2. `calculateStrikeBallWith() 함수` : 컴퓨터와 사용자 수를 비교하여 스트라이크, 볼을 반환한다.
3. `startGame()함수  : generateRandomNumbers()와 compareNumbers()`를 사용하여 게임을 진행하고 진행상황 및 승리자 메세지를 출력하는 함수 </br>
4. `strikeCount , ballCount`: 스트라이크 와 볼 수

### Step1
1. `generateRandomNumbers: func`  = 겹치지 않는 무작위의 3개의 수를 배열로 생성하여 반환.
2. `calculateStrikeBallWith: func` = 컴퓨터가 생성한 수와 유저의 수를 비교하여 스트라이크와 볼을 반환
3. `playGame :func` = 게임을 시작하는 함수

### 로직구현  
- `generateRandomNumbers() 함수` : 임의의 수 생성한다.
- `calculateStrikeBallWith() 함수` :  컴퓨터와 사용자 수를 비교하여 스트라이크, 볼을 반환한다.
- `playGame() 함수 : generateRandomNumbers()와 calculateStrikeBallWith()`를 사용하여 게임을 진행하고 진행상황 및 승리자 메세지를 출력한다.

### 함수의 기능
- `selectMenu()` 함수 메뉴선택 구현
- `receiveUserInputNumbers()` 사용자 입력을 받는 함수
- `saveConvertedNumbers()` 형 변환된 숫자 저장하는 함수
- `isHaveIntType()`숫자인지 검증 하는 함수
- `isHaveInRange()` 1 에서 9 까지 범위 확인 하는 함수
- `isHaveVerifiedNumbers()` 숫자 인지와 범위 안에 있는 확인하는 함수


### Trouble shooting
아래는 숫자게임을 할 수 있는 9개의 찬스가 0이 될때까지 `isHaveVerifiedNumbers()`함수가 true이면 내부의 게임을 실행하고 아니면 `receiveInputNumbers()`함수를 다시실행하는 메서드입니다.

```swift=
func playGame() {
    let chancePoint = 1
    
    while remainingChangeCount > .zero {
        if isHaveVerifiedNumbers(receiveInputNumbers()) {
            let (strikeResult, ballResult) = calculateStrikeBallWith(userInputNumbers, and: computerNumbers)
            remainingChangeCount -= chancePoint
            printPlayingGameMessage(userNumbers: userInputNumbers, ballCount: ballResult, strikeCount: strikeResult)
            if strikeCounting == endGameCount { break }
        } else {
            receiveInputNumbers()
        }
    }
    judgeGameResult()
}

```

### 문제발생)

첫번째의 값은 입력이 잘됬지만 두번째부터는 계속 `else` 로 빠지는 현상이발생했습니다. 이유는 `saveConvertedNumbers()`함수의 값을 저장하는 방식이었기때문입니다.
사용자의 입력값을 전역변수인 `var userInputNumbers `변수에 저장하는 방식인데
```swift=
func saveConvertedNumbers(_ numbers: [Int]) {
    userInputNumbers.apppend(numbers)
}

```

이와 같은 방식으로 저장을 했었습니다. 그런데 전역변수 이다보니 첫번째 값 예시)`[ 1, 4, 5]`를 저장하고 두번째 실행될때 `[2, 5, 6]`을 저장한다고 가정하면 결과적으로 6개의 값이 저장이 되기때문에 지속적으로 `false`로 빠졌던것이었습니다.

### 해결방법)
```swift=
func saveConvertedNumbers(_ numbers: [Int]) {
    userInputNumbers = numbers
```
코드는 이렇게 개선하여 최기화하여 값을 저장하는 방식으로 로직을 수정하였고 이후 정상적으로 실행이 잘 될수 있었다. 메서드의 기능을 잘 이해하고 사용하는게 좋을것이며 이런 오류를 발생시키지 않기위해서는 가독성 좋은 코드를 구현해야겠다는 생각이 들었습니다.

### 고민했던점
- 순서도 작성 방법과 기준
- commit 메세지 스타일, body 작성 방법
- 변수 및 함수 네이밍
- 전역변수 선언 지양하기 위해 inout 키워드를 얼마나 사용할지 고민
- 하드코딩을 피하기 위해 변수를 따로 선언하는 방법
- 올바른 범위의 값이 입력되었는지 검증하는 방법
- 스트라이크는 인덱스와 숫자가 같은경우 계산하였는데 볼을 계산할때는 공식문서에 있는 교집합에 대한 'intersection'메서드를 참고하였습니다. 그런데 교집합시 볼과 스트라이크 수가 겹치는 상황이 발생하여 (볼 - 스트라이크) = 찐볼 을 계산하였습니다.
- 페어프로그래밍을 할때, 상대방의 코딩 스타일을 맞춰 서로 잘 어우러지게 함과 가독성을 고민을 많이 했습니다.
- 하드 코딩에 지양하는 코드를 구현 할려고 노력을 많이 했습니다
- 함수의 기능 최대한 분리하고 하드코딩을 안할려고 노력을 많이 했습니다 😂
- 숫자를 입력할때 공백이 없을때 어떤함수로 써서 제거를 해야 할지 몰라서 고민을 많이 했습니다 😂
- 함수의 기능을 하나만 기능할 수 있도록 노력해보았는데 `isHaveIntType()`함수내에 `saveCovertedNumbers()`함수를 이용하여 값을 저장하였는데 이또한 함수의 기능이 두가지가 되는것 같다는생각이 드는데 어떻게 생각하시나요 ? 혹시 그렇다면 분리해볼 수 있는 방법이 있을까요 ?
- 함수의 기능을 잘 분리해볼 수 있는 좋은팁이 있을까요 ? 그리고 분리해야하는 기준을 어떻게 잡으면 좋을지 조언 좀 얻어볼 수 있을까요 ?
- 들여쓰기 제한을 준수하려고 했으나 해결방법이 잘 떠오르지 않았던것같습니다. 혹시 playGame()함수내 들여쓰기를 개선하여 가독성을 높이고 싶은데 선뜻 잘 떠오르지않습니다.. 개선해볼 볼 수 있는 방법이 있을까요 ?



### 궁금했던 것들
- 페어프로그래밍을 할때 프로젝트 시간을 대략적으로 정하고 지키려고했으나 예상보다 많이 지체가되는 상황이 발생하는데 효율성을 높일 수 있는 조언을 구하고싶어요! 현재는 시간을 딱정해서프로젝트를 하고 있습니다.
