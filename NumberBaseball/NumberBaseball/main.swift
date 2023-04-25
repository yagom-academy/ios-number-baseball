//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var userNumbers: [Int] = []
var strike = 0
var ball = 0

func createRandomNumbers() {
    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    print("RandomNumber : \(randomNumbers)")
}

createRandomNumbers()
