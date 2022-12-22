//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var chance = 9

func createRandomNumbers() -> [Int] {
    
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func checkStrike(computerNumbers: [Int], userNumbers: [Int]) -> (Int, Int) {
    
    var strike = 0
    var ball = 0
    
    for index in 0..<3 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else {
            ball += 1
        }
    }
    return (strike, ball)
}

func startGame() {
    
    while chance > 0 {
        let computerNumbers = createRandomNumbers()
        let userNumbers = createRandomNumbers()
        
        let (strike, ball) = checkStrike(computerNumbers: computerNumbers, userNumbers: userNumbers)
        
        chance -= 1
        
        print("임의의 수 : \(computerNumbers.map{ String($0) }.joined(separator: " "))")
        print("\(strike) 스트라이크, \(ball) 볼")
        
        if strike == 3 {
            print("사용자 승리...!")
            break
        } else if chance == 0 {
            print("컴퓨터 승리...!")
            break
        }
        print("남은 기회 : \(chance)")
    }
}

startGame()
