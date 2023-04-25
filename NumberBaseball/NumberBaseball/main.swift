//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
import Foundation

func generateNumbers(numbers: inout [Int]) -> [Int] {
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}

func playNumberBaseballGame(remainingChance: inout Int) {
    var computerNumbers: [Int] = []
    var playerNumbers: [Int] = []
    
    computerNumbers = generateNumbers(numbers: &computerNumbers)
    
    while remainingChance > 0 {
        remainingChance -= 1
        
        var ball = 0
        var strike = 0
        
        playerNumbers = generateNumbers(numbers: &playerNumbers)
        
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
}

var remainingChance = 9

playNumberBaseballGame(remainingChance: &remainingChance)
