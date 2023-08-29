//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomComputerNumbers = generateRandomNumbers()
var remainsChance = 9
var userNumbers = [Int]()

func generateRandomNumbers() -> [Int] {
    var numbers = [Int]()
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in:1...9)
        
        if numbers.contains(randomNumber) == false {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}

func compareNumbersAndReturnResult() -> [Int] {
    var ballAndStrikeCount: [Int] = []
    userNumbers = generateRandomNumbers()
    
    var ballCount = 0
    var strikeCount = 0
    
    for index in 0...2 {
        if userNumbers[index] == randomComputerNumbers[index] {
            strikeCount += 1
            ballCount -= 1
        }
        
        if userNumbers.contains(randomComputerNumbers[index]) {
            ballCount += 1
        }
    }
    
    ballAndStrikeCount.append(ballCount)
    ballAndStrikeCount.append(strikeCount)
    
    return ballAndStrikeCount
}

func playGame() {
    while true {
        let resultGameNumbers = compareNumbersAndReturnResult()
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        print("\(resultGameNumbers[1]) 스트라이크, \(resultGameNumbers[0]) 볼")
        
        if resultGameNumbers[1] == 3 {
            print("사용자 승리!")
            break
        } else {
            remainsChance -= 1
        }
        
        if remainsChance == 0 {
            print("컴퓨터 승리...!")
            break
        }

        print("남은 기회 : \(remainsChance) ")
    }
}

playGame()
