//
//  NumberBaseball - main.swift
//  Created by redmango & dasanKim.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerRandomNumbers = [Int]()
var userRandomNumbers = [Int]()
var remainingChance: Int = 9

func creatRandomNumbers() -> [Int] {
    var randomNumbers = [Int]()
    
    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    return randomNumbers
}

func compareComputerNumbers(and userNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for i in 0...2 {
        if computerRandomNumbers.contains(userNumbers[i]) {
            ballCount += 1
        }
        
        if computerRandomNumbers[i] == userNumbers[i] {
            strikeCount += 1
            ballCount -= 1
        }
    }
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func startGame() {
    while remainingChance > 0 {
        userRandomNumbers = creatRandomNumbers()
        let strikeCount: Int = compareComputerNumbers(and: userRandomNumbers).strikeCount
        let ballCount: Int = compareComputerNumbers(and: userRandomNumbers).ballCount
        
        remainingChance -= 1
        
        print("임의의 수 : \(userRandomNumbers[0]) \(userRandomNumbers[1]) \(userRandomNumbers[2])")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if remainingChance > 0 {
            print("남은 기회: \(remainingChance)")
        }
        if strikeCount == 3 {
            print("USER WIN!!")
            break
        }
        if remainingChance == 0 {
            print("COMPUTER WIN!!")
        }
    }
}

computerRandomNumbers = creatRandomNumbers()
startGame()
