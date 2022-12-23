
## 1. 제목: 숫자야구게임

## 2. 소개: 임의의 수 3개를 입력하여 컴퓨터의 임의의 수 3개와 비교하는 게임
        
### 게임 규칙
        
        위치랑 숫자가 같으면 스트라이크, 위치는 다른데 숫자는 같으면 볼.
        9번의 기회동안 3스트라이크를 완성하면 승리
        
## 3. 팀원

3-1. 사진 (아바타 or 미모지)

<img width="200" alt="image" src="https://user-images.githubusercontent.com/114971172/209290192-27c1d18e-fd9a-4d47-97cd-2151e29dcea7.png"> <img width="200" alt="image" src="https://user-images.githubusercontent.com/70146658/209290337-44326f63-60ee-49b7-8170-e3c3ec750002.png">
                                                       
3-2. 닉네임 리지 & brody

## 4. 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시

[STEP1] 
1) 2022.12.19 임의의 정수 3개를 생성하는 함수 구현
2) 2022.12.20 유저 입력과 컴퓨터 입력을 비교하는 함수 구현

[STEP2]
1) 2022.12.21 사용자 입력 에러처리 및 게임시작함수 구현
2) 2022.12.21 3개숫자 입력 오류처리 기능 구현
3) 2022.12.22 step2 요구사항에 맞게 유저입력과 컴퓨터수를 비교하는 함수 구현
4) 2022.12.22 기능 및 임의의 3개 정수 검증 구현


## 5. 시각화된 프로젝트 구조(다이어그램 등)
 
<img src = "https://user-images.githubusercontent.com/70146658/208584198-60fc9c84-51c3-45af-8dc3-d8eb5fb9c1a1.png" width = 600>


## 6. 실행 화면(기능 설명)

### 6-1. 화면 스크린샷 or gif

### [사용자승리]

![image](https://user-images.githubusercontent.com/114971172/209277493-07774860-8958-4e07-96a2-9cd5d24a5584.png)

### [컴퓨터승리]

<img width="320" alt="스크린샷 2022-12-23 오후 4 32 06" src="https://user-images.githubusercontent.com/70146658/209292504-8c9cae30-706e-45b3-8acb-691ca249756f.png">



6-2. 해당 화면에 대한 설명

### [사용자승리]
  1) 코드를 실행하면 게임 메뉴가 출력
  2) 원하는 기능인 1을 입력하면 안내 문구 출력 후 입력칸 출력
  3) 임의의 수 3개 입력받기
  4) 입력받은 숫자가 스트라이크인지 볼인지 판별하여 결과 출력
  5) 남은 기회가 차감되어 출력
  6) 3 스트라이크 달성 후 사용자 승리! 출력
  7) 다시 게임 시작
### [컴퓨터승리]
  1) 사용자 승리 시나리오와 1-5 번까지 동일
  2) 남은 기회가 0이고 사용자가 3 스트라이크를 완성하지 못하면 컴퓨터 승리...! 출력


## 7. 트러블 슈팅

### 7-1. 겪었던 문제점, 고민했던 부분 → 해결책

### 1. 함수의 기능 분리
함수의 코드를 작성할 때 게임이 제대로 작동하는지에 대해 초점을 맞추다 보니 함수의 기능적인 측면은 고려하지 못한것 같다.
제이푸시의 의견대로 함수는 한가지 일만 하도록 수정을 하는 것이 좋고 그 이유는 함수의 기능이 지금 작성한 함수보다 단순해지면 오류를 처리하고 어느 구간에서 어떤 함수를 써야하는지 한눈에 파악하기 쉬울 것 같다! 

또한 함수가 많아지면 main 파일의 길이가 길어지므로 파일 분리를 해보려고 한다!

-> 작성한 함수중 복잡한 함수는 분리하여 한가지 기능만 하도록 구현, 파일을 분리하여 작성

#### 함수의 기능 분리 작성에 도움이 되는 팁! (by.제이푸시)
숫자야구게임을 시작하는 함수를 작성하고 그 안에 필요한 함수들을 입력해보기!
우리가 STEP0 에서 만든 순서도를 참고하면 훨씬 좋을 것 같다

### 2. 에러처리에 대한 방법
에러처리에 대해 do catch문을 작성 -> 다른 깊이의 에러처리를 하려다보니 코드의 가독성이 좋지않아지는 문제가 생김 -> Result타입 사용의 제안 -> 

### 3. 코드스타일
```swift
forEach
(0..<computerBallsArray.count).forEach{ index in
        if computerBallsArray[index] == userBallsArray[index] {
            strike += 1
            return
        }
```

   for문을 명시적으로 사용하지 않고 (0.. <computerBalls.count).forEach{ print($0) } 와 같은 코드처럼 코드를  작성하는 방법이 권장하는 코드인지 고민하였음.
   → 리뷰어를 통해 권장하지 않는 코드스타일은 아니라고 리뷰를 받았음.
   → for 구문은 break,continue 처럼 제어구문을 사용할 수 있는 반면 forEach는 return을 통해 for 구문의 continue 역할의 제어만 가능한 점을 고려하여 for 구문을 사용할 필요성은 없어 forEach로 코드를 한줄로 단순화 시키고자 함. 

### 4. 변수명네이밍
변수명에 computerBallArray, userBallsArray로 타입이 들어가게 작성하는 것이 API Design GuideLines에서 지양하는 것이라 생각되어 네이밍이 고민이었음 
→ 변수명에 타입만 적힌것이 아니라 역할도 명시되어 있기 때문에 직관적으로 사용하는 것이 적합하다고 생각되어 유지

### 5 네이밍 시점
코드를 작성할 때 네이밍을 하는 것이 어려워서 완성되기 전 commit을 할 때 임시이름으로 구현해서 커밋을 올렸음. -> 시간이 걸려도 그떄그때 하는 것이 좋다는 피드백을 받았고 이 말에 대해 생각해보니 나중에 오류가 발생했을 때 네이밍을 미리미리 하지않는다면 고치기 힘들 거라는 생각이 들어 미리미리 네이밍을 하기로 결정함. -> 네이밍, 컨벤션 등 기본적인 것에 무게를 두자!

### 6. 타입 설정
   중복되지 않는 임의의 수 3개를 담는 Set 타입 선정
   그런데 볼과 스트라이크를 비교하는 과정에서 Set 타입으로 두개의 Input 값을    비교하면서 Set 자체의 내장함수만으로는 값을 비교하기 어려웠음
   → Array 타입으로 변환 하여 해결

### 7. 중복숫자 제거하기

중복된 숫자를 입력값으로 받지 않게 하기 위해 작성한 코드가 하나하나 비교해주는 방법으로 작성하였음. 그러나 이 코드의 가독성이 떨어지고 추후 3개 이상의 숫자를 비교한다면 오류처리를 하기 어렵다고 생각함. -> Set 또는 고차함수로 바꾸기!



README DAY에 README를 완벽하게 완성하는 것이 아니기 때문에 포트폴리오 제출시 다시 한번 다듬어 봅시다.
## 8. 참고 링크

- [Swift API Design GuideLines - Naming](https://www.swift.org/documentation/api-design-guidelines/)
- [Swift Doc - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
- [Apple Developer Documentation - Result](https://developer.apple.com/documentation/swift/result)
- [Apple Developer Documentation - compactMap](https://developer.apple.com/documentation/swift/sequence/compactmap(_:))

