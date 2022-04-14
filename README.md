# Wongbing & Finnn

# 목차

* [Ground Rules](#Ground-Rules)
* [프로젝트 개요](#프로젝트-개요)
* [Flow Chart](#Flow-Chart)
* [고민한 점 및 깨달은 내용](#고민한-점-및-깨달은-내용)
* [피드백 수정한 내용](#피드백-수정한-내용-(feat.-Mino))


## Ground Rules

* 12시 이전까지 서로 소통 끝내기
* 일요일은 충전하기

### 스크럼

* 활동학습이 없는 매일 오전 10시에 디스코드에서 진행
* 어제 한 일
* 오늘 할 일
* 컨디션

### 프로젝트 규칙

* 커밋 메시지 규칙
    * 가능한 type의 종류만 기재하도록 한다.
        * feat = 주로 사용자에게 새로운 기능이 추가되는 경우
        * fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
        * docs = 문서에 변경 사항이 있는 경우
        * style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        * refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
        * test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        * chore = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
* PR 규칙
    * PR을 보낼 때 README 작성과, 순서도 포함해서 보내기
    * 리뷰어를 멘션하여 알리기(개인 DM으로도 따로 알림)
    * PR에 달린 코멘트를 기반으로, 수정 후 답글 달기
    * 모든 수정이 끝난 시점에는 마지막 consertion에 리뷰어 멘션 후 개인 DM으로 알리기
    * 금요일 6시 이전까지 PR 보내기





* 기타 코딩 컨벤션
    * 네이밍 가이드 최대한 준수하기!
    * [네이밍 가이드 한글 번역본](https://minsone.github.io/swift-internals/api-design-guidelines/)

## 프로젝트 개요
* 대한민국 육군을 나왔다면 누구나 한번쯤은 해봤을 '**숫자 야구게임**'을 코드로 구현하는 프로젝트이다.
* 랜덤한 세 개의 숫자가 주어지고, 플레이어는 그 세 개의 숫자와 위치를 유추하는 게임이다.
* **Game Rule**
    1. 플레이어는 세 개의 숫자를 제시한다.
    2. 해당 숫자를 미리 주어진 랜덤한 숫자와 비교한다.
    3. 값과 인덱스가 모두 일치하면 스트라이크, 값만 일치하면 볼로 판정한다.
    4. 주어진 기회 안에 3 스트라이크를 모두 맞추면 사용자의 승리, 기회가 모두 소진되면 컴퓨터의 승리로 한다.






## Flow Chart

<img width="100%" src="https://user-images.githubusercontent.com/95671495/163413302-38ac648b-6aee-4d25-b5f3-0c262c5c8c31.jpg"/>


## 고민한 점 및 깨달은 내용

* 들여쓰기 두번 제한에 대한 고민
    *  평소의 경우 이중 for문이나 삼중 for문까지 사용 해봤는데, 들여쓰기 두번의 제한이 걸려있어서 평소처럼 사용하지 못해서 고민을 하였다. 
    *  <span style="background-color: #fff5b1">**해결방안**</span>: 
        *  들여쓰기 되어있는 for 문, if 문 등을 뽑아내서 메서드로 만들어 주었다. 이렇게 하니, 전체적인 코드의 모습이 유연해 졌다.
        *  메서드로 뽑아주는 과정에서 함수 밖의 다른 함수의 배열에 접근하기 위해 inout 파라미터를 사용했다. 원래는 addScore 안에 if else 문이  caculate 안에 guard let 문 안에 위치해서, 두번 들여쓰기 제한에 위배가 됬었다!
        ```swift
        func addScore(to resultStrikeAndBall: inout [Int], computer: Array<Int>.Index, user: Array<Int>.Index) {

            if computer == user {
                resultStrikeAndBall[0] += 1
            } else {
                resultStrikeAndBall[1] += 1
            }
        }

        func calculateResult(computer: [Int], user: [Int]) -> [Int] {

            var resultStrikeAndBall: [Int] = [0, 0]

            for userIndex in 0...2 {

                guard let computerIndex = computer.firstIndex(of: user[userIndex]) else { continue }
                addScore(to: &resultStrikeAndBall, computer: computerIndex, user: userIndex)
            }

            return resultStrikeAndBall
        }
       
        ```
        *  옵셔널 바인딩 부분에서 if let 대신 guard let을 써 주어서 두번 들여쓰기의 지옥에서 벗어날 수 있었다! 
* EOF (실행중 Ctrl + D)에 대한 처리 방법
    * 프로그램 실행 중 사용자 입력을 요구하는 부분에서, 컨트롤 + D를 입력하면 무한 루프에 걸리는 현상이 발생하였다.
    * <span style="background-color: #fff5b1">**해결방안**</span>:
    ```swift
    while let 바인딩이름 = readLine() { 구현 내용 }
    ```
    * 위의 방법으로 시도해보려 하였으나, 그렇게 될 경우 안에 들어가는 반복문이나 조건문이 '들여쓰기 제한'에 걸리는 상황이 필연적으로 발생할 수 밖에 없었다.
    * EOF란, End Of File이라는 뜻으로, 더 이상 데이터가 없다는 뜻이다.
    * 그렇기 때문에 사용자 입력을 다시 받아올 필요가 없다고 판단하여, EOF가 발생할 경우
    ```swift
    guard let 바인딩이름 = readLine() else {
        print("에러 발생")
        return
    }
    ```
    * 위의 방법으로 구현해서 해결하였다.
* 함수의 범용성 및 유연성에 관한 고민
    * 초기에는 pickThreeNumbers()라는 함수를 정의 하였으나, 이 함수의 사용범위가 매우 국한되어 있다는 것을 깨달았다.
    * 때문에 더욱 다양한 상황에서 사용할 수 있도록 generatedRandomNumbers()로 함수자체를 다시 설개하였다.
    ```swift
    func pickThreeNumbers() {
    }
    // ⬆️ pickThreeNumbers()에서 ⬇️ generatedRandomNumbers(range:count:)로 재정의 하였다.
    func generatedRandomNumbers(range: ClosedRange<Int> = 1...9, count: Int = 3) -> [Int] {
    }
    ```


## 피드백 수정한 내용 (feat. Mino)
* 변수 및 함수 네이밍
    * 변수, 함수 등을 구현함에 있어 기능적인 부분 보다도 더욱 오래 고민 했던 것이 네이밍에 관한 문제였다.
    * 어떻게 하면 이 코드를 보는 사람들이 직관적으로 깨달을 수 있을지 지속적으로 고민하며 네이밍을 지었다.
    * 그 과정에서 변수 및 함수의 이름이 많게는 4번까지도 바뀌었다.
    ```swift
    var chance
    // ⬆️ chance에서 ⬇️ givenChance로 재정의 하였다.
    var givenChance
    ```
* import Foundation의 필요성 생각해보기
    * 항상 당연하게 들어가 있던줄 알았던 import Foundation 프레임워크에 대해서 다시 한번 생각해 보게 되었다.
    * 확인해본 결과, 지금 하고 있는 프로젝트에는 전혀 필요하지 않았기에 해당 코드는 삭제했다.
* 코드를 작성하는 사람의 시점이 아닌, 코드를 보는 사람의 입장에서 생각하며 작성하기
    * 마이노의 감사한 조언으로 🙏🙏, result[0], result[1]와 같이 보는 사람으로 하여금 무엇을 뜻하는지 알기 어려운 변수들을 strikeScore, ballScore과 같이 한 눈에 알아볼 수 있도록 변경하였다.
    * Thanks to Mino!!
