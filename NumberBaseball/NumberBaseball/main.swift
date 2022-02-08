//
//  NumberBaseball - main.swift
//  Created by Roy and 쿼카 .
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return randomNumbers
}
var remainingChance = 9
var computerNumbers = generateRandomNumbers()

func playGame(come: Array<Int>, user: Array<Int>) -> (Int, Int) {
    var strike: Int = 0
    var ball: Int = 0
    
    for index in 0..<2 {
        if come[index] == user[index] {
            strike += 1
        } else if come.contains(user[index]) {
            ball += 1
        }
    }
    return (ball, strike)
}
