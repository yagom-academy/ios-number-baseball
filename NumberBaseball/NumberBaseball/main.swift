//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
import Foundation

var computerNumbers: [Int] = []
var playerNumbers: [Int] = []
var remainingChance = 9

while computerNumbers.count < 3 {
    let randomNumber = Int.random(in: 1...9)
    if !computerNumbers.contains(randomNumber) {
        computerNumbers.append(randomNumber)
    }
}

while remainingChance > 0 {
    remainingChance -= 1
    
    var ball = 0
    var strike = 0
    
    playerNumbers = []
    
    while playerNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !playerNumbers.contains(randomNumber) {
            playerNumbers.append(randomNumber)
        }
    }
    
    for index in 0...2 {
        if playerNumbers[index] == computerNumbers[index] {
            strike += 1
        } else if computerNumbers.contains(playerNumbers[index]) {
            ball += 1
        }
    }
    
    print("임의의 수 : \(computerNumbers[0]) \(computerNumbers[1]) \(computerNumbers[2])")
    print("\(strike) 스트라이크, \(ball) 볼")
    
    if strike == 3 {
        print("사용자 승리!")
        break
    } else if remainingChance > 0 {
        print("남은 기회 : \(remainingChance)")
    } else {
        print("컴퓨터 승리...!")
    }
}
