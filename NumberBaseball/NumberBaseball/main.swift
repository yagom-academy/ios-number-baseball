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

func calcRoundResult(_ playerNumbers: [Int]) -> (Int, Int) {
    var strikeNumbers = 0
    var ballNumbers = 0
    
    for i in 0..<3 {
        for j in 0..<3 where playerNumbers[i] == computerNumbers[j] {
            if (i == j) {
                strikeNumbers += 1
            } else {
                ballNumbers += 1
            }
        }
    }
    
    return (strikeNumbers, ballNumbers)
}

func runGame() {
    computerNumbers = getRandomNumbers()
    
    while remainedInnings > 0 {
        let playerNumbers = getRandomNumbers()
        
        print("임의의 수 : \(playerNumbers[0]) \(playerNumbers[1]) \(playerNumbers[2])")
        
        let roundResult = calcRoundResult(playerNumbers)
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
