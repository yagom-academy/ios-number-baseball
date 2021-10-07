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

func runGame() {
    computerNumbers = generateRandomNumbers()
    var judgeResult: (strike: Int, ball: Int) = (0, 0)
    let strikesForUserWin = 3
    
    while tryCount != 0 && judgeResult.strike != strikesForUserWin {
        let userNumbers = generateRandomNumbers()
        print(GameMessage.generatedUserNumber.rawValue, userNumbers.map({String($0)}).joined(separator: " "))
        judgeResult = compareStrikeAndBall(userNumbers: userNumbers)
        showTryCount()
    }
    if judgeResult.strike == strikesForUserWin {
        showGameResult(winner: GamePlayer.user)
    } else {
        showGameResult(winner: GamePlayer.computer)
    }
}

func compareStrikeAndBall(userNumbers: [Int]) -> (Int, Int){
    var strikeCount = 0
    var ballCount = 0
    
    (strikeCount, ballCount) = judgeStrikeAndBall(with: userNumbers)
    print(strikeCount, GameMessage.strikeCount.rawValue, ballCount, GameMessage.ballCount.rawValue)
    
    return (strikeCount, ballCount)
}

func showTryCount() {
    tryCount -= 1
    print(GameMessage.leftTrial.rawValue, tryCount)
}

enum GamePlayer {
    case user
    case computer
}

func showGameResult(winner: GamePlayer) {
    if winner == GamePlayer.user {
        print(GameMessage.userWin.rawValue)
    } else {
        print(GameMessage.computerWin.rawValue)
    }
}

runGame()
