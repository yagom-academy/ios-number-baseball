//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createRandomNumbers() -> [Int] {
    let shuffledNumbers = [Int](1...9).shuffled()
    let threeNumbers = [Int](shuffledNumbers[0...2])
    return threeNumbers
}

var randomAnswerNumbers = createRandomNumbers()
var gameCount = 9


