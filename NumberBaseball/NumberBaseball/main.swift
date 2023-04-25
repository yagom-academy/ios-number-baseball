//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func checkBallStrikeCount(to answerNumbersOfBaseballGame: [Int], and randomNumbersOfUser: [Int]) -> Int {
    var ballCounts = 0
    var strikeCounts = 0
    
    for randomNumber in randomNumbersOfUser {
        if answerNumbersOfBaseballGame.contains(randomNumber) {
            ballCounts += 1
        }
    }

    for index in 0...2 {
        if answerNumbersOfBaseballGame[index] == randomNumbersOfUser[index] {
            ballCounts -= 1
            strikeCounts += 1
        }
    }
    
    print("\(strikeCounts) 스트라이크, \(ballCounts) 볼")
    return strikeCounts
}

func initRandomNumber() -> [Int] {
    var randomNumberSet: Set<Int> = Set<Int>()
    var randomNumbers = Array(randomNumberSet)
    
    while randomNumberSet.count < 3 {
        randomNumberSet.insert(Int.random(in: 1...9))
    }
    
    randomNumbers = Array(randomNumberSet)

    print("임의의 수 : \(randomNumbers.map{(randomNumber: Int) -> String in return String(randomNumber)}.joined(separator: " "))")
    
    return randomNumbers
}

func startBaseballGame() {
    var answerNumbersSet: Set<Int> = Set<Int>()
    var answerNumbers: Array<Int> = Array<Int>()
    var leftChance = 9
    var isWorking: Bool = true
    
    while answerNumbersSet.count < 3 {
        answerNumbersSet.insert(Int.random(in: 1...9))
    }
    
    answerNumbers = Array(answerNumbersSet)
    
    while isWorking {
        let strike = checkBallStrikeCount(to: answerNumbers, and: initRandomNumber())
        
        if strike == 3 {
            print("사용자 승리!")
            isWorking = false
        } else if leftChance == 0 {
            print("컴퓨터 승리...!")
            isWorking = false
        } else {
            print("남은 기회 : \(leftChance)")
        }
        leftChance -= 1
    }
}

startBaseballGame()
