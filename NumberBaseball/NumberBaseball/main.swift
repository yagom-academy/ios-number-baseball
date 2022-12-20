//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var chance = 9

func createRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func checkStrike(_ computerNumbers: [Int], _ userNumbers: [Int]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    for index in 0..<3 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else {
            ball += 1
        }
    }
    return (strike, ball)
}
