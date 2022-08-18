//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerNumbers: [Int] = []
var userNumbers: [Int] = []

func generateNumbers() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return Array(numbers)
}

func checkStrikeAndBall(computer computerNumbers: [Int], user userNumbers: [Int]) -> [Int] {
    var strikeCounter: Int = 0
    var ballCounter: Int = 0
    computerNumbers.enumerated().forEach{ (index, computerNumber) in
        if userNumbers[index] == computerNumber {
            strikeCounter += 1
        } else if userNumbers.contains(computerNumber) {
            ballCounter += 1
        }
    }
    let compareResult: [Int] = [strikeCounter, ballCounter]
    return compareResult
}

func playGame() {
    computerNumbers = generateNumbers()
    var gameCounter: Int = 9
    while gameCounter > 0 {
        userNumbers = generateNumbers()
        let gameResult = checkStrikeAndBall(computer: computerNumbers, user: userNumbers)
        gameCounter -= 1
        print("임의의 수 : \(userNumbers.map{ String($0) }.joined(separator: " "))")
        print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
        if gameResult[0] == 3 {
            print("유저 승리...!")
            gameCounter = 9
            break
        } else if gameCounter == 0 {
            print("컴퓨터 승리...!")
            gameCounter = 9
            break
        }
        print("남은 기회 : \(gameCounter)")
    }
}

playGame()
