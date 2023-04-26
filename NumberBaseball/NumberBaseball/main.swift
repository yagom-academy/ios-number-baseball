//
//  NumberBaseball - main.swift
//  Created by redmango & dasanKim.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func createRandomNumbers() -> [Int] {
    var uniqueRandomNumbers = Set<Int>()
    
    while uniqueRandomNumbers.count < 3 {
        uniqueRandomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(uniqueRandomNumbers)
}

func compare(_ hiddenRandomNumbers: [Int], and userNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0..<hiddenRandomNumbers.count {
        if hiddenRandomNumbers[index] == userNumbers[index] {
            strikeCount += 1
        } else if hiddenRandomNumbers.contains(userNumbers[index]){
            ballCount += 1
        }
    }
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func startBaseballGame() {
    let hiddenRandomNumbers = createRandomNumbers()
    var userRandomNumbers = [Int]()
    var remainingChance: Int = 9
    
    while remainingChance > 0 {
        remainingChance -= 1
        userRandomNumbers = createRandomNumbers()
        
        let gameResult: (strikeCount: Int, ballCount: Int) = compare(hiddenRandomNumbers, and: userRandomNumbers)
        
        print("임의의 수 : \(userRandomNumbers.map{ String($0) }.joined(separator: " "))")
        print("\(gameResult.strikeCount) 스트라이크, \(gameResult.ballCount) 볼")
        
        if gameResult.strikeCount == 3 {
            print("USER WIN!!")
            break
        } else if remainingChance == 0 {
            print("COMPUTER WIN!!")
        } else {
            print("남은 기회: \(remainingChance)")
        }
    }
}

startBaseballGame()
