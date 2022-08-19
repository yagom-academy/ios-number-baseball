## ⚾️ 숫자야구게임

### 📑 소개
---
- 1~9사이의 중복되지 않은 수를 컴퓨터가 생성하고, 사용자는 그 숫자가 무엇인지 맞추는 게임을 구현합니다.

### 🧑🏻‍💻 팀원
---

|Wonbi|Stone|
|:----:|:----:|
|<img src="https://avatars.githubusercontent.com/u/88074999?v=4" width="200px" height="200px">|<img src="https://avatars.githubusercontent.com/u/74972815?v=4" width="200px" height="200px">|
|**[Wonbi](https://github.com/wonbi92)**|**[Stone](https://github.com/lws2269)**|
### ⏱ 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시
---
- 2022.08.16
	- 공식문서 공부 및 순서도 작성
    - [Swift Language Guide - Optionals, nil, Optional Binding](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
    - [Swift Language Guide - Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
        
 - 2022.08.17
 	- 임의의 수를 생성하는 함수 구현
 	- 컴퓨터의 수와 임의의 수를 비교하여 스트라이크와 볼 결과물을 반환하는 함수 구현
    - 코드 리팩토링 진행

- 2022.08.18
	- 리뷰어의 피드백에 따른 코드 리팩토링
    - 리뷰어의 피드백에 따른 네이밍 수정
    - 승리 조건에 따라 `while`문을 탈출하도록 함수 수정
	- 사용자에게 메뉴를 출력하고 입력받은 숫자를 처리하는 함수 구현
 	- 사용자의 숫자를 입력받아 게임을 진행하고 결과를 출력하는 함수 구현
   
- 2022.08.19
	- 사용자의 숫자를 입력받고 유효성을 검사하는 과정 리팩토링
    - 리뷰어의 피드백에 따른 네이밍 수정
        

### 💡 순서도
---
![순서도](https://github.com/wonbi92/ios-number-baseball/blob/main/numberBaseballFlowChart.png?raw=true)

### 📱 실행 화면(기능 설명)
---
6-1. 화면 스크린샷 or gif
6-2. 해당 화면에 대한 설명
### 🚀 트러블 슈팅
---
### 📍 Step 1

#### 스트라이크와 볼을 체크하는 부분

- 스트라이크와 볼은 두가지의 조건을 만족해야 하는 결과값이다. 숫자의 위치가 일치하는가, 그리고 숫자가 일치하는가, 이렇게 두가지인데 이 두가지를 비교하면서 동시에 들여쓰기를 2번 이상 하지 않기 위해 여러 고차함수들을 사용해야만 했다. 그 과정에서 `enumerated`메소드와 `forEach`메소드를 공부하게 되었다. 이 고차함수들을 통해 들여쓰기를 2번 이상하지 않고 코드를 작성할 수 있었다.

#### 기능 분리를 어디까지 해야 하는가?

- 사용자의 승리 조건은 **3스트라이크**이고, 컴퓨터의 승리 조건은 **남은 횟수가 0일 때**로 다른데, 이 부분에 대한 처리를 기능을 분리해서 처리해줘야 할지, 한번에 처리해줘야 할지 판단이 잘 서지 않았다. 일단 과제에서 제시한 대로 3가지의 함수로만 기능을 분리해서 코드를 작성하였고, 정답은 없지만 3 스트라이크와 남은 횟수가 0은 게임을 종료하기 위한 조건이기에 한가지 기능으로 생각해도 괜찮을 것 같다는 피드백을 받았다. 또, 과제에서 3개의 함수로만 기능을 구현하는 것이기 때문에 괜찮을거 같다는 피드백을 받았다. 우리는 상의 후 피드백을 받기로 결정하였고 이를 토대로 리팩토링을 진행하였다.

### 📍 Step 2

#### `reciveNumbers()` 함수의 구현
- 함수를 구현하는 과정에서 입력값을 배열로 만들고, 그 배열의 요소를 `Int`타입으로 형변환하고, 유효성을 체크하는 것까지 너무 많은 요소들이 있어서 구현하는 데 문제가 많았다.

- 배열의 요소들을 `Int`타입으로 형변환하는 과정을 구현할 때 `compactMap`메소드를 알게 되었다. `compactMap`은 `map`과 유사하지만, 클로져 안에서 처리된 후 반환되는 값이 `nil`이면 그 값을 반환하지않고, 옵셔널을 벗긴 값만 반환하여 새로운 배열을 만들어주는 메소드였다. 

- 이 `compactMap`메소드를 통해 `Int`타입으로 형변환되지 않는 값들을 제외할 수 있었다.
```Swift
guard separatedNumbers.count == 3 else { return nil }
let oneDigitNumbers = removeDuplicate(separatedNumbers).filter{ $0 < 10 }
guard oneDigitNumbers.count == 3 else { return nil }
```
- 또, 위 코드에서, `separatedNumbers.count`의 값이 3인지 체크하는 것과 `oneDigitNumbers.count`값이 3인지 체크하는 과정이 두번 들어간 이유는 사용자가 `1 10 20 3 4`과 같이 입력하는 경우, `separatedNumbers.count`의 값이 3인지 체크하는 과정이 없으면 `filter`로 10미만의 수를 걸러냈을 때 `oneDigitNumbers.count`가 3으로 유효성 검사를 통과하는 문제가 있어서 1차로 `separatedNumbers.count`를 3으로 유효성 검사해주었고, 그다음 `filter`로 10 미만의 수를 걸러낸 후 `oneDigitNumbers.count`를 3으로 다시 유효성 검사를 진행하는 방식으로 구현하였다.

#### `isGameStart`변수
- `gameMenuSelect()`함수에서, 사용자가 메뉴숫자를 2로 입력했을 때 `while`문의 반복조건이 만족하지 않도록 `isGameStart`라는 플래그 변수의 값을 `false`로 바꿔주어 `while`문이 종료되도록 구현하였다.

#### `removeDuplicate()`함수
- 입력받은 값을 `Set`로 넣으면 순서가 바뀌지 않는 것을 확인하긴 했지만, `Set`라는 컬렉션 타입이 순서가 없는 컬렉션 타입이기 때문에 신뢰도가 떨어져서 배열의 중복을 제거해주는 함수를 따로 구현해서 사용하게 되었다.

#### 전역변수를 모두 함수 내 지역변수로 만들기
- 기존 Step01에선, `computerNumbers`변수와 `userNumbers`변수, `gameCounter`변수를 전역변수로 선언하여 사용했는데, Step02에서는 `userNumbers`라는 변수는 입력값을 받아 옵셔널 바인딩한 값으로 대체가 가능하여 제거하였습니다.
- 또, `computerNumbers`변수와 `userNumbers`변수 역시 `playGame()`함수 내에서 지역변수로 처리가 가능하여 함수 내 지역변수로 다시 선언해주었다.

### 📎 참고 링크
- [Swift Language Guide - Optionals, nil, Optional Binding](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Swift Language Guide - Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
