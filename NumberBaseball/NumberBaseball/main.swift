//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var userNumbers: [Int] = []
var attemptCount = 9
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

func createUserNumbers() {
    attemptCount -= 1
    while userNumbers.count < 3 {
        let userNumber = Int.random(in: 1...9)
        if !userNumbers.contains(userNumber) {
            userNumbers.append(userNumber)
        }
    }
}

createRandomNumbers()
