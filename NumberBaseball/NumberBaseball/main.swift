//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumber() -> Int {
    let numberRange = (1...9)
    return Int.random(in: numberRange)
}

func generateExtractedNumbers() -> [Int] {
    var extractedNumbers: Set<Int> = []
    let limitCount = 3
    
    while extractedNumbers.count != limitCount {
        extractedNumbers.insert(generateRandomNumber())
    }
    
    return Array(extractedNumbers)
}

func judgeBallOrStrike(targetNumbers: [Int], userNumbers: [Int]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    
    for (idx, userNum) in userNumbers.enumerated() {
        if targetNumbers[idx] == userNum {
            strike += 1
        } else if targetNumbers.contains(userNum) {
            ball += 1
        }
    }
    
    return (strike, ball)
}

func startGame() {
    let randomNumbers = generateExtractedNumbers()
    var matchCount = 9
    
    while matchCount > .zero {
        let userNumbers = generateExtractedNumbers()
        let (strike, ball) = judgeBallOrStrike(targetNumbers: randomNumbers, userNumbers: userNumbers)
        
        matchCount -= 1
        
        print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(matchCount)")
        
        if strike == 3 {
            print("사용자 승리!")
            return
        }
    }
    
    print("컴퓨터 승리...!")
}

startGame()
