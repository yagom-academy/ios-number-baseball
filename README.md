# README

# **1. 제목: 숫자게임**

# **2. 소개:**

- 흔히 ‘숫자 야구'라고 알려진 게임입니다.
- 컴퓨터가 생성한 중복되지 않은 1 ~ 9 까지의 임의의 수 3개를 맞추는 게임입니다.
- 사용자에게는 9번의 기회안에 3 스트라이크를 얻어내면 승리합니다.

# **3. 팀원**

| zhilly | som |
| --- | --- |
| ![image](https://user-images.githubusercontent.com/99257965/185579245-29e0aacd-0807-4dc5-9ce4-a43110191aaf.png) | ![som](https://user-images.githubusercontent.com/99257965/185579944-89734ee1-04c9-4176-9a80-19c0f5244ff3.png) |

# **4. 타임라인**

STEP-1

![Untitled](https://user-images.githubusercontent.com/99257965/185579752-7ac08914-71a8-4fa6-8e09-12902646172a.png)

![Untitled 1](https://user-images.githubusercontent.com/99257965/185579825-096e80a0-b7c2-47ea-b596-858d4c5ea6e3.png)

STEP-2

![Untitled 2](https://user-images.githubusercontent.com/99257965/185579857-2a3263c0-e393-4349-b0a5-b806dd3eb3ff.png)

# **5. 시각화된 프로젝트 구조**

![Untitled 3](https://user-images.githubusercontent.com/99257965/185580160-1c35bc80-61ff-4b36-8185-40ab8c5b1de3.png)

# **6. 실행 화면(기능 설명)**

## 1. 메뉴 선택

사용자가 메뉴를 선택 가능합니다.

사용자가 메뉴에 없는 값을 입력하게 되면 오류 내용을 출력해주고 다시 사용자에게 입력을 받습니다.

<img width="170" alt="%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-19_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_4 40 58" src="https://user-images.githubusercontent.com/99257965/185580237-4ca0040f-0a49-4b64-bb7b-35c4ce13e093.png">

## 2. 사용자가 숫자를 잘못 입력했을 때

사용자가 숫자를 잘못 입력하거나 범위를 벗어난 경우, 갯수가 잘못된 경우, 숫자가 아닌 값을 입력한 경우 등 잘못된 입력에 대해 알려줍니다. 이 경우에는 게임을 진행할 수 있는 횟수를 차감하지 않습니다.

<img width="238" alt="%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-19_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_4 41 55" src="https://user-images.githubusercontent.com/99257965/185580394-7c834b3a-a27d-4b21-bc22-846ae5ef09a7.png">

## 3. 정상적인 게임 결과

- 사용자가 승리한 경우 : 사용자가 컴퓨터가 생성한 임의의 수를 맞췄을때 “사용자 승리!”를 출력해주고, 게임 선택 메뉴로 돌아가게 됩니다.

<img width="305" alt="%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-19_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_4 43 24" src="https://user-images.githubusercontent.com/99257965/185580421-f02e9708-7866-4437-9620-8a0f4c27f3e9.png">

- 컴퓨터가 승리한 경우 : 9번의 시도 후에 사용자가 컴퓨터가 제시한 수를 맞추지 못 하면 컴퓨터 승리로 끝이 납니다.

![Untitled 4](https://user-images.githubusercontent.com/99257965/185580499-d5fd8b00-987d-46f1-b1bd-93d0d44fd633.png)

## 4. 게임 종료

사용자 메뉴에서 ‘2. 게임 종료’를 선택한 경우, 정상적으로 게임 종료 가능합니다.

![Untitled 5](https://user-images.githubusercontent.com/99257965/185580528-4f987864-bcff-4a58-af9f-3df1a5d8cdba.png)

# **7. 트러블 슈팅**

### Step 1

- Naming, Convention
    
    → 변수 및 함수의 Naming과 Convention 고민에 많은 시간을 할애 했었습니다. 리뷰어가 조언해준 사이트맻 Swift API Design Guidelines를 활용하여 Naming을 하고, Convention을 수정했습니다. 
    
- 함수의 기능분리
    
    → 함수 하나에 많은 기능들을 내포하고 있으면 함수들의 결합도가 높아지므로 좋은 프로그램이라고 할 수 없습니다. 따라서 별도의 함수로 분리 하는 리팩토링 과정을 거쳤습니다.
    
    ```swift
    private func playNumberBaseball() {
            resetNewGame()
            putNumberInArray()
            
            while numberOfAttempts > 0 {
                inputUserThreeNumber()
                setThreeStrike(strikeCount: displayGameStatement())
                confirmNumberOfAttempts()
            }
            
            judgeWinCondition()
    }
    ```
    
    대표적으로 playNumberBaseBall() 내부의 코드들을 다른 메서드로 분리시켰습니다.
    
- 캡슐화 및 접근제어
    
    → 외부에서 내부 변수와 메서드에 접근하지 못하도록 보안성을 높이기 위해 `protocol`을 사용하여 별도의 파일과 `class`로 만들어 캡슐화,은닉화하는 과정을 진행했습니다.
    
    ```swift
    //NumberBaseballLibraryProtocol.swift
    protocol NumberBaseballLibraryProtocol {
        func startUserMenu()
    }
    
    //NumberBaseballLibrary.swift
    extension NumberBaseballLibrary: NumberBaseballLibraryProtocol {
        func startUserMenu() {
            var flag = true
            
            while flag {
                flag = displayUserMenu()
            }
        }
    }
    ```
    

### Step 2

- commit 단위 고민(메서드를 고칠 때, 다른 메서드를 건드려야 하는 경우 / 커밋 시기를 놓쳐 뭉텅이로 보낼 경우)
→ 연관된 메서드를 수정해야만 하는 상황이라면 묶어서 commit
→ Fork에서는 commit 분리가 가능합니다.
- Optional binding 활용 방법
→ 옵셔널 활용에 관해서는 [스위프트 기초 문법]([https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html))을 더 참고해보겠습니다.
- 예외 처리에 대한 방법 고민
→ `do-try-catch` 및 `result type` 키워드로 더 공부해보겠습니다.
- 무한 루프 방식
→ while문도 괜찮지만, 재귀함수로도 구현하는 방법도 있다는 걸 알게 되었습니다.
- 컨벤션 통일
→ 각자의 코드 스타일이 다르기 때문에 팀원과 컨벤션에 대해 이야기를 나누고 통일하는 과정이 필요하다고 생각합니다.

# **8. 프로젝트 수행 중 핵심 경험**

- Flow chart 작성
- Git의 이해
- Git의 사용법 (clone, add, commit, push, pull)
- Git commit 단위 고민하기
- Git branch 나누기, merge로 병합하기
- Github의 Collaborator 기능
- 짝 프로그래밍
- Optional을 안전하게 처리하는 방법들
- 함수의 캡슐화 및 접근제어 고민
- 함수의 기능분리 고민
- Naming과 Convention 고민하기
- 매일 스크럼 진행
- Group rules 정하기

# **9. 참고 링크**

- [API Design Guidlines]([https://swift.org/documentation/api-design-guidelines/](https://swift.org/documentation/api-design-guidelines/))
- [Swift Style Guide]([https://google.github.io/swift/](https://google.github.io/swift/))
- [draw.io]([https://app.diagrams.net/](https://app.diagrams.net/))
- [The Basics]([https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html))
- [Error Handing]([https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html))
- [NAVER Engineering - 영어 변수명을 잘 지어보자]([https://tv.naver.com/v/4980432/list/267189](https://tv.naver.com/v/4980432/list/267189))
- [GitBook]([https://www.gitbook.com/](https://www.gitbook.com/))
