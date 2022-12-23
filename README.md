## iOS 커리어 스타터 캠프
### 숫자야구 프로젝트 저장소
- 프로젝트 기간 : 22.12.19 ~ 22.12.23

# README
# 1. 숫자 야구
# 2. 소개
- 컴퓨터는 1~9사이의 중복되지 않는 임의의 숫자 세 개를 생성합니다.
- 사용자의 입력에 따라 자리와 숫자 모두 맞다면 스트라이크, 자리는 다르지만 숫자가 포함된다면 볼로 나타냅니다.
- 9번의 시도 횟수 내에 3스트라이크를 완성하면 승리합니다.

# 3. 팀원

| vetto | 무리              |
| ----- | ------------------------------------ |
| <img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="300" height="350"/> | <img src="https://user-images.githubusercontent.com/115514179/209287299-5d100f9c-aee3-4d1d-9668-c72a0769dd58.png" width="300" height="300"/> |


# 4. 타임라인
### STEP 1 [2022.12.19~2022.12.21]
- 2022.12.19 
    - step1, step2 flowchart 설계
    - 컴퓨터, 사용자 정수 배열 변수 구현
    - 각기 다른 정수 세개 배열로 반환하는 함수 구현
- 2022.12.20
    - 배열 비교후 스트라이크,볼 개수 반환 함수 구현
    - 함수 명, 변수 명 refactoring
- 2022.12.21
    - 게임 시작 함수 구현
    - 게임 승리 출력 함수 구현
    - 함수 실행, 함수 정의 문서 분리

### STEP 2 [2022.12.22~2022.12.23]
- 2022.12.22
    - 사용자에게 메뉴 입력받는 함수 구현
    - 정수형 배열 반환 함수 구현
    - 사용자에게 게임 숫자 입력받는 함수 구현
    - 사용자에게 입력받은 수 유효성 검증 함수 구현
- 2022.12.23
    - 문서 헤더 통일 및 변경
    - 함수 명, 변수 명 refactoring

# 5. 순서도
| STEP1 | STEP2 |
|-------|-------|
|<img src="https://user-images.githubusercontent.com/115514179/209287627-aa22eb10-4793-4620-b9e9-183770e96486.png" width="480"> |<img src="https://user-images.githubusercontent.com/115514179/209286168-5b1b4efa-51dd-4062-8d64-7fe0c9e1e90e.png" width="480"> |


# 6. 실행 화면(기능 설명)
## 실행
- 게임을 실행하게 되면 사용자는 메뉴 중 선택을 하게 됩니다.
<img width="340" src="https://user-images.githubusercontent.com/115514179/209287192-7aa2b760-88d2-4ea2-84a3-c0a030435554.png">

## 잘못 된 입력 처리
- 제시되어있는 메뉴 외에 다른 것을 입력하면 다시 메뉴 선택을 하게 됩니다. 
<img width="340" src="https://user-images.githubusercontent.com/115514179/209287069-1fcad17c-2a68-413b-bfb1-0b7ae38d588c.png">

- 게임 진행 시 사용자가 조건에 부합하지 않게 입력하게 되면 시도 횟수를 차감하지 않고 다시 입력을 받습니다.
<img width="340" alt="wrongInput" src="https://user-images.githubusercontent.com/115514179/209279894-643212bc-564b-4d65-b7e9-aa3186e97975.png">

## 정상적인 게임 결과 출력 - 컴퓨터 승리
- 제시 된 기회(9번) 안에 정답을 맞추지 못하면 컴퓨터가 승리합니다.
<img width="340" src="https://user-images.githubusercontent.com/115514179/209279893-40e97cc4-e073-438c-ae4b-4c7106e6d78a.png">

## 정상적인 게임 결과 출력 - 사용자 승리
- 제시 된 기회(9번) 안에 정답을 맞추면 사용자가 승리합니다.
<img width="340" src="https://user-images.githubusercontent.com/115514179/209279480-e213e46a-a2e3-4684-a7a7-287154539e22.png">

## 게임 종료
- 메뉴 선택 화면에서 2를 입력하게 되면 게임이 종료됩니다.
<img width="340" alt="end_menu" src="https://user-images.githubusercontent.com/115514179/209279897-4323cf7d-e390-42dd-bc5d-b5248313467f.png">

