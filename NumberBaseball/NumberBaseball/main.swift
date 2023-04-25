//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumbers: [Int] = []
var userRandomNumbers: [Int] = []
var remainCount: Int = 9
var matchCount: Int = 0
var strikeCount: Int = 0
var ballCount: Int = 0

func generateRandomNumber() -> Int {
    return Int.random(in: 1...9)
}

func addNumbers() -> [Int] {
    var uniqueRandomNumbers: Set<Int> = []
    var randomNumbers: [Int] = []
    var randomNumber: Int = 0
    
    while randomNumbers.count < 3 {
        randomNumber = generateRandomNumber()
        
        if uniqueRandomNumbers.insert(randomNumber).inserted {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}

func checkMatchingCount(with computerRandomNumbers: [Int], _ userRandomNumbers: [Int]) -> Int {
    return Set(computerRandomNumbers).intersection(userRandomNumbers).count
}

func checkStrikeCount() -> Int {
    return (0..<computerRandomNumbers.count).filter { computerRandomNumbers[$0] == userRandomNumbers[$0] }.count
}

func checkBallCount(matching matchCount: Int, strike strikeCount: Int) -> Int {
    return matchCount - strikeCount
}
