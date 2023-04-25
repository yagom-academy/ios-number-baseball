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

var computerNumbers = makeUniqueRandomNumbers()
var userNumbers = makeUniqueRandomNumbers()
var tryCounts = 9
