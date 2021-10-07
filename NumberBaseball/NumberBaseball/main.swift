//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var tryCount = 9

func generateRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    let numberLength = 3
    let randomNumberRange = 1...9
        
    while randomNumbers.count < numberLength {
        let number = Int.random(in: randomNumberRange)
        randomNumbers.insert(number)
    }
    
    return Array(randomNumbers)
}

func judgeStrikeAndBall(with userNumbers: [Int]) -> (strike: Int, ball: Int) {
    var ballCount = 0
    var strikeCount = 0
    
    for index in 0..<userNumbers.count {
        ballCount += computerNumbers.contains(userNumbers[index]) ? 1 : 0
    }
    for index in 0..<userNumbers.count {
        strikeCount += computerNumbers[index] == userNumbers[index] ? 1 : 0
    }
    
    ballCount -= strikeCount
    
    return (strikeCount, ballCount)
}

enum GameMessage: String {
    case userWin = "사용자 승리!"
    case computerWin = "컴퓨터 승리...!"
    case generatedUserNumber = "임의의 수 : "
    case leftTrial = "남은 기회 : "
    case strikeCount = " 스트라이크, "
    case ballCount = " 볼"
}

func startGame() {
    let strikesForUserWin = 3
    var strikeCount = 0
    var ballCount = 0

    computerNumbers = generateRandomNumbers()
    
    while tryCount != 0 && strikeCount != strikesForUserWin {
        tryCount -= 1
        let userNumbers = generateRandomNumbers()
        (strikeCount, ballCount) = judgeStrikeAndBall(with: userNumbers)
        print(GameMessage.userWin.rawValue, userNumbers.map{String($0)}.joined(separator: " "))
        print(strikeCount, GameMessage.strikeCount, ballCount, GameMessage.ballCount)
        print(GameMessage.leftTrial, tryCount)
    }
    
    if strikeCount == strikesForUserWin {
        print(GameMessage.userWin)
    } else {
        print(GameMessage.computerWin)
    }
}
startGame()
