//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createRandomNumbers() -> [Int] {
    let shuffledNumbers = [Int](1...9).shuffled()
    let threeNumbers = [Int](shuffledNumbers[0...2])
    return threeNumbers
}

func checkBallCount(answerNumbers: [Int], userNumbers: [Int]) -> [Int] {
    guard answerNumbers != userNumbers else {
        return [3, 0]
    }
    var strikeCount: Int = 0
    var ballCount: Int = 0

    for index in 0...2 {
        let matchIndex = answerNumbers.firstIndex(of: userNumbers[index])
        if matchIndex == nil {
            continue
        } else if matchIndex == index {
            strikeCount += 1
        } else {
            ballCount += 1
        }
    }
    return [strikeCount, ballCount]
}

var randomAnswerNumbers = createRandomNumbers()
var gameCount = 9

func startGame() {
    while gameCount > 0 {
        gameCount -= 1
        let userNumbers = createRandomNumbers()
        let checkBallCount = checkBallCount(answerNumbers: randomAnswerNumbers, userNumbers: userNumbers)
        let strikeCount = checkBallCount[0]
        let ballCount = checkBallCount[1]
        
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        if gameCount == 0 && strikeCount < 3 {
            print("컴퓨터 승리…!")
        } else if strikeCount == 3 {
            print("사용자 승리!")
        }
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(gameCount)")
    }
}

startGame()
