//
//  NumberBaseball - main.swift
//  Created by Roy and 쿼카 .
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func generateRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return randomNumbers
}

func compareNumbers(user: Set<Int>, computer: Set<Int>) -> (Int, Int) {
    var (strike, ball) = (0, 0)
    let computerNumbers = Array(computer)
    let userNumbers = Array(user)
    
    for index in userNumbers.indices {
        strike += userNumbers[index] == computerNumbers[index] ? 1 : 0
    }
    ball = computer.intersection(userNumbers).count
    ball = (ball - strike)
    return (strike, ball)
}

func startGame() {
    let computerPlayer = generateRandomNumbers()
    var userIning: Int = 9
    
    while userIning > 0 {
        let userPlayer = generateRandomNumbers()
        let (strike, ball) = compareNumbers(user: userPlayer, computer: computerPlayer)
        userIning -= 1
        print("임의의 수 : \(userPlayer.description.trimmingCharacters(in: [",","[","]"]))")
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(userIning)")
        
        if strike > 2 {
            print("사용자 승리...!")
            return
        } else if userIning == 0 {
            print("컴퓨터 승리...!")
        }
    }
}
startGame()
