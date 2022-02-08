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
