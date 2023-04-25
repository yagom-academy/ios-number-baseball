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

func createRandomNumbers() -> Array<Int> {
    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    print("RandomNumber : \(randomNumbers)")
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

checkBall(to: createRandomNumbers(), from: createUserNumbers())

