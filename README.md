## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다


## 📝 프로젝트 명

- 숫자 게임 

## 📆 기간

- 2022.04.12 ~ 2022.04.15

## 👥 팀원
- @seohyeon2
- @ilim

## 🗞 순서도
![step1,2 flowchart](https://user-images.githubusercontent.com/50102522/163167155-6d6d4166-f302-46d8-a7ac-419b6d152e0e.png)


## 🙈 고민한 점, 어려웠던 점

2022.04.12.화요일 - [STEP 1] 1차 PR을 하며

- 변수 사용 여부에 대해 고민함. 변수 사용을 최대한 줄이기 위해 printResult함수의 매개변수를 튜플로 하여 바로 checkStrikeBall을 넣어 줌(main.swift 53번째). 지금의 코드와 53번째 줄 앞에 checkStrikeBall의 반환값을 갖는 변수를 선언하고, printResult의 매개변수를 튜플이 아닌 Int 2개로 바꾸어서 진행하는 것 중 어느 것이 더 명확한 코드인지 궁금함.


2022.04.14.목요일 - [STEP 2] 2차 PR을 하며
- 사용자 숫자 입력에 대한 유효성 검증을 진행할 때 어떤 방식을 코드를 작성할지 고민함.
- String 형식의 사용자 입력값을 정수형 배열로 바꿀 수 있을지 고민함. 1차 때 구현했던 사용자 숫자와 컴퓨터 숫자를 비교하는 함수는 두 숫자 모두 정수형 배열에 들어있다는 것을 전제하에 작성했음. 함수를 수정하는 것보다 사용자 입력값의 형태를 바꾸는 것이 더 적게 수정할 듯하여 사용자 입력값을 수정하기로 함.
- 이 프로젝트에서 정규표현식을 사용해도 되는지,  compactmap 메소드를 축약형으로 써도 가독성이 좋은 고민됨.


## 🐵 해결한 부분

### [1차 PR에 대한 부분]
- 튜플을 매개변수로 받을 시, 튜플 안에 담긴 변수들이 어떤 의미인지 명확하지 않아 수정함. 아래와 같이 수정했더니 의미 전달도 잘 되고 깔끔해진 것 같음.
```swift=

// 기존 코드
func printResult(result : (Int, Int)) {...}

printResult(result: checkStrikeBall(numbers: numbers))
    
// 수정한 코드        
func printResult(strikeCount: Int, ballCount: Int) {...}

let result = checkStrikeBall(playerRandomNumbers: playerRandomNumbers)
printResult(strikeCount: result.0, ballCount: result.1)

```

### [2차 PR에 대한 부분]
- filter함수나 논리연산자를 이용하여 비교할까도 생각했지만, 예시에서 요구한 입력값의 형태가 명확했기에 정규식을 쓰기로 정규 표현식을 사용하여 유효성 검사를 진행함.
- `compactMap` 메소드를 축약 형식으로 작성하여 코드를 간결하게 표현함.


## 🎁 프로젝트 수행하며 얻은 경험
- 기능요구서를 보며 순서도를 작성할 수 있게 되었음.
- 한 함수엔 한 가지 기능만 넣으려고 노력하며 함수의 단위에 대해 고민하는 시간을 갖음.
- Git을 이용해 PR하는 법과 충돌 시에 해결하는 법을 배움.
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)와 [관련 영상](https://www.youtube.com/watch?v=rbSnkiqPnJI)을 참고하며 명료한 작명을 하기 위해 노력함.
- Set을 활용하여 중복된 값을 제거하는 법을 학습함.
- commit template를 활용하여 기능마다 커밋하는 방법을 배움
- 짝 프로그래밍을 통해 드라이버, 네비게이터 역할을 각각 맡아봄. 시간은 오래 걸려도 코드의 결함을 줄일 수 있었고, 코드에 대한 다양한 아이디어를 제시해 볼 수 있었음.
- `copactMap` 메소드 사용법을 배움.