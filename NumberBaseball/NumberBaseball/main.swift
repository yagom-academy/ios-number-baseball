//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var remainedInnings = 9

func getRandomNumbers() -> [Int] {
    return Array(Array(1...9).shuffled()[0..<3])
}

func calcRoundResult(_ computerNumbers: [Int], _ playerNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    let computerNumbersSet = Set(computerNumbers)
    let playerNumebersSet = Set(playerNumbers)
    
    var strikeCount = 0
    var ballCount = 0
    
    for i in 0..<3 {
        if computerNumbers[i] == playerNumbers[i] {
            strikeCount += 1
        }
    }
    
    ballCount = computerNumbersSet.intersection(playerNumebersSet).count - strikeCount
    
    return (strikeCount, ballCount)
}

func runGame() {
    computerNumbers = getRandomNumbers()
    
    while remainedInnings > 0 {
        let playerNumbers = getRandomNumbers()
        
        print("임의의 수 : \(playerNumbers[0]) \(playerNumbers[1]) \(playerNumbers[2])")
        
        let roundResult = calcRoundResult(computerNumbers, playerNumbers)
        let strikeCount = roundResult.0
        let ballCount = roundResult.1
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리!")
            return
        }
        
        remainedInnings -= 1
        print("남은 기회 : \(remainedInnings)")
    }
    
    print("컴퓨터 승리...!")
}
