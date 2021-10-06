//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: Set<Int> = []
var tryCount: Int = 9

func generatedRandomNumbers() -> [Int] {
    while randomNumbers.count < 3 {
        let number = Int.random(in: 1...9)
        randomNumbers.insert(number)
    }
    return Array(randomNumbers)
}

let computerNumbers = generatedRandomNumbers()

func compareResult(with userNumbers: [Int]) -> [Int] {
    var ballCount: Int = 0
    var strikeCount: Int = 0
    for index in 0...(userNumbers.count - 1) {
        ballCount += computerNumbers.contains(userNumbers[index]) ? 1 : 0
    }
    for index in 0...(userNumbers.count - 1) {
        strikeCount += computerNumbers[index] == userNumbers[index] ? 1 : 0
    }
    ballCount -= strikeCount
    return [ballCount, strikeCount]
}
