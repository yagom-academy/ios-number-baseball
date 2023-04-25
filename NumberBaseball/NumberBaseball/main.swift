//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumbers: [Int] = []
var userRandomNumbers: [Int] = []
var remainCount: Int = 9
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
