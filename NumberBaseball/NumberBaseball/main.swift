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
