//
//  NumberBaseball - main.swift
//  Created by redmango & dasanKim.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func creatRandomNumbers() -> [Int] {
    var uniqueRandomNumbers = Set<Int>()
    
    while uniqueRandomNumbers.count < 3 {
        uniqueRandomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(uniqueRandomNumbers)
}

func compare(_ hiddenRandomNumbers: [Int], and userNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0...2 {
        if hiddenRandomNumbers[index] == userNumbers[index] {
            strikeCount += 1
        } else if hiddenRandomNumbers.contains(userNumbers[index]){
            ballCount += 1
        }
    }
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func startBaseballGame() {
    var hiddenRandomNumbers = creatRandomNumbers()
    var userRandomNumbers = [Int]()
    var remainingChance: Int = 9
    
    while remainingChance > 0 {
        remainingChance -= 1
        userRandomNumbers = creatRandomNumbers()
        
        let gameResult = compare(hiddenRandomNumbers, and: userRandomNumbers)
        let strikeCount: Int = gameResult.strikeCount
        let ballCount: Int = gameResult.ballCount
        
        print("임의의 수 : \(userRandomNumbers.map{String($0)}.joined(separator: " "))")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
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
