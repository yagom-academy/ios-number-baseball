//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var userNumbers: [Int] = []
var attemptCount = 9

func createRandomNumbers() -> Array<Int> {
    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    print("임의의 수 : \(randomNumbers)")
    return randomNumbers
}

func createUserNumbers() -> Array<Int> {
    attemptCount -= 1
    while userNumbers.count < 3 {
        let userNumber = Int.random(in: 1...9)
        if !userNumbers.contains(userNumber) {
            userNumbers.append(userNumber)
        }
    }
    print("userNumber : \(userNumbers)")
    return userNumbers
}

func checkBall(to randomNumers: Array<Int>, from userNumbers: Array<Int>) -> Int {
    var ballCount = 0
    for index in 0...2 {
        if randomNumbers.contains(userNumbers[index]) {
            ballCount += 1
        }
    }
    print(ballCount)
    return ballCount
}

func checkStrike(to randomNumers: Array<Int>, from userNumbers: Array<Int>) -> Int {
    var strikeCount = 0
    for (a, b) in zip(randomNumbers, userNumbers) {
        if a == b {
            strikeCount += 1
        }
    }
    print(strikeCount)
    return strikeCount
}


