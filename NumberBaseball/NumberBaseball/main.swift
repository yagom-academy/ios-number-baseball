//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeUniqueRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(randomNumbers)
}

func getBallAndStrikeResult(of userNumbers: [Int]) -> (Int, Int) {
    let sameNumbers = computerNumbers.filter{ userNumbers.contains($0) }
    var ballCount = 0
    var strikeCount = 0
    
    for number in sameNumbers {
        if computerNumbers.firstIndex(of: number) == userNumbers.firstIndex(of: number) {
            strikeCount += 1
        }
    }
    
    ballCount = sameNumbers.count - strikeCount
    
    return (ballCount, strikeCount)
}

func startGame() {
    while tryCounts > 0 {
        let userNumbers = makeUniqueRandomNumbers()
        
        print("임의의 수 : \(userNumbers.map { String($0)}.joined(separator: " "))")
        
        let ballAndStrike = getBallAndStrikeResult(of: userNumbers)
        
        print("\(ballAndStrike.1) 스트라이크, \(ballAndStrike.0) 볼")
        tryCounts -= 1
        
        if tryCounts > 0 {
            print("남은 기회 : \(tryCounts)")
        }
        
        if ballAndStrike.1 == 3 {
            print("사용자 승리!")
            break
        }
        
        if tryCounts == 0 {
            print("컴퓨터 승리...!")
        }
        
        print()
    }
}

var computerNumbers = makeUniqueRandomNumbers()
var tryCounts = 9

startGame()
