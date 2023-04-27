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
    return randomNumbers
}

func checkBall(to randomNumbers: Array<Int>, from userNumbers: Array<Int>) -> Int {
    var ballCount = 0
    
    for index in 0...2 {
        if randomNumbers.contains(userNumbers[index]) {
            ballCount += 1
        }
    }
    return ballCount
}

func checkStrike(to randomNumbers: Array<Int>, from userNumbers: Array<Int>) -> Int {
    var strikeCount = 0
    
    for (a, b) in zip(randomNumbers, userNumbers) {
        if a == b {
            strikeCount += 1
        }
    }
    return strikeCount
}

func playBall() {
    let randomNumbers = createRandomNumbers()
    var attemptCount = 9
    var ballCount = 0
    var strikeCount = 0

    while attemptCount > 0 && strikeCount < 3 {
        let userNumbers = createRandomNumbers()
        strikeCount = checkStrike(to: randomNumbers, from: userNumbers)
        ballCount = checkBall(to: randomNumbers, from: userNumbers)
        attemptCount -= 1
        
        print("""
        임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))
        \(strikeCount) 스트라이크, \(ballCount) 볼
        남은 기회 : \(attemptCount)
        """)
    }
    
    if strikeCount == 3 {
        print("사용자 승리!")
    } else {
        print("컴퓨터 승리...!")
    }
}

playBall()
