//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func checkBallStrikeCount(from answerNumbersOfBaseballGame: [Int], with matchNumbersOfUser: [Int]) -> (strike: Int, ball: Int) {
    var ballCounts = 0
    var strikeCounts = 0
    
    for index in 0...2 {
        if answerNumbersOfBaseballGame.contains(matchNumbersOfUser[index]) {
            ballCounts += 1
        }
        
        if answerNumbersOfBaseballGame[index] == matchNumbersOfUser[index] {
            ballCounts -= 1
            strikeCounts += 1
        }
    }
    
    return (strikeCounts, ballCounts)
}

func initializeRandomNumber() -> [Int] {
    var randomNumbers: Set<Int> = Set<Int>()
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }

    return Array(randomNumbers)
}

func startBaseballGame() {
    let answerNumbers = initializeRandomNumber()
    var chance = 9
    var isLeftChance: Bool = true
    
    while isLeftChance {
        chance -= 1
        
        var randomNumbers = initializeRandomNumber()
        let matchCount = checkBallStrikeCount(from: answerNumbers, with: randomNumbers)
        
        print("임의의 수 : \(Array(randomNumbers).map{String($0)}.joined(separator: " "))")
        print("\(matchCount.strike) 스트라이크, \(matchCount.ball) 볼")
        
        if matchCount.strike == 3 {
            print("사용자 승리!")
            isLeftChance = false
        } else if chance == 0 {
            print("컴퓨터 승리...!")
            isLeftChance = false
        } else {
            print("남은 기회 : \(chance)")
        }
    }
}

startBaseballGame()
