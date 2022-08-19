# iOS 커리어 스타터 캠프

# 숫자야구게임

## 프로젝트 소개
1~9 사이의 중복되지 않는 숫자 3개를 컴퓨터가 생성하고, 사용자는 9번 이내에 컴퓨터가 생성한 숫자를 맞춰야 합니다. <br>
컴퓨터가 생성한 숫자와 사용자가 입력한 숫자의 순서(위치)와 숫자가 모두 일치할 경우 스트라이크, 숫자는 일치하지만 순서(위치)가 일치하지 않을 경우 볼로 판정합니다.

## 팀원
| SummerCat | 미니 |
| -------- | -------- |
| <img width="160px" src="https://i.imgur.com/TVKv7PD.png">| <img width="180px" src="https://i.imgur.com/ikEGO8k.jpg">|

## 순서도
![flowChart](https://i.imgur.com/javkghX.png)


## 실행 화면(기능 설명)
### 1. Console Menu

메뉴에 없는 값을 입력 시, 메뉴를 다시 출력하고 사용자 입력을 다시 받습니다.<br>
`2. 게임종료` 선택 시, 프로그램을 종료합니다.

![consoleMenu](https://i.imgur.com/xmOPw7R.png)

--- 

### 2. 사용자의 숫자 입력 오류 처리
사용자의 입력값에서 각 숫자 사이에 공백이 없는 경우, 입력값이 없는 경우, 입력값이 숫자가 아닌 경우 등 다양한 오류를 처리합니다.<br>
오류를 처리한 후에는 다시 입력을 받을 수 있도록 입력창을 출력합니다.

![gameMenu](https://i.imgur.com/Rhji4Ga.png)

---

### 3. 정상적인 게임 실행 화면
사용자가 입력한 숫자와 컴퓨터가 생성한 숫자를 비교하여 볼/스트라이크 판정 결과를 출력합니다. <br>
3 스트라이크가 아닐 경우, 남은 기회를 출력하고 다시 사용자 입력을 받습니다. <br>
3 스트라이크일 경우, `사용자 승리`를 출력하고, 게임 초기 메뉴를 출력합니다.

![playingGame](https://i.imgur.com/bTspSpi.png)

---

## 트러블 슈팅
1. 사용자 입력 검증 시 입력 처리와 오류 검증을 동시에 처리하는 부분
    - 사용자 입력을 받을 경우, 문자열의 형식으로 입력을 받게 됩니다. 하지만, 게임 내에서 숫자를 비교하기 위해서는 해당 입력값을 `[Int]` 형식으로 변환해야 합니다. 사용자 입력에 오류가 있을 수 있기 때문에, `[Int]`로 변환된 값을 검증해서 오류 처리를 해야 했습니다.
    - 이 과정에서 Optional Binding에 의해서 의도와 다르게 동작하는 경우들이 발생하였습니다. 예를 들어, 사용자가 아무것도 입력하지 않았을 경우 생성된`nil`값이 옵셔널 바인딩을 거치면 빈 배열 `[]`로 변환되어, 오류로 인식하지 못하는 문제가 발생하였습니다.
    - 이를 해결하기 위해서 동일한 함수에서 변형과 검증을 하는 것이 아니라 2개의 함수로 역할을 구분하여 사용하여 해결하였습니다.
        
        ``` swift
        // BEFORE
        private func validatePlayerNumbers(playerNumbers: String?) -> [Int]? {
            if let playerNumbers = playerNumbers {
                let validPlayerNumbers = playerNumbers.split(separator: " ").compactMap { Int($0) }
                    
                return validPlayerNumbers.isEmpty ? nil : validPlayerNumbers
            } else {
                return nil
            }
        }
        ```

        ``` swift
        // AFTER
        private func convert(_ playerInput: String?) -> [Int]? {
	        guard let playerInput = playerInput else {
	            return nil
            }
	        return playerInput.split(separator: " ").compactMap { Int($0) }
        }

        private func checkSizeOf(numbers: [Int]?) -> [Int]? {
	        let uniqueNumbers = Set(numbers ?? [])
	
	        guard uniqueNumbers.count == 3 else {
		        return nil
	        }
            return numbers
        }
        ```
2. 전체적인 코드의 가독성을 높이고, 각 함수의 역할을 명확하게 하기 위해서는 함수를 어느 단위까지 분리해야 할지에 대한 고민
    - 결과를 출력하는 기능, 매개변수로 들어온 값에 대해 Bool 판정하는 기능 등은 별도의 함수로 작성하기에는 함수의 역할이 지나치게 작다고 생각해 최초에는 해당 기능들을 분리하지 않고 작성했으나,
    - 이후 기능이 추가됨에 따라 함수의 볼륨이 커지면서, 가독성 향상과 함수의 역할을 명확하게 하기 위해 작은 기능도 별도의 함수로 분리하는 것이 더 타당하다고 생각하게 되었습니다.
    
3. 스트라이크/볼 카운트가 라운드 시작시에만 초기화되고, 게임 시작 시 초기화되지 않아 사용자 승리 후 다시 게임을 진행할 수 없었던 문제

    ``` swift
    private func clearCount() {
	    strikeCount = 0
	    ballCount = 0
    }

    private func playRound() {
	    clearCount()
        if let playerAnswer = receivePlayerNumbers() {
            checkRoundResultOf(playerAnswer: playerAnswer)
		
            print("\(strikeCount) 스트라이크, \(ballCount) 볼")
            tryCount -= 1
		    printTryCountResult()
        } else {
            print("입력이 잘못되었습니다")
	    }
    }

    func startGame() {
	    tryCount = 9
	    computerAnswer = generateRandomNumbers()
	    clearCount()
	
	    while tryCount > 0 && !isPlayerWin {
		    playRound()
	    }
	
	    print(isPlayerWin ? "사용자 승리" : "컴퓨터 승리...!")
    }
    ```
    - 다른 위치에서 여러번 같은 코드를 작성하는 것은 좋은 코드가 아니라고 생각하여서 카운트 변수들을 초기화 하는 함수를 별도로 작성하였습니다.
    - 각 라운드를 시작할 때마다 초기화 함수를 호출하여 카운트 변수를 초기화 할 수 있도록 하였습니다.
    - 게임을 종료시 초기화 하지 않았고, 게임을 시작하기 직전에 초기화 함수를 활용하여서 이전 게임의 기록을 지우도록 하였습니다.


## 참고 링크
- [Swift API Design Guideline](https://www.swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Optional, nil, Optional Binding](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Swift Language Guide - Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)

