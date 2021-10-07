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

func startGame() {
    computerNumbers = generateRandomNumbers()
    let strikesForUserWin = 3
    let userWinMessage = "사용자 승리!"
    let computerWinMessage = "컴퓨터 승리...!"
    let generatedUserNumberMessage = "임의의 수 : "
    let leftTrialMessage = "남은 기회 : "
    let strikeCountMessage = " 스트라이크, "
    let ballCountMessage = " 볼"
    
    var strikeCount = 0
    var ballCount = 0
        
    while tryCount != 0 && strikeCount != strikesForUserWin {
        tryCount -= 1
        let userNumbers = generateRandomNumbers()
        (strikeCount, ballCount) = judgeStrikeAndBall(with: userNumbers)
        print(generatedUserNumberMessage, userNumbers.map{String($0)}.joined(separator: " "))
        print(strikeCount, strikeCountMessage, ballCount, ballCountMessage)
        print(leftTrialMessage, tryCount)
    }
    
    if strikeCount == strikesForUserWin {
        print(userWinMessage)
    } else {
        print(computerWinMessage)
    }
}
startGame()

