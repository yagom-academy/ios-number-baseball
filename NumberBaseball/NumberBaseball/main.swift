//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Array<Int> = []
var gameCounter: Int = 9
var userNumbers: Array<Int> = []
var gameStatus: Bool = true

func makeThreeNumbers() -> Array<Int> {
    var generatedNumbers: Set<Int> = []
    while generatedNumbers.count < 3 {
        generatedNumbers.update(with: Int.random(in: 1...9))
    }
    return generatedNumbers.map{ $0 }
}

func checkStrikeAndBall(numbers: [Int]) -> [Int] {
    var strikeCounter: Int = 0
    var ballCounter: Int = 0
    computerNumbers.enumerated().forEach{ (index, computerNumber) in
        if userNumbers[index] == computerNumber {
            strikeCounter += 1
        } else if userNumbers.contains(computerNumber) {
            ballCounter += 1
        }
    }
    return [strikeCounter, ballCounter]
}
//=====================================================================
func winnerChecker(strike: Int) {
    if strike == 3 {
        print("유저 승리...!")
    } else {
        print("컴퓨터 승리...!")
    }
}

func gameStart() {
    if gameCounter == 0 || !gameStatus { return }
    gameCounter -= 1
    let gameResult = checkStrikeAndBall(numbers: userNumbers)
    print("임의의 수 : \(userNumbers.map{ String($0) }.joined(separator: " "))")
    print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")

    if gameCounter == 0 {
        winnerChecker(strike: gameResult[0])
    } else {
        print("남은 기회 : \(gameCounter)")
    }
}
//=====================================================================
// 더 나은 코드를 위하여..!
//
//func gameStart() {
//    if gameCounter < 1 || !gameStatus { return }
//    gameCounter -= 1
//    let gameResult = checkStrikeAndBall(numbers: userNumbers)
//    print("임의의 수 : \(userNumbers.map{ String($0) }.joined(separator: " "))")
//    print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
//    if gameResult[0] == 3 {
//        print("유저 승리...!")
//        gameStatus = false
//        return
//    } else if gameCounter == 0 {
//        print("컴퓨터 승리...!")
//        gameStatus = false
//        return
//    }
//    print("남은 기회 : \(gameCounter)")
//}

computerNumbers = makeThreeNumbers()
for _ in 1...10 {
    userNumbers = makeThreeNumbers()
    gameStart()
}
