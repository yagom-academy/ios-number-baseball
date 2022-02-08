//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumber() -> Int {
    Int.random(in: (1...9))
}

func generateExtractedNumbers() -> [Int] {
    var extractedNumbers: Set<Int> = []
    
    while extractedNumbers.count != 3 {
        extractedNumbers.insert(generateRandomNumber())
    }
    return extractedNumbers.map{$0}
}

func getBallStrikeResult(computerNumbers: [Int], userNumbers: [Int]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    
    let computerNumbersSet = Set(computerNumbers)
    
    for (idx, userNum) in userNumbers.enumerated() {
        if computerNumbers[idx] == userNum {
            strike += 1
        } else if computerNumbersSet.contains(userNum) {
            ball += 1
        }
    }
    
    return (strike, ball)
}

func startGame() {
    let randomNumbers = generateExtractedNumbers()
    var cnt = 9
    
    while cnt > 0 {
        let userNumbers = generateExtractedNumbers()
        print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
        
        let (strike, ball) = getBallStrikeResult(computerNumbers: randomNumbers, userNumbers: userNumbers)
        cnt -= 1
        
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(cnt)")
        
        if strike == 3 {
            print("사용자 승리!")
            return
        }
    }
    print("컴퓨터 승리...!")
}

startGame()
