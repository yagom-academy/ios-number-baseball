## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소

# 제목 : 숫자게임⚾️
## 소개🙋‍♀️🙋‍♂️
1~9사이의 서로다른 3개의 숫자와 사용자가 입력한 숫자 3개를 비교하여, 스트라이크와 볼을 판정하여 승패를 결정한다.
## 팀원 : inho, rhovin
## 타임라인⏰
- 8/16 (화) Step1 PR
- 8/17 (수) Step1 피드백 수정
- 8/18 (목) Step1 피드백 수정
- 8/19 (금) Step2 PR
## 순서도
![Step0 숫자게임 순서도](https://user-images.githubusercontent.com/49301866/185075724-66539912-5927-496f-8ea6-03f963f0dd85.png)

## 실행화면 🖥
**게임 시작 선택**
<img width="406" alt="스크린샷 2022-08-19 오후 5 47 19" src="https://user-images.githubusercontent.com/71054048/185581890-baec5adf-77e9-4e85-8b66-f6e558f0ca3a.png">
-  1번 메뉴를 입력하여 게임을 시작한다.
-  1 ~ 9 사이의 중복되지 않는 숫자 세개를 받는다.
- 입력 형식이 틀린 경우 "입력이 잘못됐습니다" 문구를 출력하고 올바른 입력시에는 게임이 1회 진행된다.

**게임 종료 선택**
<img width="383" alt="스크린샷 2022-08-19 오후 5 53 54" src="https://user-images.githubusercontent.com/71054048/185582930-55f76942-38fd-498c-8dd9-8dc2b225f678.png">

- 2번 메뉴를 입력하여 게임을 종료한다.

**사용자 승리**
<img width="399" alt="스크린샷 2022-08-19 오후 5 58 20" src="https://user-images.githubusercontent.com/71054048/185584127-9233733d-d8b8-4ba3-bef3-8f9e5dde76a3.png">
- 컴퓨터가 생성한 숫자와 사용자가 입력한 숫자가 순서까지 모두 일치한 경우 사용자 승리

**컴퓨터 승리**
<img width="424" alt="스크린샷 2022-08-19 오후 5 59 49" src="https://user-images.githubusercontent.com/71054048/185584052-94c771be-95b3-4570-bfe9-10ac28ac343b.png">
- 총 9회동안 사용자가 컴퓨터의 숫자를 맞추지 못하면 컴퓨터의 승리
---

## 겪었던 문제점🤯, 고민했던 부분🤔 & 해결책
**Step 1 & Step2**
- 팀 프로젝트를 처음 진행하면서, push와 pull을 하는 과정에서 로컬 파일과 원격 파일사이에 충돌이 있었다. 로컬 저장소를 변경한 상태로 원격 저장소의 파일을 가져오려고 하니 생기는 충돌이었다. (git reset)
- 순서도 작성하면서 얼마나 디테일하게 작성해야할지 고민했다.
- 변수와 함수의 역할을 잘 나타내면서 불필요한 단어가 없고 생략되는 의미가 없도록 고민했다. 
- 한 함수에 여러가지 기능이 표함되지 않도록 기능을 구분지어 함수를 정의하고 기능을 분리했다.

**코드 수정 전**
```swift
func judge(_ myNumbers: [Int]) { }
func showResult() { }
func isValid() -> Bool { }
```

**코드 수정 후**✏️
```swift
func countStrikeOrBall(with myNumbers: [Int]) -> (Int, Int) { }
func manageNumberBaseballGame() { }
func isThreeStrike() -> Bool { }
func checkValid() -> [Int] { }
```

## 새로 배운 점
- 다른 사람이 이해하기 좋은 코드에 대해 더 생각해 보게 되었다.
- PR, 코멘트와 README 등 문서화 할 수 있는 것들을 나중에 확인 할 때에도 이해하기 쉽게 작성하도록 고민했다.
- 팀원과 처음 짝프로그래밍을 하면서 혼자서 생각하지 못한 관점과 방향을 직접 보고 배울 수 있었다.
- 좀 더 집중력있게 몰입할 수 있었다.
