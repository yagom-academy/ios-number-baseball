//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var leftChances = 9
var userNumbers: [Int] = []

func makeRandomNumbers() -> [Int] {
    var result: [Int] = []
    while result.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !result.contains(randomNumber) {
            result.append(randomNumber)
        }
    }
    return result
}

print(makeRandomNumbers())
