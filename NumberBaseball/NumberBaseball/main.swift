//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var remainedInnings = 9

func getRandomNumbers() -> [Int] {
    return Array(Array(1...9).shuffled()[0..<3])
}
