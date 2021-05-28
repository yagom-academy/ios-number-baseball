//
//  NumberBaseball - main.swift
//  Created by luyan, hosinging.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// MARK:- 함수 이름을 잘 작성하셨네요👍 배열을 리턴하는 것이니 복수로 하신것도 정말 잘하셨습니다!
// 감사합니다 땡큐 감사 베리 많이머 치
func generateRandomNumbers() -> [Int] {
    var randomNumbers: Set = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

/* FIXME:- 함수 이름은 printNumbers 인데 "임의의 수"를 출력하고 있네요! 함수의 이름이 조금 더 명확하거나 함수의 이름에 맞게 동작하는 것이 좋을 것 같아요!!
 */
// 다시 보니 의미가 불분명한 함수라는 생각이 드네요. printRandomNumbers라는 이름으로 바꾸고, 매개변수명도 randomNumbers로 바꾸는 건 어떨까 생각해요.
// Steven, 더 좋은 예시가 생각나시면 말씀해주세요!
func printRandomNumbers(randomNumbers: [Int]) {
    
    print("임의의 수 : \(randomNumbers.map{String($0)}.joined(separator: " "))")
}

//print(random: )

/* FIXME:- 반환하는 값이 상수인 1과 0인데.. 1과 0이 무엇을 의미하는지 이 함수만 봐서는 모를 것 같아요.
 코드에서는 최대한 상수 사용을 지양하는 것이 좋습니다. 어떻게 수정해 볼 수 있을까요?
 함수를 설계하실때는 어떤 일을 해서 어떤 값을 리턴하는지가 함수 이름에 명확하게 명시 되어 있으면 좋습니다.*/
func checkStrike(userNumbers: [Int], to computerNumbers: [Int], index: Int) -> Int {
    if userNumbers[index] == computerNumbers[index] {
        return 1
    } else {
        return 0
    }
}

func checkTotalCalls(userNumbers: [Int], computerNumbers: [Int]) -> Int {
    return Set(userNumbers).intersection(Set(computerNumbers)).count
}

/* FIXME: 일단 이 함수는 Bool을 리턴하는 함수네요! 그런데 함수 이름만 봐서는 알기 어렵네요 ㅜㅜ
 공식 문서는 아니지만 불리언을 리턴하는 함수에 대한 네이밍은 다른 언어에서도 비슷하게 사용되는 것 같아요
 */
func oneMatch(_ user: [Int],_ computer: [Int]) -> Bool {
    var userWin = false
    /* FIXME:
     totalCall라는 이름이 무엇을 의미하는지 명확하지 않은 것네요.
     "전체적인 불려진 횟수" 라고 번역할 수 있을 것 같은데.. 무엇을 부른건지 더 명확하게 써주면 좋을 것 같아요!
     아니면 꼭 Call이 아닌 다른 단어를 찾아봐도 좋구요!
     */
    let totalCall = checkTotalCalls(userNumbers: user, computerNumbers: computer)
    if totalCall == 0 {
        print("0 스트라이크, 0 볼")
        return userWin
    }
    var strike = 0
    
    // FIXME: 일반적으로 다른언어를 하셨다면 i를 많이 쓰셨겠지만 swift언어에서는 축약어 사용을 지양해요!
    /* 전달 인자 레이블을 사용하셨네요!! 다만 computer 에만 사용하신 이유가 궁금해요! 비슷한 이유라면 index에도 where을 사용할 수 있을 것 같네요!! 이부분에서도 api 디자인 가이드 공식 문서 전달 인자 레이블 링크 한번 참고해보세요!

    그리고 매개변수 이름만 봤을 때 user, computer, i 가 무엇을 의미하는지 잘 모르겠어요. 이 부분도 수정하면 좋을 것 같아요!*/
    
    for i in 0..<3 {
        strike += checkStrike(userNumbers: user, to: computer, index: i)
    }
    let ball = totalCall - strike
    print("\(strike) 스트라이크, \(ball) 볼")
    // FIXME: 41번과 47번째 줄에서 상수 3을 사용하셨는데 만약 4개 이상을 받는 게임이 된다면 어떻게 수정하는 것이 좋을까요?
    if strike == 3 {
        printWinner(name: "사용자")
        userWin = true
    }
    return userWin
}

func printWinner(name: String) {
    print("\(name) 승리...!")
}

/* MARK: 이 함수도 이름만 봤을 때는 게임 카운트와 유저윈을 가지고 무언가를 확인해서 리턴해줄 것 같은데.. 그것이 아니라 단순히 출력을 하는 함수네요😭 이 함수도 다시 한번 생각해보시면 좋을 것 같아요!!
 */
func checkGameOver(gameCount: Int, userWin: Bool) {
    if gameCount > 0 && !userWin {
        print("남은 기회 : \(gameCount)")
    }
    else if gameCount == 0 {
        print("남은 기회 : \(gameCount)")
        printWinner(name: "컴퓨터")
    }
}

func gameStart() {
    let computerNumbers = generateRandomNumbers()
    var gameCount: Int = 9
    var userNumbers = [Int]()
    var userWin = false
    while gameCount > 0 && !userWin {
        userNumbers = generateRandomNumbers()
        printNumbers(userNumbers)
        userWin = oneMatch(userNumbers, computerNumbers)
        gameCount -= 1
        checkGameOver(gameCount: gameCount, userWin: userWin)
    }
    return
}

gameStart()







