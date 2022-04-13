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

## 🐵 해결한 부분

- 튜플을 매개변수로 받을 시, 튜플 안에 담긴 변수들이 어떤 의미인지 명확하지 않아 수정을 함. 아래와 같이 수정을 했더니 의미전달도 잘 되고 깔끔해진 것 같음.
```swift=

// 기존 코드
func printResult(result : (Int, Int)) {...}

printResult(result: checkStrikeBall(numbers: numbers))
    
// 수정한 코드        
func printResult(strikeCount: Int, ballCount: Int) {...}

let result = checkStrikeBall(playerRandomNumbers: playerRandomNumbers)
printResult(strikeCount: result.0, ballCount: result.1)

```

## 🎁 프로젝트 수행하며 얻은 경험
- 기능요구서를 보며 순서도를 작성할 수 있게 되었음.
- 한 함수엔 한가지 기능만 넣으려고 노력하며 함수의 단위에 대해 고민하는 시간을 갖음.
- Git을 이용해 PR하는 법과 충돌 시에 해결하는 법을 배움.
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)와 [관련 영상](https://www.youtube.com/watch?v=rbSnkiqPnJI)을 참고하며 명료한 작명을 하기 위해 노력함.
- Set을 활용하여 중복된 값을 제거하는 법을 학습함.
- commit template을 활용하여 기능마다 커밋하는 방법을 배움
- 짝 프로그래밍을 통해 드라이버, 네비게이터 역할을 각각 맡아봄. 시간은 오래걸려도 코드의 결함을 줄일 수 있었고, 코드에 대한 다양한 아이디어를 제시해 볼 수 있었음.
