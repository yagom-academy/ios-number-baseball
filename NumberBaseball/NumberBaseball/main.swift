//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createRandomNumbers() -> [Int] {
    var createdNumbers = [Int]()
    
    while createdNumbers.count < 3 {
        let createdRandomNumber = Int.random(in:1...9)
        
        if createdNumbers.contains(createdRandomNumber) {
            continue
        } else {
            createdNumbers.append(createdRandomNumber)
        }
    }
    
    return createdNumbers
}

func countBallAndStrike(comparing randomNumbers: [Int]) -> [Int] {
    var strike = 0
    var ball = 0
    var result = [Int]()
    
    for i in 0...2 {
        if computerRandomNumbers[i] == randomNumbers[i] {
            strike += 1
        } else if randomNumbers.contains(computerRandomNumbers[i]) {
            ball += 1
        }
    }

    result.append(strike)
    result.append(ball)
    
    return result
}

func startGame() {
    while remainingCount > 0 {
        let userRandomNumbers = createRandomNumbers()
        let gameResult = countBallAndStrike(comparing: userRandomNumbers)
        remainingCount -= 1
        
        print("임의의 수 : \(userRandomNumbers[0]) \(userRandomNumbers[1]) \(userRandomNumbers[2])")
        print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
        
        if gameResult[0] == 3 {
            print("사용자 승리...!")
            break
        }
        
        if remainingCount == 0 {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(remainingCount)")
        }
    }
}

let computerRandomNumbers = createRandomNumbers()
var remainingCount = 9

startGame()