# 7. 트러블 슈팅
 - git conflict
     - git에 대한 이해가 부족하여 conflict가 발생했고, 결과적으로 첫 날 했던 커밋들이 있는 branch와 리뷰어의 리뷰를 날리게되었습니다. 
     → 리뷰어의 조언으로 백업을 해둔 코드가 있어 다행이도 수습이 가능했고 git을 사용하는데에 조금 더 신중하게 된 것 같습니다. 이 과정을 통해 git reset 등을 사용해보고 git을 아주 조금 더 이해할수 있었습니다. 
     - 짝프로그래밍을 하며 git pull을 하지않아 Local에 있는 파일과 Remote에 있는 파일이 달라 conflict를 겪었습니다.
     → git status의 중요함을 깨닫는 과정이 되었습니다. 작업 전 remote에 있는 commit으로 최신 상태를 유지할 수 있게 습관을 들이려고 노력하고있습니다.
 
- Naming, 띄어쓰기
    * Naming을 할 때 함수명과 변수명에 애매모호한 명칭을 자주 사용했습니다. 
    → 리뷰어의 조언으로 [Swift API Design Guideline](https://www.swift.org/documentation/api-design-guidelines/)을 참고하여 수정을 하였습니다. 
    * swift에서는 띄어쓰기같은 부분이 중요한데 잘못된 방법을 사용하여 가독성이 좋지 않은 코드를 작성했습니다. 
    → 리뷰어의 조언으로 [Swift Style Guide](https://google.github.io/swift/#line-wrapping)를 참고하여 수정하였습니다.
    
- 매직 넘버
    - 숫자야구를 구현하며 배열의 갯수나 승리 조건 등에서 무심코 정수를 사용하게 되었습니다.
    → 리뷰어의 리뷰를 통해 매직넘버라는 개념을 알게되었습니다. 서로 같은 작업을 하고 있는 사람이라면 코드에 적힌 정수가 무엇인지 (아마도)쉽게 이해할 수 있지만, 처음 보는 사람은 저 정수가 의미하는 바를 모르기 때문에 리터럴로 작성해 주는 것을 지향해야합니다.
    
- git commit 단위&로그
    - 짝프로그래밍이 처음이라 commit단위가 낯선 개념이었습니다. step2를 진행하면서까지 교대하는 시간에 따라 선언하거나 구현한 함수를 log에 남기게되었습니다. 
    → 캠퍼와 이야기하며 좀 더 좋은 방향이 있을 것 같다는 결론을 내렸습니다. 액션 하나에 커밋을 하나씩 남기다보면 좀 더 알아보기 쉽고 나중에 코드를 리팩토링 할 때도 용이할것같다는 생각을 했습니다. 
    - 또 처음 commit 할 때 log에 누가 내비게이터가 되었는지 등을 적게되었습니다.
    → 리뷰어의 조언으로 커밋 메세지 스타일에 알게되었고, [git commit message style 블로그](https://velog.io/@hanganda23/Git-Commit-%EB%A9%94%EC%84%B8%EC%A7%80-%EC%8A%A4%ED%83%80%EC%9D%BC)를 참고하여 commit message를 알아보기 쉽게 작성하도록 하였습니다.
    
# 8. 참고 링크
* [draw.io](https://app.diagrams.net/)
* [Swift API Design Guideline](https://www.swift.org/documentation/api-design-guidelines/)
* [Swift Style Guide](https://google.github.io/swift/)
* [Swift Development Guide-Optional ](https://developer.apple.com/documentation/swift/optional)
* [Swift The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
* [git commit convention 블로그](https://doublesprogramming.tistory.com/256)
* [git commit message style 블로그](https://velog.io/@hanganda23/Git-Commit-%EB%A9%94%EC%84%B8%EC%A7%80-%EC%8A%A4%ED%83%80%EC%9D%BC)
* 
# 9. 프로젝트 수행 중 핵심 경험
 * 순서도 익히기
 * 함수 단위 고민하기
 * Git의 기본 사용(add, commit, push, pull)
 * GitHub의 원격 공동 저장소 활용
 * Git 저장소의 충돌 해결
 * Git Branch의 이해
 * GitHub에서 Pull Request 전송
 * Swift API Design Guidelines 읽어보기
 * Swift Set의 이해와 활용
 * Swift의 Optional 안전하게 처리하기
 * Git의 커밋단위 고민하기
 * Git 커밋 로그 형식 고민하기
 * 스위프트 코딩 컨벤션 고민하기
 * 동료와 협업자세 고민하기







