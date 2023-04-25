//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeUniqueRandomNumbers() -> [Int] {
    let targetNumber = 3
    let randomRange = 1...9
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < targetNumber {
        randomNumbers.insert(Int.random(in: randomRange))
    }
    return Array(randomNumbers)
}

func getBallAndStrikeResult() -> (Int, Int) {
    let sameNumbers = computerNumbers.filter{ userNumbers.contains($0) }
    var ballCount = 0
    var strikeCount = 0
    
    for number in sameNumbers {
        if computerNumbers.firstIndex(of: number) == userNumbers.firstIndex(of: number) {
            strikeCount += 1
        }
    }
    ballCount = sameNumbers.count - strikeCount
    
    return (ballCount, strikeCount)
}

var computerNumbers = makeUniqueRandomNumbers()
var userNumbers = makeUniqueRandomNumbers()
var tryCounts = 9
