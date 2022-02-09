//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumber(numberRange: ClosedRange<Int> = (1...9)) -> Int {
    return Int.random(in: numberRange)
}

func generateThreeRandomNumbers() -> [Int] {
    var extractedNumbers: Set<Int> = []
    let limitCount = 3
    
    while extractedNumbers.count != limitCount {
        extractedNumbers.insert(generateRandomNumber())
    }
    
    return Array(extractedNumbers)
}

func judgeBallOrStrike(targetNumbers: [Int], userNumbers: [Int]) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for (userNumberIndex, userNumber) in userNumbers.enumerated() {
        if targetNumbers[userNumberIndex] == userNumber {
            strikeCount += 1
        } else if targetNumbers.contains(userNumber) {
            ballCount += 1
        }
    }
    
    return (strikeCount, ballCount)
}

func startGame() {
    let randomNumbers = generateThreeRandomNumbers()
    var matchCount = 9
    
    while matchCount > .zero {
        let userNumbers = generateThreeRandomNumbers()
        let (strikeCount, ballCount) = judgeBallOrStrike(targetNumbers: randomNumbers, userNumbers: userNumbers)
        
        matchCount -= 1
        
        print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(matchCount)")
        
        if strikeCount == 3 {
            print("사용자 승리!")
            return
        }
    }
    
    print("컴퓨터 승리...!")
}

startGame()
