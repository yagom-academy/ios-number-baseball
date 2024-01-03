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

func calcRoundResult(_ playerNumbers: [Int]) -> (Int, Int) {
    var strikeNumbers = 0
    var ballNumbers = 0
    
    for i in 0..<3 {
        for j in 0..<3 where playerNumbers[i] == computerNumbers[j] {
            if (i == j) {
                strikeNumbers += 1
            } else {
                ballNumbers += 1
            }
        }
    }
    
    return (strikeNumbers, ballNumbers)
}
