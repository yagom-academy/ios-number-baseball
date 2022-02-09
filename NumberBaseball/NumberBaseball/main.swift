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

func compareNumbers(user: Set<Int>, computer: Set<Int>) -> (Int, Int) {
    var (strike, ball) = (0, 0)
    let computerNumbers = Array(computer)
    let userNumbers = Array(user)
    
    for index in userNumbers.indices {
        strike += userNumbers[index] == computerNumbers[index] ? 1 : 0
    }
    ball = computer.intersection(userNumbers).count
    ball = (ball - strike)
    return (ball, strike)
}
