//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createRandomNumbers() -> Array<Int> {
    var randomNumbers: [Int] = []
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
    var userNumbers: [Int] = []
    while userNumbers.count < 3 {
        let userNumber = Int.random(in: 1...9)
        if !userNumbers.contains(userNumber) {
            userNumbers.append(userNumber)
        }
    }
    print("userNumber : \(userNumbers)")
    return userNumbers
}

func checkBall(to randomNumbers: Array<Int>, from userNumbers: Array<Int>) -> Int {
    var ballCount = 0
    for index in 0...2 {
        if randomNumbers.contains(userNumbers[index]) {
            ballCount += 1
        }
    }
    print(ballCount)
    return ballCount
}

func checkStrike(to randomNumbers: Array<Int>, from userNumbers: Array<Int>) -> Int {
    var strikeCount = 0
    for (a, b) in zip(randomNumbers, userNumbers) {
        if a == b {
            strikeCount += 1
        }
    }
    print(strikeCount)
    return strikeCount
}

func playBall() {
    let randomNumbers = createRandomNumbers()
    var userNumbers = createUserNumbers()
    var attemptCount = 9
    var ballCount = 0
    var strikeCount = 0

    if checkBall(to: randomNumbers, from: userNumbers) == 0 {
        userNumbers = createUserNumbers()
        attemptCount -= 1
    } else {
        ballCount = checkBall(to: randomNumbers, from: userNumbers)
        strikeCount = checkStrike(to: randomNumbers, from: userNumbers)
        attemptCount -= 1
    }
    print("""
임의의 수 : \(randomNumbers)
\(strikeCount) 스트라이크, \(ballCount) 볼
남은 기회 : \(attemptCount)
""")
}

playBall()
