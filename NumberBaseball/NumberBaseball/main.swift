//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var tryCount: Int = 9
var strike = 0
var ball = 0
var computerRandomNumbers:[Int] = Array(makeThreeRandomNumbers())
var userRandomNumbers:[Int] = Array(makeThreeRandomNumbers())

func startGame() {
    while tryCount > 0 && strike < 3 {
        strike = 0
        ball = 0
        userRandomNumbers = Array(makeThreeRandomNumbers())
        print("임의의 수 : ", terminator: "")
        for userNumber in userRandomNumbers {
            print(userNumber, terminator: " ")
        }
        print()
        checkBall(notStrikeNumbers: findNotStrike())
        tryCount -= 1
        if strike == 3 {
            print("사용자 승리...!")
        }
        if tryCount == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(tryCount)")
    }
}

func makeThreeRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    while(randomNumbers.count < 3) {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return randomNumbers
}

func findNotStrike() -> [Int] {
    var notStrikeNumbers: [Int] = []
    for (userIndex, userNumber) in userRandomNumbers.enumerated() {
        if let notStrikeNumber = countStrike(userNumber: userNumber, userIndex: userIndex) {
            notStrikeNumbers.append(notStrikeNumber)
        }
    }
    return notStrikeNumbers
}

func countStrike(userNumber: Int, userIndex: Int) -> Int? {
    for (computerIndex, computerNumber) in computerRandomNumbers.enumerated() {
        if computerNumber == userNumber && computerIndex == userIndex {
            strike += 1
            return nil
        }
    }
    return userNumber
}

func checkBall(notStrikeNumbers:[Int]) {
    for checkNumber in notStrikeNumbers {
        countBall(userNumber: checkNumber)
    }
}

func countBall(userNumber:Int) {
    for computerNumber in computerRandomNumbers {
        if userNumber == computerNumber {
            ball += 1
        }
    }
}

startGame()
