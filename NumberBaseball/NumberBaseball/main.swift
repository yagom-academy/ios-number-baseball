//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomComputerNumbers = generateRandomNumbers()
var remainsChance = 9

func generateRandomNumbers() -> [Int] {
    var numbers = [Int]()
    while numbers.count < 3 {
        let randomNumber = Int.random(in:1...9)
        if numbers.contains(randomNumber) == false {
            numbers.append(randomNumber)
        }
    }
    return numbers
}

func compareNumbersAndReturnResult() -> [Int] {
    let userNumbers = generateRandomNumbers()
    var ballAndStrikeCount: [Int] = []
    
    var ballCount = 0
    var strikeCount = 0
    
    for index in 0...2 {
        if userNumbers[index] == randomComputerNumbers[index] {
            strikeCount += 1
            ballCount -= 1
        }
        
        if userNumbers.contains(randomComputerNumbers[index]) {
            ballCount += 1
        }
    }
    
    ballAndStrikeCount.append(ballCount)
    ballAndStrikeCount.append(strikeCount)
    
    return ballAndStrikeCount
}
